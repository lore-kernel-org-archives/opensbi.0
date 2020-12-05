From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 5 Dec 2020 09:50:07 +0000
Subject: [PATCH v2 05/11] include: sbi: Use lower bits for domain memory
 region permissions
In-Reply-To: <20201204155224.733188-6-anup.patel@wdc.com>
References: <20201204155224.733188-1-anup.patel@wdc.com>
 <20201204155224.733188-6-anup.patel@wdc.com>
Message-ID: <DM6PR04MB6201863C855536551CFBAE5B8DF00@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel <Anup.Patel@wdc.com>
> Sent: 04 December 2020 21:22
> To: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>
> Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org; Anup
> Patel <Anup.Patel@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>
> Subject: [PATCH v2 05/11] include: sbi: Use lower bits for domain memory
> region permissions
> 
> We should use lower bits for domain memory region access permissions and
> higher bits for other domain memory region attributes. This helps us use
> same bit assignment for parsing domain memory region access permissions
> from device tree.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  include/sbi/sbi_domain.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h index
> 6f90b26..a7cb61e 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -39,8 +39,10 @@ struct sbi_domain_memregion {
>  #define SBI_DOMAIN_MEMREGION_READABLE		(1UL << 0)
>  #define SBI_DOMAIN_MEMREGION_WRITEABLE		(1UL << 1)
>  #define SBI_DOMAIN_MEMREGION_EXECUTABLE		(1UL << 2)
> -#define SBI_DOMAIN_MEMREGION_MMIO		(1UL << 3)
> -#define SBI_DOMAIN_MEMREGION_MMODE		(1UL << 4)
> +#define SBI_DOMAIN_MEMREGION_MMODE		(1UL << 3)
> +#define SBI_DOMAIN_MEMREGION_ACCESS_MASK	(0xfUL)
> +
> +#define SBI_DOMAIN_MEMREGION_MMIO		(1UL << 31)
>  	unsigned long flags;
>  };
> 
> --
> 2.25.1

Applied this patch to the riscv/opensbi repo.

Regards,
Anup


