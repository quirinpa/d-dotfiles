--- Makefile	2016-12-03 19:01:42.398386274 +0000
+++ Makefile2	2016-12-03 19:03:01.124626444 +0000
@@ -6,7 +6,7 @@
 SRC = surf.c
 OBJ = ${SRC:.c=.o}
 
-all: options surf
+all: surf
 
 options:
 	@echo surf build options:
@@ -20,7 +20,7 @@
 
 ${OBJ}: config.h config.mk
 
-config.h:
+config.h: config.def.h /tmp/xcolorsha
 	@echo creating $@ from config.def.h
 	@cp config.def.h $@
 
