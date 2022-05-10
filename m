From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 May 2022 22:00:01 +0530
Subject: [RFC PATCH 2/2] platform: Add HSM implementation for Allwinner D1
In-Reply-To: <20220506065722.27357-3-samuel@sholland.org>
References: <20220506065722.27357-1-samuel@sholland.org>
 <20220506065722.27357-3-samuel@sholland.org>
Message-ID: <CAAhSdy1QC7Z6CzcAP850N2x6O4+y-uvZ2JL2TZL_FH90pW3ZEQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 6, 2022 at 12:27 PM Samuel Holland <samuel@sholland.org> wrote:
>
> Allwinner D1 contains a "PPU" power domain controller which can
> automatically power down/up the CPU power domain. This power domain
> includes the C906 core along with its bundled PLIC and CLINT.
>
> While this is a fully functioning HSM implementation, there are some
> open design concerns:
>  0) Is OpenSBI even the right place to save/restore the PLIC registers?

Well, it depends on the platform.

Some platforms (such as C906 and 910) will not have any dedicated
power management controller so for such platforms we will end-up doing
save/restore of system peripherals in OpenSBI.

Some platforms will have a dedicated power management controller
running a power management firmware. On such platform, the power
management controller can do the save/restore of system peripherals.

>  1) How much of the PLIC register save/restore code can be shared with
>     the PLIC driver?

We should certainly have common code to save/restore PLIC global
state (i.e. priority registers) and PLIC per-HART state (i.e. enable and
threshold registers).

You can extend include/sbi_utils/irqchip/plic.h and lib/utils/irqchip/plic.c
with helper functions but these functions will need to be invoked from
platform code.

>  2) Should the HSM resume path call into irqchip, timer, etc. drivers?

The HSM resume path will be generally platform specific and sometimes
even specific to a platform suspend type.

My inclination is to let platform code decide its own resume sequence.

>  3) If we make this code more general, how do we allocate space for the
>     saved registers?

Atish is already working on a small heap space for OpenSBI firmwares
which can be used by platform and drivers to reduce pressure on global
variables and per-HART scratch space.

For now, let's use global variables for Sun20i_D1.

>  4) How much of this code can be shared with the C910 platform?

We can certainly have a common c9xx code (under generic platform
directory or lib/utils) shared between C906 and C910.

With the "OpenSBI compile-time C arrays", we can even have a
C9xx directory under the generic platform for both C906 and C910.

>  5) Linux/the OS should be setting the wakeup mask, not OpenSBI, because
>     the mask is also used (with different contents) for system suspend.

Linux cpuidle subsystem will simply select different HART suspend types
as described and populated from DT. Also, we are sharing the same DT
bindings for idle states with ARM which does not allow specifying separate
wakeup settings for each idle state.

Defining the HART suspend types (i.e. idle states) is totally up to the
platform so one approach can be to define multiple suspend types which
are essentially the same hardware suspend type but with different wakeup
settings.

>
> I have added some additonal commentary and explanation of how the
> hardware works as C++ style comments.

Please use only C style comments /* */

Regards,
Anup


