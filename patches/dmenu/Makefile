--- dmenu/Makefile	2016-12-03 19:43:05.198269126 +0000
+++ /tmp/topatch	2016-12-03 19:44:11.081245541 +0000
@@ -6,7 +6,7 @@
 SRC = drw.c dmenu.c stest.c util.c
 OBJ = ${SRC:.c=.o}
 
-all: options dmenu stest
+all: dmenu stest
 
 options:
 	@echo dmenu build options:
@@ -18,7 +18,7 @@
 	@echo CC $<
 	@${CC} -c ${CFLAGS} $<
 
-config.h:
+config.h: config.def.h /tmp/xcolorsha
 	@echo creating $@ from config.def.h
 	@cp config.def.h $@
 
