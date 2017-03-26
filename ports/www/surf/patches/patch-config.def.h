$OpenBSD$
--- config.def.h.orig	Sat Dec 19 14:59:30 2015
+++ config.def.h	Tue Jan 17 18:36:28 2017
@@ -16,9 +16,9 @@ static gfloat zoomlevel = 1.0;       /* Default zoom l
 
 /* Soup default features */
 static char *cookiefile     = "~/.surf/cookies.txt";
-static char *cookiepolicies = "Aa@"; /* A: accept all; a: accept nothing,
+static char *cookiepolicies = "@Aa"; /* A: accept all; a: accept nothing,
                                       * @: accept all except third party */
-static char *cafile         = "/etc/ssl/certs/ca-certificates.crt";
+static char *cafile         = "/etc/ssl/cert.pem";
 static Bool strictssl       = FALSE; /* Refuse untrusted SSL connections */
 static time_t sessiontime   = 3600;
 
@@ -29,11 +29,11 @@ static Bool enablediskcache       = TRUE;
 static int diskcachebytes         = 5 * 1024 * 1024;
 static Bool enableplugins         = TRUE;
 static Bool enablescripts         = TRUE;
-static Bool enableinspector       = TRUE;
+static Bool enableinspector       = FALSE;
 static Bool enablestyle           = TRUE;
 static Bool loadimages            = TRUE;
 static Bool hidebackground        = FALSE;
-static Bool allowgeolocation      = TRUE;
+static Bool allowgeolocation      = FALSE;
 
 #define SETPROP(p, q) { \
 	.v = (char *[]){ "/bin/sh", "-c", \
@@ -47,13 +47,7 @@ static Bool allowgeolocation      = TRUE;
 
 /* DOWNLOAD(URI, referer) */
 #define DOWNLOAD(d, r) { \
-	.v = (char *[]){ "/bin/sh", "-c", \
-	     "st -e /bin/sh -c \"curl -L -J -O --user-agent '$1'" \
-	     " --referer '$2' -b $3 -c $3 '$0';" \
-	     " sleep 5;\"", \
-	     d, useragent, r, cookiefile, NULL \
-	} \
-}
+	.v = (char *[]){ "/bin/sh", "-c", "curl -C - -g -L -J -O --user-agent \"$1\" --referer \"$2\" -b $3 -c $3 \"$0\"; notify-send ~/$(basename $0) Saved", d, useragent, r, cookiefile, NULL }}
 
 /* PLUMB(URI) */
 /* This called when some URI which does not begin with "about:",
@@ -84,6 +78,13 @@ static SiteStyle styles[] = {
  */
 static Key keys[] = {
 	/* modifier             keyval      function    arg             Focus */
+
+	/* bookmark */
+	{ MODKEY, GDK_m, spawn, { .v = (char *[]){ "/bin/sh", "-c", "echo `echo|dmenu -p 'Bookmark Name'` `xprop -id $0 _SURF_URI | cut -d '\"' -f2` >> ~/.config/surfraw/bookmarks", winid, NULL }}},
+
+	/* search using sr - replace page */
+	{ MODKEY, GDK_space, spawn, { .v = (char *[]){ "/bin/sh", "-c", "xprop -id $0 -f _SURF_GO 8s -set _SURF_GO $(asksite)", winid, NULL }}},
+
 	{ MODKEY|GDK_SHIFT_MASK,GDK_r,      reload,     { .b = TRUE } },
 	{ MODKEY,               GDK_r,      reload,     { .b = FALSE } },
 	{ MODKEY|GDK_SHIFT_MASK,GDK_p,      print,      { 0 } },
@@ -91,29 +92,25 @@ static Key keys[] = {
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