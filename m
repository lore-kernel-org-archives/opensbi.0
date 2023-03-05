From: Evgenii Shatokhin <e.shatokhin@yadro.com>
Date: Mon, 6 Mar 2023 00:22:46 +0300
Subject: [PATCH v3 2/3] lib: sbi: Set the state of a hart to START_PENDING after the hart is ready
In-Reply-To: <20230305212247.494912-1-e.shatokhin@yadro.com>
References: <20230305212247.494912-1-e.shatokhin@yadro.com>
Message-ID: <20230305212247.494912-3-e.shatokhin@yadro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When a boot hart executes sbi_hsm_hart_start() to start a secondary hart,
next_arg1, next_addr and next_mode for the latter are stored in the scratch
area after the state has been set to SBI_HSM_STATE_START_PENDING.

The secondary hart waits in the loop with wfi() in sbi_hsm_hart_wait() at
that time. However, "wfi" instruction is not guaranteed to wait for an
interrupt to be received by the hart, it is just a hint for the CPU.
According to RISC-V Privileged Architectures spec. v20211203, even an
implementation of "wfi" as "nop" is legal.

So, the secondary might leave the loop in sbi_hsm_hart_wait() as soon as
its state has been set to SBI_HSM_STATE_START_PENDING, even if it got no
IPI or it got an IPI unrelated to sbi_hsm_hart_start(). This could lead to
the following race condition when booting Linux, for example:

  Boot hart (#0)                        Secondary hart (#1)
  runs Linux startup code               waits in sbi_hsm_hart_wait()

  sbi_ecall(SBI_EXT_HSM,
            SBI_EXT_HSM_HART_START,
            ...)
  enters sbi_hsm_hart_start()
  sets state of hart #1 to START_PENDING
                                        leaves sbi_hsm_hart_wait()
                                        runs to the end of init_warmboot()
                                        returns to scratch->next_addr
                                        (next_addr can be garbage here)

  sets next_addr, etc. for hart #1
  (no good: hart #1 has already left)

  sends IPI to hart #1
  (no good either)

If this happens, the secondary hart jumps to a wrong next_addr at the end
of init_warmboot(), which leads to a system hang or crash.

To reproduce the issue more reliably, one could add a delay in
sbi_hsm_hart_start() after setting the hart's state but before sending
IPI to that hart:

    hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOPPED,
                            SBI_HSM_STATE_START_PENDING);
    ...
  + sbi_timer_mdelay(10);
    init_count = sbi_init_count(hartid);
    rscratch->next_arg1 = arg1;
    rscratch->next_addr = saddr;

The issue can be reproduced, for example, in a QEMU VM with '-machine virt'
and 2 or more CPUs, with Linux as the guest OS.

This patch moves writing of next_arg1, next_addr and next_mode for the
secondary hart before setting its state to SBI_HSM_STATE_START_PENDING.

In theory, it is possible that two or more harts enter sbi_hsm_hart_start()
for the same target hart simultaneously. To make sure the current hart has
exclusive access to the scratch area of the target hart at that point, a
per-hart 'start_ticket' is used. It is initially 0. The current hart tries
to acquire the ticket first (set it to 1) at the beginning of
sbi_hsm_hart_start() and only proceeds if it has successfully acquired it.

The target hart reads next_addr, etc., and then the releases the ticket
(sets it to 0) before calling sbi_hart_switch_mode(). This way, even if
some other hart manages to enter sbi_hsm_hart_start() after the ticket has
been released but before the target hart jumps to next_addr, it will not
cause problems.

atomic_cmpxchg() already has "acquire" semantics, among other things, so
no additional barriers are needed in hsm_start_ticket_acquire(). No hart
can perform or observe the update of *rscratch before setting of
'start_ticket' to 1.

atomic_write() only imposes ordering of writes, so an explicit barrier is
needed in hsm_start_ticket_release() to ensure its "release" semantics.
This guarantees that reads of scratch->next_addr, etc., in
sbi_hsm_hart_start_finish() cannot happen after 'start_ticket' has been
released.

Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
---
 lib/sbi/sbi_hsm.c | 83 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 16 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 100b8c0..16e3846 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -44,6 +44,7 @@ struct sbi_hsm_data {
 	unsigned long suspend_type;
 	unsigned long saved_mie;
 	unsigned long saved_mip;
+	atomic_t start_ticket;
 };
 
 bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
@@ -75,6 +76,32 @@ int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
 	return __sbi_hsm_hart_get_state(hartid);
 }
 
+/*
+ * Try to acquire the ticket for the given target hart to make sure only
+ * one hart prepares the start of the target hart.
+ * Returns true if the ticket has been acquired, false otherwise.
+ *
+ * The function has "acquire" semantics: no memory operations following it
+ * in the current hart can be seen before it by other harts.
+ * atomic_cmpxchg() provides the memory barriers needed for that.
+ */
+static bool hsm_start_ticket_acquire(struct sbi_hsm_data *hdata)
+{
+	return (atomic_cmpxchg(&hdata->start_ticket, 0, 1) == 0);
+}
+
+/*
+ * Release the ticket for the given target hart.
+ *
+ * The function has "release" semantics: no memory operations preceding it
+ * in the current hart can be seen after it by other harts.
+ */
+static void hsm_start_ticket_release(struct sbi_hsm_data *hdata)
+{
+	RISCV_FENCE(rw, w);
+	atomic_write(&hdata->start_ticket, 0);
+}
+
 /**
  * Get ulong HART mask for given HART base ID
  * @param dom the domain to be used for output HART mask
@@ -113,6 +140,9 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
 					  u32 hartid)
 {
+	unsigned long next_arg1;
+	unsigned long next_addr;
+	unsigned long next_mode;
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
@@ -120,8 +150,12 @@ void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
 					 SBI_HSM_STATE_STARTED))
 		sbi_hart_hang();
 
-	sbi_hart_switch_mode(hartid, scratch->next_arg1, scratch->next_addr,
-			     scratch->next_mode, false);
+	next_arg1 = scratch->next_arg1;
+	next_addr = scratch->next_addr;
+	next_mode = scratch->next_mode;
+	hsm_start_ticket_release(hdata);
+
+	sbi_hart_switch_mode(hartid, next_arg1, next_addr, next_mode, false);
 }
 
 static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
@@ -226,6 +260,7 @@ int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 				    (i == hartid) ?
 				    SBI_HSM_STATE_START_PENDING :
 				    SBI_HSM_STATE_STOPPED);
+			ATOMIC_INIT(&hdata->start_ticket, 0);
 		}
 	} else {
 		sbi_hsm_hart_wait(scratch, hartid);
@@ -270,6 +305,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	unsigned int hstate;
 	struct sbi_scratch *rscratch;
 	struct sbi_hsm_data *hdata;
+	int rc;
 
 	/* For now, we only allow start mode to be S-mode or U-mode. */
 	if (smode != PRV_S && smode != PRV_U)
@@ -283,34 +319,49 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	rscratch = sbi_hartid_to_scratch(hartid);
 	if (!rscratch)
 		return SBI_EINVAL;
+
 	hdata = sbi_scratch_offset_ptr(rscratch, hart_data_offset);
+	if (!hsm_start_ticket_acquire(hdata))
+		return SBI_EINVAL;
+
+	init_count = sbi_init_count(hartid);
+	rscratch->next_arg1 = arg1;
+	rscratch->next_addr = saddr;
+	rscratch->next_mode = smode;
+
+	/*
+	 * atomic_cmpxchg() is an implicit barrier. It makes sure that
+	 * other harts see reading of init_count and writing to *rscratch
+	 * before hdata->state is set to SBI_HSM_STATE_START_PENDING.
+	 */
 	hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOPPED,
 				SBI_HSM_STATE_START_PENDING);
-	if (hstate == SBI_HSM_STATE_STARTED)
-		return SBI_EALREADY;
+	if (hstate == SBI_HSM_STATE_STARTED) {
+		rc = SBI_EALREADY;
+		goto err;
+	}
 
 	/**
 	 * if a hart is already transition to start or stop, another start call
 	 * is considered as invalid request.
 	 */
-	if (hstate != SBI_HSM_STATE_STOPPED)
-		return SBI_EINVAL;
-
-	init_count = sbi_init_count(hartid);
-	rscratch->next_arg1 = arg1;
-	rscratch->next_addr = saddr;
-	rscratch->next_mode = smode;
+	if (hstate != SBI_HSM_STATE_STOPPED) {
+		rc = SBI_EINVAL;
+		goto err;
+	}
 
 	if (hsm_device_has_hart_hotplug() ||
 	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
-		return hsm_device_hart_start(hartid, scratch->warmboot_addr);
+		rc = hsm_device_hart_start(hartid, scratch->warmboot_addr);
 	} else {
-		int rc = sbi_ipi_raw_send(hartid);
-		if (rc)
-		    return rc;
+		rc = sbi_ipi_raw_send(hartid);
 	}
 
-	return 0;
+	if (!rc)
+		return 0;
+err:
+	hsm_start_ticket_release(hdata);
+	return rc;
 }
 
 int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
-- 
2.34.1



