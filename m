From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Jan 2023 23:14:27 +0530
Subject: [PATCH 3/9] lib: sbi: Add permissions for the firmware start till end
In-Reply-To: <20221220104625.80667-4-hchauhan@ventanamicro.com>
References: <20221220104625.80667-1-hchauhan@ventanamicro.com> <20221220104625.80667-4-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3PYjY9TGpEgYeHWyiNrptqYATLrgc4-o2-YBXdq5O6FQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 20, 2022 at 4:17 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Change the zero flag to M-mode R/W/X flag for the firmware
> region.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_domain.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 8f9306c..01eff18 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -628,7 +628,8 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>         const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>
>         /* Root domain firmware memory region */
> -       sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size, 0,
> +       sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size,
> +                                 SBI_DOMAIN_MEMREGION_M_RWX,
>                                   &root_fw_region);
>         domain_memregion_initfw(&root_memregs[root_memregs_count++]);
>
> --
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

