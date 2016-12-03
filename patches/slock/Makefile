--- Makefile	2016-12-03 19:45:21.594196873 +0000
+++ /tmp/topatch	2016-12-03 19:50:24.775887730 +0000
@@ -6,7 +6,7 @@
 SRC = slock.c ${COMPATSRC}
 OBJ = ${SRC:.c=.o}
 
-all: options slock
+all: slock
 
 options:
 	@echo slock build options:
@@ -20,7 +20,7 @@
 
 ${OBJ}: config.h config.mk arg.h util.h
 
-config.h:
+config.h: config.def.h $(SCHEME)
 	@echo creating $@ from config.def.h
 	@cp config.def.h $@
 
