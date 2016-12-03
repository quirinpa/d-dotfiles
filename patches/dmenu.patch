--- config.def.h	2016-07-17 02:39:28.786048477 +0100
+++ config.h	2016-09-22 19:26:39.074878973 +0100
@@ -2,16 +2,23 @@
 /* Default settings; can be overriden by command line. */
 
 static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
+
+
+#include "xres.h"
+
 /* -fn option overrides fonts[0]; default X11 font or font set */
 static const char *fonts[] = {
-	"monospace:size=10"
+	/* XRES_font */
+	"Fixed:style=Regular:pixelsize=14"
 };
+
 static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
+
 static const char *colors[SchemeLast][2] = {
 	/*     fg         bg       */
-	[SchemeNorm] = { "#bbbbbb", "#222222" },
-	[SchemeSel] = { "#eeeeee", "#005577" },
-	[SchemeOut] = { "#000000", "#00ffff" },
+	[SchemeNorm] = { XRES_foreground , XRES_background },
+	[SchemeSel] = { XRES_background, XRES_color11 },
+	[SchemeOut] = { XRES_color2, XRES_color8 },
 };
 /* -l option; if nonzero, dmenu uses vertical list with given number of lines */
 static unsigned int lines      = 0;
