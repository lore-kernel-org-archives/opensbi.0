From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Mar 2023 22:00:27 +0530
Subject: [PATCH v3 3/3] lib: sbi: Clear IPIs before init_warm_startup in
 non-boot harts
In-Reply-To: <20230305212247.494912-4-e.shatokhin@yadro.com>
References: <20230305212247.494912-1-e.shatokhin@yadro.com> <20230305212247.494912-4-e.shatokhin@yadro.com>
Message-ID: <CAAhSdy3ghazwrRxgDuZ1qAcxMdQ4Mtcc4yPLvft6TZE6t7F8BQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 6, 2023 at 2:54?AM Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
>
> Since commit 50d4fde1c5a4 ("lib: Remove redundant sbi_platform_ipi_clear()
> calls"), the IPI sent from the boot hart in wake_coldboot_harts() is not
> cleared in the secondary harts until they reach sbi_ipi_init(). However,
> sbi_hsm_init() and sbi_hsm_hart_wait() are called earlier, so a secondary
> hart might enter sbi_hsm_hart_wait() with an already pending IPI.
>
> sbi_hsm_hart_wait() makes sure the hart leaves the loop only when it is
> actually ready, so a pending unrelated IPI should not cause safety issues.
> However, it might be inefficient on certain hardware, because it prevents
> "wfi" from stalling the hart even if the hardware supports this, making the
> hart needlessly spin in a "busy-wait" loop.
>
> This behaviour can be observed, for example, in a QEMU VM (QEMU 7.2.0) with
> "-machine virt" running a Linux guest. Inserting delays in
> sbi_hsm_hart_start() allows reproducing the issue more reliably.
>
> The comment in wait_for_coldboot() suggests that the initial IPI is needed
> in the warm resume path, so let us clear it before init_warm_startup()
> only.
>
> To do this, sbi_ipi_raw_clear() was created similar to sbi_ipi_raw_send().

As noted before, the sbi_ipi_raw_clear() will not work since secondary
HARTs might call sbi_ipi_raw_clear() even before platform code has a
chance to register IPI device ops.

I also recollected why we have this WFI and IPI based coldboot wait logic.
The rationale of using WFI and IPI based coldboot wait logic was to reduce
bus traffic from secondary HARTs while the primary HART completes the
coldboot sequence (i.e. init_coldboot()). Clearly, this WFI and IPI based
coldboot wait logic will do the intended thing if WFI is a NOP.

I think we can do the following:
1) Remove coldboot_lock and coldboot_wait_hmask
2) Simplify the loop in wait_for_coldboot() to use
    cpu_relax_loop(100) (or more) to reduce bus traffic
    from secondary HARTs
3) Simplify wake_coldboot_harts() to only do
    "__smp_store_release(&coldboot_done, 1);"

Regards,
Anup

diff --git a/include/sbi/riscv_barrier.h b/include/sbi/riscv_barrier.h
index 1fba8b8..dd8aa79 100644
--- a/include/sbi/riscv_barrier.h
+++ b/include/sbi/riscv_barrier.h
@@ -40,7 +40,19 @@
 #define smp_wmb()        RISCV_FENCE(w,w)

 /* CPU relax for busy loop */
-#define cpu_relax()        asm volatile ("" : : : "memory")
+#define cpu_relax()        \
+do {                \
+    long dummy = 0x1;    \
+    asm volatile ("div %0, %0, zero" : "=r" (dummy) : : "memory");\
+} while (0)
+
+/* CPU relax loop */
+#define cpu_relax_loop(__loop_count)    \
+do {                    \
+    long i;                \
+    for (i = 0; i < (__loop_count); i++) \
+        cpu_relax();        \
+} while (0)

 /* clang-format on */

