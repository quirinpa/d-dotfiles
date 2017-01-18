.PHONY: all install clean
SCHEME ?= colors/kirino
PREFIX ?= /usr/local

all: xres.h .Xresources

xres.h: cache
	@[ ! -f $@ ] || rm $@
	@ls cache | while read filename; do \
		echo "#define XRES_$$filename \"`cat cache/$$filename`\"" >> $@; \
		done

.Xresources: cache
	@[ ! -f $@ ] || rm $@
	@ls cache | while read filename; do \
		echo "*.$$filename: `cat cache/$$filename`" >> $@; \
		done

cache: ${SCHEME} default
	@[ -d cache ] || mkdir cache
	@cat $(SCHEME) default | while read line; do \
		[[ $$line == \** ]] && \
		echo $$line | cut -c 2- | tr -d '\ \t\.' | \
		{ IFS=\: read key val; echo "$$val" > cache/$$key; } \
		done

install:
	cp xres.h ${PREFIX}/include
	@echo copy .Xresources to user home, or link this one!

clean:
	rm -r cache .Xresources xres.h
