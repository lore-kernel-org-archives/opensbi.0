From: Dong Du <dd_nirvana@sjtu.edu.cn>
Date: Sat, 8 Jan 2022 16:34:10 +0800 (CST)
Subject: [PATCH 1/2] lib: utils/ipi: Fix size check in
 aclint_mswi_cold_init()
In-Reply-To: <20220108040336.14414-2-apatel@ventanamicro.com>
References: <20220108040336.14414-1-apatel@ventanamicro.com>
 <20220108040336.14414-2-apatel@ventanamicro.com>
Message-ID: <862770052.10086734.1641630850846.JavaMail.zimbra@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Jan 8, 2022, at 12:03 PM, Anup Patel apatel at ventanamicro.com wrote:

> Currently, the ACLINT MSWI size check is forcing size to be at least
> 0x4000. This is inappropriate check because most systems will never
> utilize full 16KB for a single ACLINT MSWI device so instead we should
> check that ACLINT MSWI size is enough for on the associated HARTs.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> lib/utils/ipi/aclint_mswi.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
> index a3de2f5..832e223 100644
> --- a/lib/utils/ipi/aclint_mswi.c
> +++ b/lib/utils/ipi/aclint_mswi.c
> @@ -74,7 +74,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
> 
> 	/* Sanity checks */
> 	if (!mswi || (mswi->addr & (ACLINT_MSWI_ALIGN - 1)) ||
> -	    (mswi->size < ACLINT_MSWI_SIZE) ||
> +	    (mswi->size < (mswi->hart_count * sizeof(u32))) ||

Hi Anup,
 
    Shouldn't we also change ACLINT_MSWI_SIZE in lib/utils/ipi/fdt_ipi_mswi.c?

Regards,
Dong

> 	    (mswi->first_hartid >= SBI_HARTMASK_MAX_BITS) ||
> 	    (mswi->hart_count > ACLINT_MSWI_MAX_HARTS))
> 		return SBI_EINVAL;
> --
> 2.25.1
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

