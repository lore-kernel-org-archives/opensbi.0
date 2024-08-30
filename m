From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:49:15 -0700
Subject: [PATCH 11/12] lib: sbi: Update sbi_{entry,init}_count() to take a hart index
In-Reply-To: <20240830154929.3971790-1-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com>
Message-ID: <20240830154929.3971790-12-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

All callers already have the hartindex available, so this removes a
hartid to hartindex conversion.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_init.h         | 4 ++--
 lib/sbi/sbi_hsm.c              | 4 ++--
 lib/sbi/sbi_init.c             | 8 ++++----
 platform/generic/andes/ae350.c | 6 ++++--
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_init.h b/include/sbi/sbi_init.h
index 9640fee9..c9013ea4 100644
--- a/include/sbi/sbi_init.h
+++ b/include/sbi/sbi_init.h
@@ -16,9 +16,9 @@ struct sbi_scratch;
 
 void __noreturn sbi_init(struct sbi_scratch *scratch);
 
-unsigned long sbi_entry_count(u32 hartid);
+unsigned long sbi_entry_count(u32 hartindex);
 
-unsigned long sbi_init_count(u32 hartid);
+unsigned long sbi_init_count(u32 hartindex);
 
 void __noreturn sbi_exit(struct sbi_scratch *scratch);
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index e7e31ad5..5679819c 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -324,8 +324,8 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	if (!hsm_start_ticket_acquire(hdata))
 		return SBI_EINVAL;
 
-	init_count = sbi_init_count(hartid);
-	entry_count = sbi_entry_count(hartid);
+	init_count = sbi_init_count(hartindex);
+	entry_count = sbi_entry_count(hartindex);
 
 	rscratch->next_arg1 = arg1;
 	rscratch->next_addr = saddr;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 7443010e..18d33088 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -551,7 +551,7 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 		init_warmboot(scratch, hartid);
 }
 
-unsigned long sbi_entry_count(u32 hartid)
+unsigned long sbi_entry_count(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
 	unsigned long *entry_count;
@@ -559,7 +559,7 @@ unsigned long sbi_entry_count(u32 hartid)
 	if (!entry_count_offset)
 		return 0;
 
-	scratch = sbi_hartid_to_scratch(hartid);
+	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch)
 		return 0;
 
@@ -568,7 +568,7 @@ unsigned long sbi_entry_count(u32 hartid)
 	return *entry_count;
 }
 
-unsigned long sbi_init_count(u32 hartid)
+unsigned long sbi_init_count(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
 	unsigned long *init_count;
@@ -576,7 +576,7 @@ unsigned long sbi_init_count(u32 hartid)
 	if (!init_count_offset)
 		return 0;
 
-	scratch = sbi_hartid_to_scratch(hartid);
+	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch)
 		return 0;
 
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 3ad6c856..0da3ae51 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -27,13 +27,15 @@ extern void __ae350_disable_coherency(void);
 
 static int ae350_hart_start(u32 hartid, ulong saddr)
 {
+	u32 hartindex = sbi_hartid_to_hartindex(hartid);
+
 	/*
 	 * Don't send wakeup command when:
 	 * 1) boot-time
 	 * 2) the target hart is non-sleepable 25-series hart0
 	 */
-	if (!sbi_init_count(hartid) || (is_andes(25) && hartid == 0))
-		return sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid));
+	if (!sbi_init_count(hartindex) || (is_andes(25) && hartid == 0))
+		return sbi_ipi_raw_send(hartindex);
 
 	/* Write wakeup command to the sleep hart */
 	smu_set_command(&smu, WAKEUP_CMD, hartid);
-- 
2.45.1


