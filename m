From: Clément Léger <cleger@rivosinc.com>
Date: Tue,  9 Apr 2024 12:02:02 +0200
Subject: [PATCH 1/7] lib: sbi: sse: fix typos, comments and spacing errors
In-Reply-To: <20240409100216.263256-1-cleger@rivosinc.com>
References: <20240409100216.263256-1-cleger@rivosinc.com>
Message-ID: <20240409100216.263256-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix some errors spotted by Samuel while reviewing the SSE implementation.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reported-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi/sbi_ecall_interface.h | 24 ++++++++++++------------
 lib/sbi/sbi_sse.c                 | 22 +++++++++++-----------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index a511e0b..2600b66 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -344,36 +344,36 @@ enum sbi_sse_attr_id {
 #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
 
 enum sbi_sse_state {
-	SBI_SSE_STATE_UNUSED     = 0,
-	SBI_SSE_STATE_REGISTERED = 1,
-	SBI_SSE_STATE_ENABLED    = 2,
-	SBI_SSE_STATE_RUNNING    = 3,
+	SBI_SSE_STATE_UNUSED		= 0,
+	SBI_SSE_STATE_REGISTERED	= 1,
+	SBI_SSE_STATE_ENABLED		= 2,
+	SBI_SSE_STATE_RUNNING		= 3,
 };
 
 /* SBI SSE Event IDs. */
 #define SBI_SSE_EVENT_LOCAL_RAS			0x00000000
-#define	SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
+#define SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
 #define SBI_SSE_EVENT_LOCAL_PLAT_0_END		0x00007fff
 #define SBI_SSE_EVENT_GLOBAL_RAS		0x00008000
-#define	SBI_SSE_EVENT_GLOBAL_PLAT_0_START	0x00004000
+#define SBI_SSE_EVENT_GLOBAL_PLAT_0_START	0x00004000
 #define SBI_SSE_EVENT_GLOBAL_PLAT_0_END		0x00007fff
 
 #define SBI_SSE_EVENT_LOCAL_PMU			0x00010000
-#define	SBI_SSE_EVENT_LOCAL_PLAT_1_START	0x00014000
+#define SBI_SSE_EVENT_LOCAL_PLAT_1_START	0x00014000
 #define SBI_SSE_EVENT_LOCAL_PLAT_1_END		0x00017fff
-#define	SBI_SSE_EVENT_GLOBAL_PLAT_1_START	0x0001c000
+#define SBI_SSE_EVENT_GLOBAL_PLAT_1_START	0x0001c000
 #define SBI_SSE_EVENT_GLOBAL_PLAT_1_END		0x0001ffff
 
-#define	SBI_SSE_EVENT_LOCAL_PLAT_2_START	0x00024000
+#define SBI_SSE_EVENT_LOCAL_PLAT_2_START	0x00024000
 #define SBI_SSE_EVENT_LOCAL_PLAT_2_END		0x00027fff
-#define	SBI_SSE_EVENT_GLOBAL_PLAT_2_START	0x0002c000
+#define SBI_SSE_EVENT_GLOBAL_PLAT_2_START	0x0002c000
 #define SBI_SSE_EVENT_GLOBAL_PLAT_2_END		0x0002ffff
 
 #define SBI_SSE_EVENT_LOCAL_SOFTWARE		0xffff0000
-#define	SBI_SSE_EVENT_LOCAL_PLAT_3_START	0xffff4000
+#define SBI_SSE_EVENT_LOCAL_PLAT_3_START	0xffff4000
 #define SBI_SSE_EVENT_LOCAL_PLAT_3_END		0xffff7fff
 #define SBI_SSE_EVENT_GLOBAL_SOFTWARE		0xffff8000
-#define	SBI_SSE_EVENT_GLOBAL_PLAT_3_START	0xffffc000
+#define SBI_SSE_EVENT_GLOBAL_PLAT_3_START	0xffffc000
 #define SBI_SSE_EVENT_GLOBAL_PLAT_3_END		0xffffffff
 
 #define SBI_SSE_EVENT_GLOBAL_BIT		(1 << 15)
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index a686692..39b4588 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -128,7 +128,7 @@ struct sse_hart_state {
 	 *
 	 * When an event is in a state >= ENABLED, then it is inserted in the
 	 * this enabled_event_list and thus can only be removed from this
-	 * list upon disable ecall or on complete with ONE_SHOT flag.
+	 * list upon disable ecall or on complete with ONESHOT flag.
 	 */
 	struct sbi_dlist enabled_event_list;
 
@@ -202,7 +202,7 @@ static struct sse_hart_state *sse_get_hart_state(struct sbi_sse_event *e)
 	return sse_get_hart_state_ptr(s);
 }
 
-static struct sse_global_event *sse_get_global_event(struct sbi_sse_event* e)
+static struct sse_global_event *sse_get_global_event(struct sbi_sse_event *e)
 {
 	return container_of(e, struct sse_global_event, event);
 }
@@ -552,11 +552,11 @@ static bool sse_event_check_inject(struct sbi_sse_event *e,
 				   struct sbi_trap_regs *regs)
 {
 	/*
-	* List of event is ordered by priority, stop at first running
-	* event since all other events after this one are of lower
-	* priority. This means an event of higher priority is already
-	* running.
-	*/
+	 * List of event is ordered by priority, stop at first running
+	 * event since all other events after this one are of lower
+	 * priority. This means an event of higher priority is already
+	 * running.
+	 */
 	if (sse_event_state(e) == SBI_SSE_STATE_RUNNING) {
 		return true;
 	}
@@ -882,10 +882,10 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
 
 	/*
 	 * Copy all attributes at once since struct sse_event_attrs is matching
-	 * the SBI_SSE_ATTR_* attributes. While WRITE_ATTR attribute is not used
-	 * in s-mode sse handling path, READ_ATTR is used to retrieve the value
-	 * of registers when interrupted. Rather than doing multiple SBI calls,
-	 * a single one is done allowing to retrieve them all at once.
+	 * the SBI_SSE_ATTR_* attributes. READ_ATTR is used in SSE handling path
+	 * to retrieve the value of registers when interrupted. Rather than
+	 * doing multiple SBI calls a single one is done allowing to retrieve
+	 * them all at once.
 	 */
 	e_attrs = (unsigned long *)&e->attrs;
 	attrs = (unsigned long *)output_phys_lo;
-- 
2.43.0


