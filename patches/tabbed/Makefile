--- Makefile	2016-12-03 21:27:57.680846488 +0000
+++ /tmp/xres_makefile	2016-12-03 21:28:44.813924480 +0000
@@ -7,7 +7,7 @@
 OBJ = ${SRC:.c=.o}
 BIN = ${OBJ:.o=}
 
-all: options ${BIN}
+all: ${BIN}
 
 options:
 	@echo tabbed build options:
@@ -21,7 +21,7 @@
 
 ${OBJ}: config.h config.mk
 
-config.h:
+config.h: config.def.h $(SCHEME)
 	@echo creating $@ from config.def.h
 	@cp config.def.h $@
 
