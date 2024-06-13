From: Li, Yong <yong.li@intel.com>
Date: Thu, 13 Jun 2024 02:53:53 +0000
Subject: [PATCH] lib:sbi fix the trap_regs point misalignment issue
In-Reply-To: <477b211d01c6f1cefb8b38adac4f41dc00c358fd.1718162420.git.yong.li@intel.com>
References: <477b211d01c6f1cefb8b38adac4f41dc00c358fd.1718162420.git.yong.li@intel.com>
Message-ID: <SJ2PR11MB8539E8A63388D892576E812AFBC12@SJ2PR11MB8539.namprd11.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Li, Yong <yong.li@intel.com>
> Sent: Wednesday, June 12, 2024 11:24 AM
> To: opensbi at lists.infradead.org
> Cc: Li, Yong <yong.li@intel.com>; Yu Chien Peter Lin
> <peterlin@andestech.com>
> Subject: [PATCH] lib:sbi fix the trap_regs point misalignment issue
> 
> This is to make the trap_regs pointer consistant with the one in
> CSR_MSCRATCH, in which a new sbi_trap_info and sbi_trap_context were
> introduced which caused the regression issue in domain context
> 
> Cc: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Yong Li <yong.li@intel.com>

This patch has been covered in previous Peter's patch,
"sbi: sbi_domain_context: Fix trap context for domain context switching"

No need to follow. 

Thanks,
Yong Li

> ---
>  lib/sbi/sbi_domain_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c index
> 7528591..5a8f616 100755
> --- a/lib/sbi/sbi_domain_context.c
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -67,7 +67,7 @@ static void switch_to_next_domain_context(struct
> sbi_context *ctx,
> 
>  	/* Save current trap state and restore target domain's trap state */
>  	trap_regs = (struct sbi_trap_regs *)(csr_read(CSR_MSCRATCH) -
> -					     SBI_TRAP_REGS_SIZE);
> +					     SBI_TRAP_CONTEXT_SIZE);
>  	sbi_memcpy(&ctx->regs, trap_regs, sizeof(*trap_regs));
>  	sbi_memcpy(trap_regs, &dom_ctx->regs, sizeof(*trap_regs));
> 
> --
> 2.25.1


