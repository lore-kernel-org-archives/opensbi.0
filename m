From: Evgenii Shatokhin <e.shatokhin@yadro.com>
Date: Wed, 22 Feb 2023 00:08:50 +0300
Subject: [PATCH v2 1/2] lib: sbi: Wait in sbi_hsm_hart_wait() till the hart is prepared to start
In-Reply-To: <20230221210851.3145840-1-e.shatokhin@yadro.com>
References: <20230221210851.3145840-1-e.shatokhin@yadro.com>
Message-ID: <20230221210851.3145840-2-e.shatokhin@yadro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

"wfi" instruction is not guaranteed to wait for an interrupt to be received
by the hart, it is just a hint for the CPU. According to RISC-V Privileged
Architectures spec. v20211203, even an implementation of "wfi" as "nop" is
legal.

As a result, a secondary (non-boot) hart waiting in the while loop in
sbi_hsm_hart_wait() might leave the loop and continue even if it got no
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

This patch adds an auxiliary per-hart state variable, aux_state, as well as
its accessor functions, to synchronize execution of the boot hart and the
starting secondary hart.

Initially, aux_state is 0: sbi_scratch_alloc_offset() zeroes the allocated
memory. The boot hart sets it to 1 after it has set next_addr, etc., for the
secondary hart, then sends the IPI to the latter.

The secondary hart waits in sbi_hsm_hart_wait() both for aux_state to become
non-zero and for an IPI to happen. This should be safe even if the secondary
hart somehow gets an IPI unrelated to sbi_hsm_hart_start().

Memory barriers are used to make sure the writes to next_addr, etc., in the
boot hart are visible to the secondary hart if it reads non-zero aux_state.

Only one bit of aux_state is actually used here, so, this per-hart variable
can be used to hold other data in the future, if needed.

Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
---
 lib/sbi/sbi_hsm.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 8499bb1..24061c5 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -35,6 +35,7 @@ struct sbi_hsm_data {
 	unsigned long suspend_type;
 	unsigned long saved_mie;
 	unsigned long saved_mip;
+	unsigned long aux_state;
 };
 
 static inline int __sbi_hsm_hart_get_state(u32 hartid)
@@ -93,6 +94,23 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 	return 0;
 }
 
+static inline bool sbi_hsm_is_runnable(struct sbi_hsm_data *hdata)
+{
+	unsigned long aux_state = __smp_load_acquire(&hdata->aux_state);
+
+	return !!aux_state;
+}
+
+static inline void sbi_hsm_set_runnable(struct sbi_hsm_data *hdata)
+{
+	__smp_store_release(&hdata->aux_state, 1);
+}
+
+static inline void sbi_hsm_reset_runnable(struct sbi_hsm_data *hdata)
+{
+	__smp_store_release(&hdata->aux_state, 0);
+}
+
 void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
 {
 	u32 oldstate;
@@ -108,6 +126,7 @@ void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
 static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
 {
 	unsigned long saved_mie;
+	unsigned long cmip;
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 	/* Save MIE CSR */
@@ -117,13 +136,22 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
 	csr_set(CSR_MIE, MIP_MSIP | MIP_MEIP);
 
 	/* Wait for state transition requested by sbi_hsm_hart_start() */
-	while (atomic_read(&hdata->state) != SBI_HSM_STATE_START_PENDING) {
-		wfi();
+	while (!sbi_hsm_is_runnable(hdata)) {
+		do {
+			wfi();
+			cmip = csr_read(CSR_MIP);
+		} while (!(cmip & (MIP_MSIP | MIP_MEIP)));
 	};
 
 	/* Restore MIE CSR */
 	csr_write(CSR_MIE, saved_mie);
 
+	/*
+	 * If the hart ever needs to wait for such state transition again,
+	 * make sure the hart's data allows that.
+	 */
+	sbi_hsm_reset_runnable(hdata);
+
 	/*
 	 * No need to clear IPI here because the sbi_ipi_init() will
 	 * clear it for current HART via sbi_platform_ipi_init().
@@ -284,6 +312,9 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	rscratch->next_addr = saddr;
 	rscratch->next_mode = smode;
 
+	/* Inform the hart that it may continue as soon as it gets IPI. */
+	sbi_hsm_set_runnable(hdata);
+
 	if (hsm_device_has_hart_hotplug() ||
 	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
 		return hsm_device_hart_start(hartid, scratch->warmboot_addr);
-- 
2.34.1



