--- Makefile	2016-12-03 19:22:30.198293029 +0000
+++ Makefile2	2016-12-03 19:22:07.555082364 +0000
@@ -6,7 +6,7 @@
 SRC = st.c
 OBJ = ${SRC:.c=.o}
 
-all: options st
+all: st
 
 options:
 	@echo st build options:
@@ -14,7 +14,7 @@
 	@echo "LDFLAGS  = ${LDFLAGS}"
 	@echo "CC       = ${CC}"
 
-config.h:
+config.h: config.def.h $(SCHEME)
 	cp config.def.h config.h
 
 .c.o:
