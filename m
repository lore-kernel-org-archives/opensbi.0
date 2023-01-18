From: Anup Patel <anup@brainfault.org>
Date: Wed, 18 Jan 2023 13:28:22 +0530
Subject: [PATCH 5/5] lib: sbi: Program separate pmp entries for text and data
In-Reply-To: <20230109084049.31828-6-hchauhan@ventanamicro.com>
References: <20230109084049.31828-1-hchauhan@ventanamicro.com> <20230109084049.31828-6-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3L+EPst88vV1KYMB4sEjjzkhqtVtZf8h_vXT5x1OU4NQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 9, 2023 at 2:11 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Add two entries:
>     1. TEXT: fw_start to _fw_rw_offset with RX permissions
>     2. DATA: _fw_rw_offset to fw_size with RW permissions
>
> These permissions are still not enforced from M-mode but lay
> the ground work for enforcing them for M-mode. SU-mode don't
> have any access to these regions.
>
> Sample output:
> Domain0 Region01  : 0x0000000080000000-0x000000008001ffff M: (R,X) S/U: ()
> Domain0 Region02  : 0x0000000080020000-0x000000008003ffff M: (R,W) S/U: ()
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  lib/sbi/sbi_domain.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index f6addc4..8730c2c 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -638,11 +638,18 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>         const struct sbi_platform *plat = sbi_platform_ptr(scratch);

We need to do following checks as first thing in sbi_domain_init():
1) scratch->fw_rw_offset should be power-of-2 value
2) scratch->fw_start should be aligned to scratch->fw_rw_offset
    (i.e. (scratch->fw_start & (scratch->fw_rw_offset - 1)) == 0)

>
>         /* Root domain firmware memory region */
> -       sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size,
> -                                 SBI_DOMAIN_MEMREGION_M_RWX,
> +       sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
> +                                 (SBI_DOMAIN_MEMREGION_M_READABLE |
> +                                  SBI_DOMAIN_MEMREGION_M_EXECUTABLE),
>                                   &root_fw_region);
>         domain_memregion_initfw(&root_memregs[root_memregs_count++]);
>
> +       sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
> +                                 (scratch->fw_size - scratch->fw_rw_offset),
> +                                 (SBI_DOMAIN_MEMREGION_M_READABLE |
> +                                  SBI_DOMAIN_MEMREGION_M_WRITABLE),
> +                                 &root_memregs[root_memregs_count++]);
> +
>         /* Root domain allow everything memory region */
>         sbi_domain_memregion_init(0, ~0UL,
>                                   (SBI_DOMAIN_MEMREGION_READABLE |
> --
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

