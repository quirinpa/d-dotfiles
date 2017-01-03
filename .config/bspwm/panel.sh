#! /bin/ksh

set -e
# COLORS ################################################
pc_background=`xget background`
pc_not_background=`xget color14`
pc_foreground=`xget foreground`
pc_neutral=`xget color12`
pc_urgent=`xget color9`
pc_good=`xget color10`
pc_workspace_empty=`xget color5`
pc_workspace_occupied=`xget color13`
pc_workspace_urgent=`xget color9`
p_font=`xget font||echo`

# PANEL BAR #############################################
num_mon=$(bspc query -M | wc -l)
format_bspwm_bar(){
	while read -r line ; do
		case $line in
			E*)
				extra=${line#E}
				;;
			T*)
				title="%{F$pc_foreground} ${line#?} %{F-}"
				;;
			W*)
				# bspwm's state
				IFS=':'
				wm=''
				set -- ${line#?}
				while [ $# -gt 0 ] ; do
					item=$1
					name=${item#?}
					case $item in
						[mM]*)
							color=$pc_not_background
							[ $num_mon -lt 2 ] && shift && continue
							case $item in
								m*)
									# monitor
									FG=$color
									BG=$pc_background
									;;
								M*)
									# focused monitor
									BG=$color
									FG=$pc_background
									;;
							esac
							[ -z "$wm" ] || wm="$wm%{c}${title}%{r}${extra}%{S+}"
							wm=$wm"%{l}%{F${FG}}%{B${BG}}%{A:bspc monitor -f ${name}:}${name}%{A}%{B-}%{F-}"
							;;
						[fFoOuU]*)
							local icon
							case $item in
								[fF]*)
									color=$pc_workspace_empty
									icon=" "
									;;
								[oO]*)
									color=$pc_workspace_occupied
									icon="."
									;;
								[uU]*)
									color=$pc_workspace_urgent
									icon="!"
									;;
							esac
							case $item in
								[FOU]*)
									FG=$pc_background
									BG=$color
									;;
								*)
									BG=$pc_background
									FG=$color
									;;
							esac
							wm=$wm"%{F${FG}}%{B${BG}}$icon%{B-}%{F-}"
							;;
						[LTG]*)
							# layout, state and flags
							wm=$wm"%{F$pc_workspace_occupied} ${name} %{F-}"
							;;
					esac
					shift
				done
				;;
		esac
		printf "%s\n" "${wm}%{c}${title}%{r}${extra}"
	done
}

# # PANEL ##############################################k
icon () { echo -ne " %{F${2}}$1%{F-} "; }
icond() { icon $1 $pc_neutral; }

PANEL_HEIGHT=14
bspc config top_padding $PANEL_HEIGHT
trap "bspc config top_padding 0; trap - TERM; rm $PANEL_FIFO; kill 0" INT TERM QUIT EXIT

export PANEL_FIFO="/tmp/panel-fifo"
[ -e "$PANEL_FIFO" ] && rm $PANEL_FIFO
mkfifo "$PANEL_FIFO"

bspc subscribe report > "$PANEL_FIFO" &

xtitle -s -f 'T%s' -t 20 > "$PANEL_FIFO" &

while true; do
	echo E$(
	#NETWORK STATUS
		ping -c 1 google.com >/dev/null && icon Y $pc_good || icon Y $pc_urgent

	#VOLUME
		icond V && echo -n `amixer sget Master | grep -Po "\d+%"`

	#BATTERY STATUS
		bat=/sys/class/power_supply/BAT0
		[ ! -e $bat ] || (
			grep -q "Ch\|Fu" $bat/status && icond P || icond B
			echo -n `cat $bat/capacity`%
		)

	#DATE
		icond D && date +"%d/%m"

	#TIME
		icond T && date +"%H:%M"
	) > "$PANEL_FIFO"
	sleep 60
done &

format_bspwm_bar < "$PANEL_FIFO" | \
	lemonbar -a 32 -n "$PANEL_WM_NAME" -g x$PANEL_HEIGHT \
	-f "$p_font" -F "$pc_foreground" -B "$pc_background" &

wait
