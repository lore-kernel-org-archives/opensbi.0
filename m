From: Samuel Holland <samuel@sholland.org>
Date: Wed,  8 Sep 2021 21:10:08 -0500
Subject: [PATCH 1/2] lib: utils/reset: Sort fdt_reset driver list
Message-ID: <20210909021009.29553-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In preparation for adding a new fdt_reset driver, ensure the existing
lists are sorted alphabetically.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 lib/utils/reset/fdt_reset.c | 4 ++--
 lib/utils/reset/objects.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 0d84dc2..7f4b02a 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -14,15 +14,15 @@
 
 extern struct fdt_reset fdt_poweroff_gpio;
 extern struct fdt_reset fdt_reset_gpio;
-extern struct fdt_reset fdt_reset_sifive_test;
 extern struct fdt_reset fdt_reset_htif;
+extern struct fdt_reset fdt_reset_sifive_test;
 extern struct fdt_reset fdt_reset_thead;
 
 static struct fdt_reset *reset_drivers[] = {
 	&fdt_poweroff_gpio,
 	&fdt_reset_gpio,
-	&fdt_reset_sifive_test,
 	&fdt_reset_htif,
+	&fdt_reset_sifive_test,
 	&fdt_reset_thead,
 };
 
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index 4215396..bb33179 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -10,6 +10,6 @@
 libsbiutils-objs-y += reset/fdt_reset.o
 libsbiutils-objs-y += reset/fdt_reset_gpio.o
 libsbiutils-objs-y += reset/fdt_reset_htif.o
+libsbiutils-objs-y += reset/fdt_reset_sifive_test.o
 libsbiutils-objs-y += reset/fdt_reset_thead.o
 libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
-libsbiutils-objs-y += reset/fdt_reset_sifive_test.o
-- 
2.31.1


