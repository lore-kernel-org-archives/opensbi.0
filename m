From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Mar 2023 21:29:23 +0530
Subject: [PATCH 1/2] lib: sbi: Introduce sbi_entry_count() function
Message-ID: <20230320155924.950465-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We introduce sbi_entry_count() function which counts the number
of times a HART enters OpenSBI via cold-boot or warm-boot path.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_init.h |  2 ++
 lib/sbi/sbi_init.c     | 42 +++++++++++++++++++++++++++++++++++-------
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_init.h b/include/sbi/sbi_init.h
index 74eb1c0..9640fee 100644
--- a/include/sbi/sbi_init.h
+++ b/include/sbi/sbi_init.h
@@ -16,6 +16,8 @@ struct sbi_scratch;
 
 void __noreturn sbi_init(struct sbi_scratch *scratch);
 
+unsigned long sbi_entry_count(u32 hartid);
+
 unsigned long sbi_init_count(u32 hartid);
 
 void __noreturn sbi_exit(struct sbi_scratch *scratch);
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index ffa214c..f184248 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -238,12 +238,13 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 	spin_unlock(&coldboot_lock);
 }
 
+static unsigned long entry_count_offset;
 static unsigned long init_count_offset;
 
 static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 {
 	int rc;
-	unsigned long *init_count;
+	unsigned long *count;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	/* Note: This has to be first thing in coldboot init sequence */
@@ -256,10 +257,17 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	entry_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
+	if (!entry_count_offset)
+		sbi_hart_hang();
+
 	init_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
 	if (!init_count_offset)
 		sbi_hart_hang();
 
+	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
+	(*count)++;
+
 	rc = sbi_hsm_init(scratch, hartid, true);
 	if (rc)
 		sbi_hart_hang();
@@ -352,8 +360,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	wake_coldboot_harts(scratch, hartid);
 
-	init_count = sbi_scratch_offset_ptr(scratch, init_count_offset);
-	(*init_count)++;
+	count = sbi_scratch_offset_ptr(scratch, init_count_offset);
+	(*count)++;
 
 	sbi_hsm_hart_start_finish(scratch, hartid);
 }
@@ -362,12 +370,15 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 					 u32 hartid)
 {
 	int rc;
-	unsigned long *init_count;
+	unsigned long *count;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
-	if (!init_count_offset)
+	if (!entry_count_offset || !init_count_offset)
 		sbi_hart_hang();
 
+	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
+	(*count)++;
+
 	rc = sbi_hsm_init(scratch, hartid, false);
 	if (rc)
 		sbi_hart_hang();
@@ -408,8 +419,8 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
-	init_count = sbi_scratch_offset_ptr(scratch, init_count_offset);
-	(*init_count)++;
+	count = sbi_scratch_offset_ptr(scratch, init_count_offset);
+	(*count)++;
 
 	sbi_hsm_hart_start_finish(scratch, hartid);
 }
@@ -521,6 +532,23 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 		init_warmboot(scratch, hartid);
 }
 
+unsigned long sbi_entry_count(u32 hartid)
+{
+	struct sbi_scratch *scratch;
+	unsigned long *entry_count;
+
+	if (!entry_count_offset)
+		return 0;
+
+	scratch = sbi_hartid_to_scratch(hartid);
+	if (!scratch)
+		return 0;
+
+	entry_count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
+
+	return *entry_count;
+}
+
 unsigned long sbi_init_count(u32 hartid)
 {
 	struct sbi_scratch *scratch;
-- 
2.34.1


