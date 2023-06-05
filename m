From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:35 +0530
Subject: [PATCH v2 04/18] lib: sbi: Print scratch size and usage at boot time
In-Reply-To: <20230605113749.230696-1-apatel@ventanamicro.com>
References: <20230605113749.230696-1-apatel@ventanamicro.com>
Message-ID: <20230605113749.230696-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The scratch space being a scarce resource so let us print it's
size and usage at boot time.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_scratch.h |  3 +++
 lib/sbi/sbi_init.c        |  5 +++++
 lib/sbi/sbi_scratch.c     | 11 +++++++++++
 3 files changed, 19 insertions(+)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 9894c70..4801492 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -175,6 +175,9 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size);
 /** Free-up extra space in sbi_scratch */
 void sbi_scratch_free_offset(unsigned long offset);
 
+/** Amount (in bytes) of used space in in sbi_scratch */
+unsigned long sbi_scratch_used_space(void);
+
 /** Get pointer from offset in sbi_scratch */
 #define sbi_scratch_offset_ptr(scratch, offset)	(void *)((char *)(scratch) + (offset))
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a170525..423e6d8 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -128,6 +128,11 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 		   (u32)(sbi_heap_reserved_space() / 1024),
 		   (u32)(sbi_heap_used_space() / 1024),
 		   (u32)(sbi_heap_free_space() / 1024));
+	sbi_printf("Firmware Scratch Size     : "
+		   "%d B (total), %d B (used), %d B (free)\n",
+		   SBI_SCRATCH_SIZE,
+		   (u32)sbi_scratch_used_space(),
+		   (u32)(SBI_SCRATCH_SIZE - sbi_scratch_used_space()));
 
 	/* SBI details */
 	sbi_printf("Runtime SBI Version       : %d.%d\n",
diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index 55ebdbb..87ef84c 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -97,3 +97,14 @@ void sbi_scratch_free_offset(unsigned long offset)
 	 * brain-dead allocator.
 	 */
 }
+
+unsigned long sbi_scratch_used_space(void)
+{
+	unsigned long ret = 0;
+
+	spin_lock(&extra_lock);
+	ret = extra_offset;
+	spin_unlock(&extra_lock);
+
+	return ret;
+}
-- 
2.34.1


