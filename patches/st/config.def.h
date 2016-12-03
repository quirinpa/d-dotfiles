--- config.def.h	2016-11-20 18:53:23.121150684 +0000
+++ config.h	2016-12-02 22:50:33.293427025 +0000
@@ -5,8 +5,9 @@
  *
  * font: see http://freedesktop.org/software/fontconfig/fontconfig-user.html
  */
-static char font[] = "Liberation Mono:pixelsize=12:antialias=true:autohint=true";
-static int borderpx = 2;
+#include "xres.h"
+static char font[] = XRES_font;
+static int borderpx = 0;
 
 /*
  * What program is execed by st depends of these precedence rules:
@@ -39,7 +40,7 @@
 static unsigned int tripleclicktimeout = 600;
 
 /* alt screens */
-static int allowaltscreen = 1;
+static int allowaltscreen = 0;
 
 /* frames per second st should at maximum draw to the screen */
 static unsigned int xfps = 120;
@@ -85,30 +86,29 @@
 /* Terminal colors (16 first used in escape sequence) */
 static const char *colorname[] = {
 	/* 8 normal colors */
-	"black",
-	"red3",
-	"green3",
-	"yellow3",
-	"blue2",
-	"magenta3",
-	"cyan3",
-	"gray90",
-
-	/* 8 bright colors */
-	"gray50",
-	"red",
-	"green",
-	"yellow",
-	"#5c5cff",
-	"magenta",
-	"cyan",
-	"white",
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
 
 	[255] = 0,
 
 	/* more colors can be added after 255 to use with DefaultXX */
-	"#cccccc",
-	"#555555",
+	XRES_cursorColor,
+	XRES_foreground,
+	XRES_background,
 };
 
 
@@ -116,10 +116,10 @@
  * Default colors (colorname index)
  * foreground, background, cursor, reverse cursor
  */
-static unsigned int defaultfg = 7;
-static unsigned int defaultbg = 0;
+static unsigned int defaultfg = 257;
+static unsigned int defaultbg = 258;
 static unsigned int defaultcs = 256;
-static unsigned int defaultrcs = 257;
+static unsigned int defaultrcs = 256;
 
 /*
  * Default shape of cursor
