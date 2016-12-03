--- config.def.h	2016-12-03 17:32:42.590647830 +0000
+++ config.h	2016-12-03 18:11:52.384584570 +0000
@@ -19,7 +19,7 @@
 static char *cookiepolicies = "Aa@"; /* A: accept all; a: accept nothing,
                                       * @: accept all except third party */
 static char *cafile         = "/etc/ssl/certs/ca-certificates.crt";
-static Bool strictssl       = FALSE; /* Refuse untrusted SSL connections */
+static Bool strictssl       = TRUE; /* Refuse untrusted SSL connections */
 static time_t sessiontime   = 3600;
 
 /* Webkit default features */
@@ -33,7 +33,7 @@
 static Bool enablestyle           = TRUE;
 static Bool loadimages            = TRUE;
 static Bool hidebackground        = FALSE;
-static Bool allowgeolocation      = TRUE;
+static Bool allowgeolocation      = FALSE;
 
 #define SETPROP(p, q) { \
 	.v = (char *[]){ "/bin/sh", "-c", \
@@ -47,13 +47,7 @@
 
 /* DOWNLOAD(URI, referer) */
 #define DOWNLOAD(d, r) { \
-	.v = (char *[]){ "/bin/sh", "-c", \
-	     "st -e /bin/sh -c \"curl -g -L -J -O --user-agent '$1'" \
-	     " --referer '$2' -b $3 -c $3 '$0';" \
-	     " sleep 5;\"", \
-	     d, useragent, r, cookiefile, NULL \
-	} \
-}
+	.v = (char *[]){ "/bin/sh", "-c", "curl -C - -g -L -J -O --user-agent \"$1\" --referer \"$2\" -b $3 -c $3 \"$0\"; xdg-open $(basename $0)", d, useragent, r, cookiefile, NULL }}
 
 /* PLUMB(URI) */
 /* This called when some URI which does not begin with "about:",
@@ -84,6 +78,13 @@
  */
 static Key keys[] = {
 	/* modifier             keyval      function    arg             Focus */
+
+	/* bookmark */
+	{ MODKEY, GDK_m, spawn, { .v = (char *[]){ "/bin/sh", "-c", "echo `echo|dmenu -p 'Bookmark Name'` `xprop -id $0 _SURF_URI | cut -d '\"' -f2` >> ~/.config/surfraw/bookmarks", winid, NULL }}},
+
+	/* search using sr - replace page */
+	{ MODKEY, GDK_space, spawn, { .v = (char *[]){ "/bin/sh", "-c", "xprop -id $0 -f _SURF_GO 8s -set _SURF_GO $(BROWSER=echo sr $(sr -elvi | awk '{print $1}'| dmenu -p rsr))", winid, NULL }}},
+
 	{ MODKEY|GDK_SHIFT_MASK,GDK_r,      reload,     { .b = TRUE } },
 	{ MODKEY,               GDK_r,      reload,     { .b = FALSE } },
 	{ MODKEY|GDK_SHIFT_MASK,GDK_p,      print,      { 0 } },
@@ -91,29 +92,25 @@
 	{ MODKEY,               GDK_p,      clipboard,  { .b = TRUE } },
 	{ MODKEY,               GDK_y,      clipboard,  { .b = FALSE } },
 
-	{ MODKEY|GDK_SHIFT_MASK,GDK_j,      zoom,       { .i = -1 } },
-	{ MODKEY|GDK_SHIFT_MASK,GDK_k,      zoom,       { .i = +1 } },
-	{ MODKEY|GDK_SHIFT_MASK,GDK_q,      zoom,       { .i = 0  } },
+	{ MODKEY,               GDK_equal, zoom,       { .i = 0  } },
 	{ MODKEY,               GDK_minus,  zoom,       { .i = -1 } },
 	{ MODKEY,               GDK_plus,   zoom,       { .i = +1 } },
 
-	{ MODKEY,               GDK_l,      navigate,   { .i = +1 } },
-	{ MODKEY,               GDK_h,      navigate,   { .i = -1 } },
+	{ MODKEY,               GDK_b,      navigate,   { .i = -1 } },
+	{ MODKEY,               GDK_f,      navigate,   { .i = +1 } },
 
-	{ MODKEY,               GDK_j,      scroll_v,   { .i = +1 } },
 	{ MODKEY,               GDK_k,      scroll_v,   { .i = -1 } },
-	{ MODKEY,               GDK_b,      scroll_v,   { .i = -10000 } },
-	{ MODKEY,               GDK_space,  scroll_v,   { .i = +10000 } },
-	{ MODKEY,               GDK_i,      scroll_h,   { .i = +1 } },
-	{ MODKEY,               GDK_u,      scroll_h,   { .i = -1 } },
+	{ MODKEY,               GDK_j,      scroll_v,   { .i = +1 } },
+	{ MODKEY,               GDK_u,      scroll_v,   { .i = -10000 } },
+	{ MODKEY,               GDK_d,      scroll_v,   { .i = +10000 } },
+	{ MODKEY,               GDK_h,      scroll_h,   { .i = -1 } },
+	{ MODKEY,               GDK_l,      scroll_h,   { .i = +1 } },
 
-	{ 0,                    GDK_F11,    fullscreen, { 0 } },
 	{ 0,                    GDK_Escape, stop,       { 0 } },
 	{ MODKEY,               GDK_o,      source,     { 0 } },
 	{ MODKEY|GDK_SHIFT_MASK,GDK_o,      inspector,  { 0 } },
 
 	{ MODKEY,               GDK_g,      spawn,      SETPROP("_SURF_URI", "_SURF_GO") },
-	{ MODKEY,               GDK_f,      spawn,      SETPROP("_SURF_FIND", "_SURF_FIND") },
 	{ MODKEY,               GDK_slash,  spawn,      SETPROP("_SURF_FIND", "_SURF_FIND") },
 
 	{ MODKEY,               GDK_n,      find,       { .b = TRUE } },
