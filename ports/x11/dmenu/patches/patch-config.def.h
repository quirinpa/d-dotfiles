$OpenBSD: patch-config_def_h,v 1.1 2015/11/11 09:23:20 jung Exp $
--- config.def.h.orig	Sun Nov  8 22:42:21 2015
+++ config.def.h	Tue Jan 17 23:32:46 2017
@@ -1,17 +1,18 @@
 /* See LICENSE file for copyright and license details. */
 /* Default settings; can be overriden by command line. */
 
+#include "xres.h"
 static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
 /* -fn option overrides fonts[0]; default X11 font or font set */
 static const char *fonts[] = {
-	"monospace:size=10"
+	XRES_font
 };
 static const char *prompt      = NULL;      /* -p  option; prompt to the elft of input field */
-static const char *normbgcolor = "#222222"; /* -nb option; normal background                 */
-static const char *normfgcolor = "#bbbbbb"; /* -nf option; normal foreground                 */
-static const char *selbgcolor  = "#005577"; /* -sb option; selected background               */
-static const char *selfgcolor  = "#eeeeee"; /* -sf option; selected foreground               */
-static const char *outbgcolor  = "#00ffff";
-static const char *outfgcolor  = "#000000";
+static const char *normbgcolor = XRES_background; /* -nb option; normal background                 */
+static const char *normfgcolor = XRES_foreground; /* -nf option; normal foreground                 */
+static const char *selbgcolor  = XRES_color11; /* -sb option; selected background               */
+static const char *selfgcolor  = XRES_background; /* -sf option; selected foreground               */
+static const char *outbgcolor  = XRES_color2;
+static const char *outfgcolor  = XRES_color8;
 /* -l option; if nonzero, dmenu uses vertical list with given number of lines */
 static unsigned int lines      = 0;
