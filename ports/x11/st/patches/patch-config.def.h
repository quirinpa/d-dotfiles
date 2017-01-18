$OpenBSD: patch-config_def_h,v 1.7 2015/07/09 22:07:23 czarkoff Exp $
--- config.def.h.orig	Tue Jul  7 21:26:44 2015
+++ config.def.h	Tue Jan 17 21:15:30 2017
@@ -5,9 +5,10 @@
  *
  * font: see http://freedesktop.org/software/fontconfig/fontconfig-user.html
  */
-static char font[] = "Liberation Mono:pixelsize=12:antialias=false:autohint=false";
+#include "xres.h"
+static char font[] = XRES_font;
 static int borderpx = 2;
-static char shell[] = "/bin/sh";
+static char shell[] = "/bin/ksh";
 static char *utmp = NULL;
 static char stty_args[] = "stty raw -echo -iexten echonl";
 
@@ -61,30 +62,29 @@ static unsigned int tabspaces = 8;
 
 /* Terminal colors (16 first used in escape sequence) */
 static const char *colorname[] = {
-	/* 8 normal colors */
-	"black",
-	"red3",
-	"green3",
-	"yellow3",
-	"blue2",
-	"magenta3",
-	"cyan3",
-	"gray90",
+	XRES_color0,
+	XRES_color1,
+	XRES_color2,
+	XRES_color3,
+	XRES_color4,
+	XRES_color5,
+	XRES_color6,
+	XRES_color7,
+	XRES_color8,
+	XRES_color9,
+	XRES_color10,
+	XRES_color11,
+	XRES_color12,
+	XRES_color13,
+	XRES_color14,
+	XRES_color15,
 
-	/* 8 bright colors */
-	"gray50",
-	"red",
-	"green",
-	"yellow",
-	"#5c5cff",
-	"magenta",
-	"cyan",
-	"white",
-
 	[255] = 0,
 
 	/* more colors can be added after 255 to use with DefaultXX */
-	"#cccccc",
+	XRES_cursorColor,
+	XRES_foreground,
+	XRES_background,
 };
 
 
