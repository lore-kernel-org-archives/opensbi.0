From: Green Wan <green.wan@sifive.com>
Date: Thu,  1 Jul 2021 15:39:55 +0800
Subject: [RFC PATCH 1/4] lib: utils: reset: unify naming of 'sifive_test'
 device
In-Reply-To: <20210701073958.15558-1-green.wan@sifive.com>
References: <20210701073958.15558-1-green.wan@sifive.com>
Message-ID: <20210701073958.15558-2-green.wan@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Unify all the file and function names of 'sifive_test' device, to use
the same prefix. This is also a preparatory patch for upcoming sifive
reset device.

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 lib/utils/reset/fdt_reset.c                                   | 4 ++--
 .../reset/{fdt_reset_sifive.c => fdt_reset_sifive_test.c}     | 2 +-
 lib/utils/reset/objects.mk                                    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename lib/utils/reset/{fdt_reset_sifive.c => fdt_reset_sifive_test.c} (94%)

diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 1d687dc..48a49fb 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -12,12 +12,12 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/reset/fdt_reset.h>
 
-extern struct fdt_reset fdt_reset_sifive;
+extern struct fdt_reset fdt_reset_sifive_test;
 extern struct fdt_reset fdt_reset_htif;
 extern struct fdt_reset fdt_reset_thead;
 
 static struct fdt_reset *reset_drivers[] = {
-	&fdt_reset_sifive,
+	&fdt_reset_sifive_test,
 	&fdt_reset_htif,
 	&fdt_reset_thead,
 };
diff --git a/lib/utils/reset/fdt_reset_sifive.c b/lib/utils/reset/fdt_reset_sifive_test.c
similarity index 94%
rename from lib/utils/reset/fdt_reset_sifive.c
rename to lib/utils/reset/fdt_reset_sifive_test.c
index 928dee9..f98f03d 100644
--- a/lib/utils/reset/fdt_reset_sifive.c
+++ b/lib/utils/reset/fdt_reset_sifive_test.c
@@ -30,7 +30,7 @@ static const struct fdt_match sifive_test_reset_match[] = {
 	{ },
 };
 
-struct fdt_reset fdt_reset_sifive = {
+struct fdt_reset fdt_reset_sifive_test = {
 	.match_table = sifive_test_reset_match,
 	.init = sifive_test_reset_init,
 };
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index b6619f4..bf005e8 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -9,6 +9,6 @@
 
 libsbiutils-objs-y += reset/fdt_reset.o
 libsbiutils-objs-y += reset/fdt_reset_htif.o
-libsbiutils-objs-y += reset/fdt_reset_sifive.o
+libsbiutils-objs-y += reset/fdt_reset_sifive_test.o
 libsbiutils-objs-y += reset/fdt_reset_thead.o
 libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
-- 
2.17.1


