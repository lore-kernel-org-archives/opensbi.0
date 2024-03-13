From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 13 Mar 2024 14:47:31 +0100
Subject: [PATCH v2 09/10] lib: sbi: Pass trap context pointer to
 sbi_ecall_handler()
In-Reply-To: <20240312102804.1436376-10-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-10-apatel@ventanamicro.com>
Message-ID: <ae2f7a90-c560-423a-9826-15d045b365ba@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/03/2024 11:28, Anup Patel wrote:
> To be consistent with other trap handlers, pass trap context pointer
> to sbi_ecall_handler().
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_ecall.h | 4 ++--
>  lib/sbi/sbi_ecall.c     | 3 ++-
>  lib/sbi/sbi_trap.c      | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
> index 0bf42d1..0b35eff 100644
> --- a/include/sbi/sbi_ecall.h
> +++ b/include/sbi/sbi_ecall.h
> @@ -18,7 +18,7 @@
>  #define SBI_OPENSBI_IMPID		1
>  
>  struct sbi_trap_regs;
> -struct sbi_trap_info;
> +struct sbi_trap_context;
>  
>  struct sbi_ecall_return {
>  	/* Return flag to skip register update */
> @@ -87,7 +87,7 @@ int sbi_ecall_register_extension(struct sbi_ecall_extension *ext);
>  
>  void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext);
>  
> -int sbi_ecall_handler(struct sbi_trap_regs *regs);
> +int sbi_ecall_handler(struct sbi_trap_context *tcntx);
>  
>  int sbi_ecall_init(void);
>  
> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> index 631c5dd..d4fc58c 100644
> --- a/lib/sbi/sbi_ecall.c
> +++ b/lib/sbi/sbi_ecall.c
> @@ -95,9 +95,10 @@ void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext)
>  		sbi_list_del_init(&ext->head);
>  }
>  
> -int sbi_ecall_handler(struct sbi_trap_regs *regs)
> +int sbi_ecall_handler(struct sbi_trap_context *tcntx)
>  {
>  	int ret = 0;
> +	struct sbi_trap_regs *regs = &tcntx->regs;
>  	struct sbi_ecall_extension *ext;
>  	unsigned long extension_id = regs->a7;
>  	unsigned long func_id = regs->a6;
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index ebf454d..0b35d1a 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -299,7 +299,7 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
>  		break;
>  	case CAUSE_SUPERVISOR_ECALL:
>  	case CAUSE_MACHINE_ECALL:
> -		rc  = sbi_ecall_handler(regs);
> +		rc  = sbi_ecall_handler(tcntx);
>  		msg = "ecall handler failed";
>  		break;
>  	case CAUSE_LOAD_ACCESS:

Reviewed-by: Cl?ment L?ger <cleger@rivosinc.com>

Thanks,

Cl?ment

