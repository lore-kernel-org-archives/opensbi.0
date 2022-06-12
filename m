From: Anup Patel <anup@brainfault.org>
Date: Sun, 12 Jun 2022 09:54:42 +0530
Subject: [RFC PATCH v2 9/9] platform: Add HSM implementation for Allwinner D1
In-Reply-To: <20220530033738.27127-10-samuel@sholland.org>
References: <20220530033738.27127-1-samuel@sholland.org> <20220530033738.27127-10-samuel@sholland.org>
Message-ID: <CAAhSdy30uVmY0nYA=BhLxQB8FAZBfBxHf_xxnmG=Utchc64jSQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 30, 2022 at 9:07 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Allwinner D1 contains a "PPU" power domain controller which can
> automatically power down/up the CPU power domain. This power domain
> includes the C906 core along with its CLINT and PLIC.
>
> This HSM implementation supports non-retentive hart suspend by:
>   1) Saving/restoring state that is lost during hart suspend,
>   2) Performing cache maintenance before/after hart suspend,
>   3) Configuring wakeup sources before hart suspend, and
>   4) Asking the PPU to power down the hart when it enters WFI.
>
> Since this HSM implementation is for a single-core SoC, it does not need
> to worry about concurrency or saving multiple instances of state.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> Changes in v2:
>  - Rebase on top of the current master branch
>  - Use array_size() from sbi_types.h
>  - Use a separate variable for each CSR instead of an array
>  - Use the PLIC helpers added in earlier patches
>  - Use the saved SIE bits to program the wakeup interrupt mask
>  - Set the entry address only once during cold boot
>  - Use the generic implementation for retentive suspend
>  - Clean up/add comments throughout the HSM implementation
>
>  platform/generic/allwinner/objects.mk  |   6 +
>  platform/generic/allwinner/sun20i-d1.c | 210 +++++++++++++++++++++++++
>  2 files changed, 216 insertions(+)
>  create mode 100644 platform/generic/allwinner/objects.mk
>  create mode 100644 platform/generic/allwinner/sun20i-d1.c
>
> diff --git a/platform/generic/allwinner/objects.mk b/platform/generic/allwinner/objects.mk
> new file mode 100644
> index 0000000..9e36ab6
> --- /dev/null
> +++ b/platform/generic/allwinner/objects.mk
> @@ -0,0 +1,6 @@
> +#
> +# SPDX-License-Identifier: BSD-2-Clause
> +#
> +
> +carray-platform_override_modules-y += sun20i_d1
> +platform-objs-y += allwinner/sun20i-d1.o
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> new file mode 100644
> index 0000000..5b88c2d
> --- /dev/null
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -0,0 +1,210 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Samuel Holland <samuel@sholland.org>
> + */
> +
> +#include <platform_override.h>
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_bitops.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_hsm.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/irqchip/fdt_irqchip_plic.h>
> +
> +#define SUN20I_D1_CCU_BASE             ((void *)0x02001000)
> +#define SUN20I_D1_RISCV_CFG_BASE       ((void *)0x06010000)
> +#define SUN20I_D1_PPU_BASE             ((void *)0x07001000)
> +#define SUN20I_D1_PRCM_BASE            ((void *)0x07010000)
> +
> +/*
> + * CCU
> + */
> +
> +#define CCU_BGR_ENABLE                 (BIT(16) | BIT(0))
> +
> +#define RISCV_CFG_BGR_REG              0xd0c
> +#define PPU_BGR_REG                    0x1ac
> +
> +/*
> + * CSRs
> + */
> +
> +#define CSR_MXSTATUS                   0x7c0
> +#define CSR_MHCR                       0x7c1
> +#define CSR_MCOR                       0x7c2
> +#define CSR_MHINT                      0x7c5
> +
> +static unsigned long csr_mxstatus;
> +static unsigned long csr_mhcr;
> +static unsigned long csr_mhint;
> +
> +static void sun20i_d1_csr_save(void)
> +{
> +       /* Save custom CSRs. */
> +       csr_mxstatus    = csr_read(CSR_MXSTATUS);
> +       csr_mhcr        = csr_read(CSR_MHCR);
> +       csr_mhint       = csr_read(CSR_MHINT);
> +
> +       /* Flush and disable caches. */
> +       csr_write(CSR_MCOR, 0x22);
> +       csr_write(CSR_MHCR, 0x0);
> +}
> +
> +static void sun20i_d1_csr_restore(void)
> +{
> +       /* Invalidate caches and the branch predictor. */
> +       csr_write(CSR_MCOR, 0x70013);
> +
> +       /* Restore custom CSRs, including the cache state. */
> +       csr_write(CSR_MXSTATUS, csr_mxstatus);
> +       csr_write(CSR_MHCR,     csr_mhcr);
> +       csr_write(CSR_MHINT,    csr_mhint);
> +}
> +
> +/*
> + * PLIC
> + */
> +
> +#define PLIC_SOURCES                   176
> +#define PLIC_IE_WORDS                  ((PLIC_SOURCES + 31) / 32)
> +
> +static u8 plic_priority[PLIC_SOURCES];
> +static u32 plic_sie[PLIC_IE_WORDS];
> +static u32 plic_threshold;
> +
> +static void sun20i_d1_plic_save(void)
> +{
> +       irqchip_plic_context_save(plic_sie, &plic_threshold);
> +       irqchip_plic_priority_save(plic_priority);
> +}
> +
> +static void sun20i_d1_plic_restore(void)
> +{
> +       thead_plic_restore();
> +       irqchip_plic_priority_restore(plic_priority);
> +       irqchip_plic_context_restore(plic_sie, plic_threshold);
> +}
> +
> +/*
> + * PPU
> + */
> +
> +#define PPU_PD_ACTIVE_CTRL             0x2c
> +
> +static void sun20i_d1_ppu_save(void)
> +{
> +       /* Enable MMIO access. Do not assume S-mode leaves the clock enabled. */
> +       writel_relaxed(CCU_BGR_ENABLE, SUN20I_D1_PRCM_BASE + PPU_BGR_REG);
> +
> +       /* Activate automatic power-down during the next WFI. */
> +       writel_relaxed(1, SUN20I_D1_PPU_BASE + PPU_PD_ACTIVE_CTRL);
> +}
> +
> +static void sun20i_d1_ppu_restore(void)
> +{
> +       /* Disable automatic power-down. */
> +       writel_relaxed(0, SUN20I_D1_PPU_BASE + PPU_PD_ACTIVE_CTRL);
> +}
> +
> +/*
> + * RISCV_CFG
> + */
> +
> +#define RESET_ENTRY_LO_REG             0x0004
> +#define RESET_ENTRY_HI_REG             0x0008
> +#define WAKEUP_EN_REG                  0x0020
> +#define WAKEUP_MASK_REG(i)             (0x0024 + 4 * (i))
> +
> +static void sun20i_d1_riscv_cfg_save(void)
> +{
> +       /* Enable MMIO access. Do not assume S-mode leaves the clock enabled. */
> +       writel_relaxed(CCU_BGR_ENABLE, SUN20I_D1_CCU_BASE + RISCV_CFG_BGR_REG);
> +
> +       /*
> +        * Copy the SIE bits to the wakeup registers. D1 has 160 "real"
> +        * interrupt sources, numbered 16-175. These are the ones that map to
> +        * the wakeup mask registers (the offset is for GIC compatibility). So
> +        * copying SIE to the wakeup mask needs some bit manipulation.
> +        */
> +       for (int i = 0; i < PLIC_IE_WORDS - 1; i++)
> +               writel_relaxed(plic_sie[i] >> 16 | plic_sie[i + 1] << 16,
> +                              SUN20I_D1_RISCV_CFG_BASE + WAKEUP_MASK_REG(i));
> +
> +       /* Enable PPU wakeup for interrupts. */
> +       writel_relaxed(1, SUN20I_D1_RISCV_CFG_BASE + WAKEUP_EN_REG);
> +}
> +
> +static void sun20i_d1_riscv_cfg_restore(void)
> +{
> +       /* Disable PPU wakeup for interrupts. */
> +       writel_relaxed(0, SUN20I_D1_RISCV_CFG_BASE + WAKEUP_EN_REG);
> +}
> +
> +static void sun20i_d1_riscv_cfg_init(void)
> +{
> +       unsigned long entry = sbi_hartid_to_scratch(0)->warmboot_addr;
> +
> +       /* Enable MMIO access. */
> +       writel_relaxed(CCU_BGR_ENABLE, SUN20I_D1_CCU_BASE + RISCV_CFG_BGR_REG);
> +
> +       /* Program the reset entry address. */
> +       writel_relaxed((u32)entry, SUN20I_D1_RISCV_CFG_BASE + RESET_ENTRY_LO_REG);
> +       writel_relaxed(entry >> 32, SUN20I_D1_RISCV_CFG_BASE + RESET_ENTRY_HI_REG);
> +}
> +
> +static int sun20i_d1_hart_suspend(u32 suspend_type)
> +{
> +       /* Use the generic code for retentive suspend. */
> +       if (!(suspend_type & SBI_HSM_SUSP_NON_RET_BIT))
> +               return SBI_ENOTSUPP;
> +
> +       sun20i_d1_plic_save();
> +       sun20i_d1_ppu_save();
> +       sun20i_d1_riscv_cfg_save();
> +       sun20i_d1_csr_save();
> +
> +       /*
> +        * If no interrupt is pending, this will power down the CPU power
> +        * domain. Otherwise, this will fall through, and the generic HSM
> +        * code will jump to the resume address.
> +        */
> +       wfi();
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
> +       if (cold_boot) {
> +               sun20i_d1_riscv_cfg_init();
> +               sbi_hsm_set_device(&sun20i_d1_ppu);
> +       }
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

