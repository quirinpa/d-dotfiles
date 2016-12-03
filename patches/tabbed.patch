--- config.def.h	2016-07-17 03:02:50.351788877 +0100
+++ config.h	2016-12-03 01:16:36.975950081 +0000
@@ -1,13 +1,14 @@
 /* See LICENSE file for copyright and license details. */
 
 /* appearance */
-static const char font[]        = "monospace:size=9";
-static const char* normbgcolor  = "#222222";
-static const char* normfgcolor  = "#cccccc";
-static const char* selbgcolor   = "#555555";
-static const char* selfgcolor   = "#ffffff";
-static const char* urgbgcolor   = "#111111";
-static const char* urgfgcolor   = "#cc0000";
+#include "xres.h"
+static const char font[]        = XRES_font;
+static const char* normbgcolor  = XRES_background;
+static const char* normfgcolor  = XRES_foreground;
+static const char* selbgcolor   = XRES_color13;
+static const char* selfgcolor   = XRES_color8;
+static const char* urgbgcolor   = XRES_color0;
+static const char* urgfgcolor   = XRES_color9;
 static const char before[]      = "<";
 static const char after[]       = ">";
 static const char titletrim[]   = "...";
