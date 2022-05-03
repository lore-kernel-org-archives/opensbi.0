From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:53 +0530
Subject: [PATCH 05/11] lib: utils/timer: Generate FDT timer driver list at
 compile-time
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-6-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having FDT timer driver list hard-coded in the C source,
we generate it using carray.sh at compile-time.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/timer/fdt_timer.c              | 12 +++++-------
 lib/utils/timer/fdt_timer_drivers.carray |  3 +++
 lib/utils/timer/objects.mk               |  4 ++++
 3 files changed, 12 insertions(+), 7 deletions(-)
 create mode 100644 lib/utils/timer/fdt_timer_drivers.carray

diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
index 781bb63..4695c0f 100644
--- a/lib/utils/timer/fdt_timer.c
+++ b/lib/utils/timer/fdt_timer.c
@@ -12,11 +12,9 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/timer/fdt_timer.h>
 
-extern struct fdt_timer fdt_timer_mtimer;
-
-static struct fdt_timer *timer_drivers[] = {
-	&fdt_timer_mtimer
-};
+/* List of FDT timer drivers generated at compile time */
+extern struct fdt_timer *fdt_timer_drivers[];
+extern unsigned long fdt_timer_drivers_size;
 
 static struct fdt_timer dummy = {
 	.match_table = NULL,
@@ -47,8 +45,8 @@ static int fdt_timer_cold_init(void)
 	const struct fdt_match *match;
 	void *fdt = fdt_get_address();
 
-	for (pos = 0; pos < array_size(timer_drivers); pos++) {
-		drv = timer_drivers[pos];
+	for (pos = 0; pos < fdt_timer_drivers_size; pos++) {
+		drv = fdt_timer_drivers[pos];
 
 		noff = -1;
 		while ((noff = fdt_find_match(fdt, noff,
diff --git a/lib/utils/timer/fdt_timer_drivers.carray b/lib/utils/timer/fdt_timer_drivers.carray
new file mode 100644
index 0000000..c62ee73
--- /dev/null
+++ b/lib/utils/timer/fdt_timer_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/timer/fdt_timer.h
+TYPE: struct fdt_timer
+NAME: fdt_timer_drivers
diff --git a/lib/utils/timer/objects.mk b/lib/utils/timer/objects.mk
index 12cffcf..bc4073d 100644
--- a/lib/utils/timer/objects.mk
+++ b/lib/utils/timer/objects.mk
@@ -8,5 +8,9 @@
 #
 
 libsbiutils-objs-y += timer/aclint_mtimer.o
+
 libsbiutils-objs-y += timer/fdt_timer.o
+libsbiutils-objs-y += timer/fdt_timer_drivers.o
+
+carray-fdt_timer_drivers-y += fdt_timer_mtimer
 libsbiutils-objs-y += timer/fdt_timer_mtimer.o
-- 
2.34.1


