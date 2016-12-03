#!/bin/awk -f
{
	if ($0 ~ /bold/)
	{
		n=gensub(/.*ctermfg=([0-9]+).*/,"\\1","1",$0)
		n+=8
		cterm=gensub(/.*cterm=([a-zA-Z]*),*bold,*([a-zA-Z,]*).*/, "\\1\\2", "1", $0)

		if (cterm != "")
			cterm="cterm="cterm

		print gensub(/(.*ctermfg=)[0-9]+(.*)cterm=[a-zA-Z,]+(.*)/, "\\1"n"\\2"cterm"\\3", "1",$0)
	}
	else
		print $0
}

