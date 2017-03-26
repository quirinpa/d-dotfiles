.PHONY: all install clean

PREFIX ?= /usr

.ifdef SCHEME
.PHONY: selected
.endif

SCHEME ?= colors/kirino

all: xres.h .Xresources

selected:
	# selected $(SCHEME)
	@ln -sf $(SCHEME) selected

.Xresources: default selected
	# made .Xresources
	@cat $> > $@

xres.h: .Xresources
	# made xres.h
	@xrdb -load .Xresources -n | while read line; \
		do \
			if [[ $$line == \** ]]; then \
				echo $$line | cut -c 2- | tr -d '\ \t\.' | { \
					IFS=\: read key val ; \
					echo "#define XRES_$$key \"$$val\"" ; \
				}; \
			fi; \
		done > $@

install:
	cp xres.h ${PREFIX}/include
	# Copy .Xresources to user home, or\
		"cd ~; ln -s $(CURDIR)/.Xresources" as the intended user.

clean:
	rm -r .Xresources xres.h selected
