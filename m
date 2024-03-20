From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Mar 2024 11:08:02 +0530
Subject: [PATCH 2/2] platform: generic: allwinner: Optimize current hart
 scratch access
In-Reply-To: <20240318144932.4165729-3-samuel.holland@sifive.com>
References: <20240318144932.4165729-1-samuel.holland@sifive.com> <20240318144932.4165729-3-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1a_x7-xE_4egefYVqaCqz+zaVU_A23QDnZOLtc8kAzFA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 18, 2024 at 8:19?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> The address of the local scratch area is stored in each hart's mscratch
> CSR. It is more efficient to read the CSR than to compute the address
> from the hart ID.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
>  platform/generic/allwinner/sun20i-d1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index e9388dba..67559b24 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -151,7 +151,7 @@ static void sun20i_d1_riscv_cfg_restore(void)
>
>  static void sun20i_d1_riscv_cfg_init(void)
>  {
> -       u64 entry = sbi_hartid_to_scratch(0)->warmboot_addr;
> +       u64 entry = sbi_scratch_thishart_ptr()->warmboot_addr;
>
>         /* Enable MMIO access. */
>         writel_relaxed(CCU_BGR_ENABLE, SUN20I_D1_CCU_BASE + RISCV_CFG_BGR_REG);
> --
> 2.43.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

