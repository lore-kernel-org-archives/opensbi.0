From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon, 23 Sep 2024 11:26:26 +0530
Subject: [PATCH v2 1/1] lib: sbi: Add support to mask/unmask SSE events
In-Reply-To: <20240923055626.1146237-1-hchauhan@ventanamicro.com>
References: <20240923055626.1146237-1-hchauhan@ventanamicro.com>
Message-ID: <20240923055626.1146237-2-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add functions to globally mask/unmask supervisor software events
on the calling hart.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/sbi/sbi_ecall_interface.h |  2 ++
 include/sbi/sbi_sse.h             |  2 ++
 lib/sbi/sbi_ecall_sse.c           |  6 +++++
 lib/sbi/sbi_sse.c                 | 43 +++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index e9a81677..40ab32aa 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -341,6 +341,8 @@ enum sbi_cppc_reg_id {
 #define SBI_EXT_SSE_DISABLE		0x00000005
 #define SBI_EXT_SSE_COMPLETE		0x00000006
 #define SBI_EXT_SSE_INJECT		0x00000007
+#define SBI_EXT_SSE_HART_UNMASK		0x00000008
+#define SBI_EXT_SSE_HART_MASK		0x00000009
 
 /* SBI SSE Event Attributes. */
 enum sbi_sse_attr_id {
diff --git a/include/sbi/sbi_sse.h b/include/sbi/sbi_sse.h
index e5b0ad69..7419698a 100644
--- a/include/sbi/sbi_sse.h
+++ b/include/sbi/sbi_sse.h
@@ -78,6 +78,8 @@ void sbi_sse_exit(struct sbi_scratch *scratch);
 int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
 		     unsigned long handler_entry_arg);
 int sbi_sse_unregister(uint32_t event_id);
+int sbi_sse_hart_mask(void);
+int sbi_sse_hart_unmask(void);
 int sbi_sse_enable(uint32_t event_id);
 int sbi_sse_disable(uint32_t event_id);
 int sbi_sse_complete(struct sbi_trap_regs *regs, struct sbi_ecall_return *out);
diff --git a/lib/sbi/sbi_ecall_sse.c b/lib/sbi/sbi_ecall_sse.c
index a28a033e..beddc2cd 100644
--- a/lib/sbi/sbi_ecall_sse.c
+++ b/lib/sbi/sbi_ecall_sse.c
@@ -36,6 +36,12 @@ static int sbi_ecall_sse_handler(unsigned long extid, unsigned long funcid,
 	case SBI_EXT_SSE_INJECT:
 		ret = sbi_sse_inject_from_ecall(regs->a0, regs->a1, out);
 		break;
+	case SBI_EXT_SSE_HART_MASK:
+		ret = sbi_sse_hart_mask();
+		break;
+	case SBI_EXT_SSE_HART_UNMASK:
+		ret = sbi_sse_hart_unmask();
+		break;
 	default:
 		ret = SBI_ENOTSUPP;
 	}
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 52172fcd..aff64268 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -141,6 +141,12 @@ struct sse_hart_state {
 	 * List of local events allocated at boot time.
 	 */
 	struct sbi_sse_event *local_events;
+
+	/**
+	 * State to track if the hart is ready to take sse events.
+	 * One hart cannot modify this state of another hart.
+	 */
+	bool masked;
 };
 
 /**
@@ -608,6 +614,10 @@ void sbi_sse_process_pending_events(struct sbi_trap_regs *regs)
 	struct sbi_sse_event *e;
 	struct sse_hart_state *state = sse_thishart_state_ptr();
 
+	/* if sse is masked on this hart, do nothing */
+	if (state->masked)
+		return;
+
 	spin_lock(&state->enabled_event_lock);
 
 	sbi_list_for_each_entry(e, &state->enabled_event_list, node) {
@@ -805,6 +815,36 @@ int sbi_sse_disable(uint32_t event_id)
 	return ret;
 }
 
+int sbi_sse_hart_mask(void)
+{
+	struct sse_hart_state *state = sse_thishart_state_ptr();
+
+	if (!state)
+		return SBI_EFAIL;
+
+	if (state->masked)
+		return SBI_EALREADY_STARTED;
+
+	state->masked = true;
+
+	return SBI_SUCCESS;
+}
+
+int sbi_sse_hart_unmask(void)
+{
+	struct sse_hart_state *state = sse_thishart_state_ptr();
+
+	if (!state)
+		return SBI_EFAIL;
+
+	if (!state->masked)
+		return SBI_EALREADY_STOPPED;
+
+	state->masked = false;
+
+	return SBI_SUCCESS;
+}
+
 int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hartid,
 			      struct sbi_ecall_return *out)
 {
@@ -1123,6 +1163,9 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
 
 		shs->local_events = (struct sbi_sse_event *)(shs + 1);
 
+		/* SSE events are masked until hart unmasks them */
+		shs->masked = true;
+
 		sse_set_hart_state_ptr(scratch, shs);
 	}
 
-- 
2.43.0


