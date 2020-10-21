From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 21 Oct 2020 07:07:11 +0000
Subject: [PATCH v4 14/16] lib: sbi: Configure PMP based on domain memory
 regions
In-Reply-To: <20201020093930.2551352-15-anup.patel@wdc.com>
References: <20201020093930.2551352-1-anup.patel@wdc.com>
 <20201020093930.2551352-15-anup.patel@wdc.com>
Message-ID: <DM6PR04MB62019625DD9BA8896CD8DF398D1C0@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel <Anup.Patel@wdc.com>
> Sent: 20 October 2020 15:09
> To: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>
> Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org; Anup
> Patel <Anup.Patel@wdc.com>
> Subject: [PATCH v4 14/16] lib: sbi: Configure PMP based on domain memory
> regions
> 
> The PMP configuration on each HART should be only based on the memory
> regions of the assigned domain because each domain includes a memory
> region to protect the underlying firmware.
> 
> This patch updates the sbi_hart_pmp_configure() function accordingly.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_hart.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c index ea5d479..1871a1e
> 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -13,6 +13,7 @@
>  #include <sbi/riscv_fp.h>
>  #include <sbi/sbi_bitops.h>
>  #include <sbi/sbi_console.h>
> +#include <sbi/sbi_domain.h>
>  #include <sbi/sbi_csr_detect.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hart.h>
> @@ -184,24 +185,30 @@ void sbi_hart_pmp_dump(struct sbi_scratch
> *scratch)
> 
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch)  {
> -	u32 pmp_idx = 0;
> -	unsigned long fw_start, fw_size_log2;
> +	struct sbi_domain_memregion *reg;
> +	struct sbi_domain *dom = sbi_domain_thishart_ptr();
> +	unsigned int pmp_idx = 0, pmp_flags;
> +	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
> 
> -	if (!sbi_hart_pmp_count(scratch))
> +	if (!pmp_count)
>  		return 0;
> 
> -	/* Firmware PMP region to protect OpenSBI firmware */
> -	fw_size_log2 = log2roundup(scratch->fw_size);
> -	fw_start = scratch->fw_start & ~((1UL << fw_size_log2) - 1UL);
> -	pmp_set(pmp_idx++, 0, fw_start, fw_size_log2);
> -
> -	/*
> -	 * Default PMP region for allowing S-mode and U-mode access to
> -	 * memory not covered by:
> -	 * 1) Firmware PMP region
> -	 * 2) Platform specific PMP regions
> -	 */
> -	pmp_set(pmp_idx++, PMP_R | PMP_W | PMP_X, 0, __riscv_xlen);
> +	sbi_domain_for_each_memregion(dom, reg) {
> +		if (pmp_count <= pmp_idx)
> +			break;
> +
> +		pmp_flags = 0;
> +		if (reg->flags & SBI_DOMAIN_MEMREGION_READABLE)
> +			pmp_flags |= PMP_R;
> +		if (reg->flags & SBI_DOMAIN_MEMREGION_WRITEABLE)
> +			pmp_flags |= PMP_W;
> +		if (reg->flags & SBI_DOMAIN_MEMREGION_EXECUTABLE)
> +			pmp_flags |= PMP_X;
> +		if (reg->flags & SBI_DOMAIN_MEMREGION_MMODE)
> +			pmp_flags |= PMP_L;
> +
> +		pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
> +	}
> 
>  	return 0;
>  }
> --
> 2.25.1

Applied this patch to the riscv/opensbi repo

Regards,
Anup

