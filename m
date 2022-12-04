From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Dec 2022 20:35:47 +0530
Subject: [PATCH] platform: generic/allwinner: Remove ghostly type cast
In-Reply-To: <20221119085507.156418-1-wxjstz@126.com>
References: <20221119085507.156418-1-wxjstz@126.com>
Message-ID: <CAAhSdy1Ny+QOzQOiEqSF-Ke7Jv=v9LH4n0Qmv=PM8hpSzByCQA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 19, 2022 at 2:25 PM Xiang W <wxjstz@126.com> wrote:
>
> Corrected the same parameter of writel_relaxed in sun20i_d1_riscv_cfg_init
> to be u32 for a while and u64 for a while.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/allwinner/sun20i-d1.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 6a502e5..18fcf56 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -146,14 +146,14 @@ static void sun20i_d1_riscv_cfg_restore(void)
>
>  static void sun20i_d1_riscv_cfg_init(void)
>  {
> -       unsigned long entry = sbi_hartid_to_scratch(0)->warmboot_addr;
> +       u64 entry = sbi_hartid_to_scratch(0)->warmboot_addr;
>
>         /* Enable MMIO access. */
>         writel_relaxed(CCU_BGR_ENABLE, SUN20I_D1_CCU_BASE + RISCV_CFG_BGR_REG);
>
>         /* Program the reset entry address. */
> -       writel_relaxed((u32)entry, SUN20I_D1_RISCV_CFG_BASE + RESET_ENTRY_LO_REG);
> -       writel_relaxed((u64)entry >> 32, SUN20I_D1_RISCV_CFG_BASE + RESET_ENTRY_HI_REG);
> +       writel_relaxed(entry, SUN20I_D1_RISCV_CFG_BASE + RESET_ENTRY_LO_REG);
> +       writel_relaxed(entry >> 32, SUN20I_D1_RISCV_CFG_BASE + RESET_ENTRY_HI_REG);
>  }
>
>  static int sun20i_d1_hart_suspend(u32 suspend_type)
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

