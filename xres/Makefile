.PHONY: all install clean
SCHEME ?= colors/kirino
PREFIX ?= /usr

all: xres.h .Xresources

.Xresources:
	@cat default $(SCHEME) > $@

xres.h: .Xresources
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
	rm -r .Xresources xres.h
