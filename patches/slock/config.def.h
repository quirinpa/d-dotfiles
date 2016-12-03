--- config.def.h	2016-12-03 19:47:50.890054734 +0000
+++ config.h	2016-12-03 19:47:28.583508912 +0000
@@ -2,11 +2,11 @@
 static const char *user  = "nobody";
 static const char *group = "nogroup";
 
+#include "xres.h"
+/* treat a cleared input like a wrong password */
+static const int failonclear = 1;
 static const char *colorname[NUMCOLS] = {
-	[INIT] =   "black",     /* after initialization */
-	[INPUT] =  "#005577",   /* during input */
-	[FAILED] = "#CC3333",   /* wrong password */
+	[INIT] = XRES_color4,     /* after initialization */
+	[INPUT] = XRES_color13,   /* during input */
+	[FAILED] = XRES_color10   /* wrong password */
 };
-
-/* treat a cleared input like a wrong password (color) */
-static const int failonclear = 1;