>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  platform/generic/objects.mk  |   1 +
>  platform/generic/platform.c  |   2 +
>  platform/generic/sun20i_d1.c | 225 +++++++++++++++++++++++++++++++++++
>  3 files changed, 228 insertions(+)
>  create mode 100644 platform/generic/sun20i_d1.c
>
> diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
> index cb15a18..d8c8980 100644
> --- a/platform/generic/objects.mk
> +++ b/platform/generic/objects.mk
> @@ -10,3 +10,4 @@
>  platform-objs-y += platform.o
>  platform-objs-y += sifive_fu540.o
>  platform-objs-y += sifive_fu740.o
> +platform-objs-y += sun20i_d1.o
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 8a4fb70..e719535 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -26,10 +26,12 @@
>
>  extern const struct platform_override sifive_fu540;
>  extern const struct platform_override sifive_fu740;
> +extern const struct platform_override sun20i_d1;
>
>  static const struct platform_override *special_platforms[] = {
>         &sifive_fu540,
>         &sifive_fu740,
> +       &sun20i_d1,
>  };
>
>  static const struct platform_override *generic_plat = NULL;
> diff --git a/platform/generic/sun20i_d1.c b/platform/generic/sun20i_d1.c
> new file mode 100644
> index 0000000..4375bb9
> --- /dev/null
> +++ b/platform/generic/sun20i_d1.c
> @@ -0,0 +1,225 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Samuel Holland <samuel@sholland.org>
> + */
> +
> +#include <platform_override.h>
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_bitops.h>
> +#include <sbi/sbi_hsm.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +
> +#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> +
> +#define CSR_MXSTATUS                   0x7c0
> +#define CSR_MHCR                       0x7c1
> +#define CSR_MCOR                       0x7c2
> +#define CSR_MHINT                      0x7c5
> +
> +static unsigned long csrs[3];
> +
> +static void sun20i_d1_csr_save(void)
> +{
> +       /* Save custom CSRs. */
> +       csrs[0] = csr_read(CSR_MXSTATUS);
> +       csrs[1] = csr_read(CSR_MHCR);
> +       csrs[2] = csr_read(CSR_MHINT);
> +
> +       /* Flush and disable caches. */
> +       csr_write(CSR_MCOR, 0x22);
> +       csr_write(CSR_MHCR, 0x0);
> +       mb();
> +       RISCV_FENCE_I;
> +}
> +
> +static void sun20i_d1_csr_restore(void)
> +{
> +       /* Invalidate caches and branch predictor. */
> +       csr_write(CSR_MCOR, 0x70013);
> +       mb();
> +       RISCV_FENCE_I;
> +
> +       /* Restore custom CSRs. */
> +       // ...which re-enables the caches.
> +       csr_write(CSR_MXSTATUS, csrs[0]);
> +       csr_write(CSR_MHCR,     csrs[1]);
> +       csr_write(CSR_MHINT,    csrs[2]);
> +}
> +
> +// D1 loses all PLIC registers when the CPU is powered down.
> +
> +#define SUN20I_D1_PLIC_BASE            ((void *)0x10000000)
> +
> +#define PLIC_PRIORITY_BASE             0x0
> +#define PLIC_ENABLE_BASE               0x2000
> +#define PLIC_ENABLE_STRIDE             0x80
> +#define PLIC_CONTEXT_BASE              0x200000
> +#define PLIC_CONTEXT_STRIDE            0x1000
> +
> +#define THEAD_PLIC_CTRL_REG            0x001ffffc
> +
> +// There are 160 "real" IRQs, numbered 16-175. These are the ones that map to
> +// the wakeup mask registers. The 16 IRQ offset is for GIC compatibility. So
> +// copying SIE to the wakeup mask should work, but needs some bit manipulation.
> +static u8 plic_prio[32 * 6];
> +static u32 plic_sie[6];
> +static u32 plic_th[2];
> +
> +static void sun20i_d1_plic_save(void)
> +{
> +       for (int i = 0; i < ARRAY_SIZE(plic_prio); ++i)
> +               plic_prio[i] = readl_relaxed(SUN20I_D1_PLIC_BASE + PLIC_PRIORITY_BASE + 4 * i);
> +       for (int i = 0; i < ARRAY_SIZE(plic_sie); ++i)
> +               plic_sie[i] = readl_relaxed(SUN20I_D1_PLIC_BASE + PLIC_ENABLE_BASE + PLIC_ENABLE_STRIDE * 1 + 4 * i);
> +       for (int i = 0; i < ARRAY_SIZE(plic_th); ++i)
> +               plic_th[i] = readl_relaxed(SUN20I_D1_PLIC_BASE + PLIC_CONTEXT_BASE + PLIC_CONTEXT_STRIDE * i);
> +}
> +
> +static void sun20i_d1_plic_restore(void)
> +{
> +       for (int i = 0; i < ARRAY_SIZE(plic_prio); ++i)
> +               writel_relaxed(plic_prio[i], SUN20I_D1_PLIC_BASE + PLIC_PRIORITY_BASE + 4 * i);
> +       for (int i = 0; i < ARRAY_SIZE(plic_sie); ++i)
> +               writel_relaxed(plic_sie[i], SUN20I_D1_PLIC_BASE + PLIC_ENABLE_BASE + PLIC_ENABLE_STRIDE * 1 + 4 * i);
> +       for (int i = 0; i < ARRAY_SIZE(plic_th); ++i)
> +               writel_relaxed(plic_th[i], SUN20I_D1_PLIC_BASE + PLIC_CONTEXT_BASE + PLIC_CONTEXT_STRIDE * i);
> +
> +       // This is also set by the PLIC driver during cold boot.
> +       writel_relaxed(BIT(0), SUN20I_D1_PLIC_BASE + THEAD_PLIC_CTRL_REG);
> +}
> +
> +#define SUN20I_D1_PPU_BASE             ((void *)0x07001000)
> +
> +#define PPU_PD_REQUEST(i)              (0x20 + 0x80 * (i))
> +#define PPU_PD_REQUEST_ON              1
> +#define PPU_PD_REQUEST_OFF             2
> +
> +#define PPU_PD_STATUS(i)               (0x24 + 0x80 * (i))
> +#define PPU_PD_STATUS_ON               0x10000
> +#define PPU_PD_STATUS_OFF              0x20000
> +#define PPU_PD_STATUS_TRANS_COMPLETE   BIT(1)
> +
> +#define PPU_PD_ACTIVE_CTRL(i)          (0x2c + 0x80 * (i))
> +
> +#define SUN20I_D1_PRCM_BASE            ((void *)0x07010000)
> +
> +#define PPU_BGR_REG                    0x1ac
> +#define PPU_BGR_VAL                    (BIT(16) | BIT(0))
> +
> +static void sun20i_d1_ppu_save(void)
> +{
> +       /* Enable MMIO access (clock gate/reset). */
> +       // Do not trust Linux to leave this clock enabled.
> +       writel_relaxed(PPU_BGR_VAL, SUN20I_D1_PRCM_BASE + PPU_BGR_REG);
> +
> +       /* Activate automatic power-down at the next WFI. */
> +       writel_relaxed(1, SUN20I_D1_PPU_BASE + PPU_PD_ACTIVE_CTRL(0));
> +}
> +
> +static void sun20i_d1_ppu_restore(void)
> +{
> +       /* Disable automatic power-down. */
> +       writel_relaxed(0, SUN20I_D1_PPU_BASE + PPU_PD_ACTIVE_CTRL(0));
> +}
> +
> +#define SUN20I_D1_CCU_BASE             ((void *)0x02001000)
> +
> +#define RISCV_CFG_BGR_REG              0xd0c
> +#define RISCV_CFG_BGR_VAL              (BIT(16) | BIT(0))
> +
> +#define SUN20I_D1_RISCV_CFG_BASE       ((void *)0x06010000)
> +
> +#define RESET_ENTRY_LO_REG             0x0004
> +#define RESET_ENTRY_HI_REG             0x0008
> +#define WAKEUP_EN_REG                  0x0020
> +#define WAKEUP_MASK_REG(i)             (0x0024 + 4 * (i))
> +
> +static void sun20i_d1_riscv_cfg_save(ulong raddr)
> +{
> +       /* Enable MMIO access (clock gate/reset). */
> +       // Do not trust Linux to leave this clock enabled.
> +       writel_relaxed(RISCV_CFG_BGR_VAL, SUN20I_D1_CCU_BASE + RISCV_CFG_BGR_REG);
> +
> +       /* Program reset entry address. */
> +       // Does this really need to be done for every suspend?  The warmboot
> +       // entry point does not move. Can we add a "set entry address" HSM
> +       // driver hook that gets called only once?
> +       writel_relaxed((u32)raddr, SUN20I_D1_RISCV_CFG_BASE + RESET_ENTRY_LO_REG);
> +       writel_relaxed(raddr >> 32, SUN20I_D1_RISCV_CFG_BASE + RESET_ENTRY_HI_REG);
> +
> +       /* Enable wakeup for all IRQs. */
> +       // This should be left to Linux to set, or copied from the PLIC SIE.
> +       for (int i = 0; i < 5; ++i)
> +               writel_relaxed(0xffffffff, SUN20I_D1_RISCV_CFG_BASE + WAKEUP_MASK_REG(i));
> +
> +       /* Enable PPU wakeup for IRQs. */
> +       writel_relaxed(1, SUN20I_D1_RISCV_CFG_BASE + WAKEUP_EN_REG);
> +}
> +
> +static void sun20i_d1_riscv_cfg_restore(void)
> +{
> +       /* Disable PPU wakeup for IRQs. */
> +       writel_relaxed(0, SUN20I_D1_RISCV_CFG_BASE + WAKEUP_EN_REG);
> +}
> +
> +static int sun20i_d1_hart_suspend(u32 suspend_type, ulong raddr)
> +{
> +       void (*warmboot)(void) = (void (*)(void))raddr;
> +
> +       sun20i_d1_plic_save();
> +       sun20i_d1_ppu_save();
> +       sun20i_d1_riscv_cfg_save(raddr);
> +       sun20i_d1_csr_save();
> +
> +       /* If no IRQ is pending, this will power down the CPU domain. */
> +       // Power-down will only if both of the PPU and RISCV_CFG bits are set.
> +       //
> +       // PPU_PD_STATUS_TRANS_COMPLETE will be set if the domain was actually
> +       // powered down and back up (PPU_PD_STATUS(0) will be 0x10007).
> +       //
> +       // Manual power-up or down can be requested with PPU_PD_REQUEST(0), but
> +       // this is not too useful for a uniprocessor SoC.
> +       wfi();
> +
> +       /*
> +        * An IRQ was already pending, so we did not power down.
> +        * Jump directly to the warmboot entry point.
> +        */
> +       // Would be nice to mark this `noreturn`.
> +       warmboot();
> +
> +       return 0;
> +}
> +
> +static void sun20i_d1_hart_resume(void)
> +{
> +       sun20i_d1_csr_restore();
> +       sun20i_d1_riscv_cfg_restore();
> +       sun20i_d1_ppu_restore();
> +       sun20i_d1_plic_restore();
> +}
> +
> +static const struct sbi_hsm_device sun20i_d1_ppu = {
> +       .name           = "sun20i-d1-ppu",
> +       .hart_suspend   = sun20i_d1_hart_suspend,
> +       .hart_resume    = sun20i_d1_hart_resume,
> +};
> +
> +static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
> +{
> +       if (cold_boot)
> +               sbi_hsm_set_device(&sun20i_d1_ppu);
> +
> +       return 0;
> +}
> +
> +static const struct fdt_match sun20i_d1_match[] = {
> +       { .compatible = "allwinner,sun20i-d1" },
> +       { },
> +};
> +
> +const struct platform_override sun20i_d1 = {
> +       .match_table    = sun20i_d1_match,
> +       .final_init     = sun20i_d1_final_init,
> +};
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

