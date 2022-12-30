From: Samuel Holland <samuel@sholland.org>
Date: Fri, 30 Dec 2022 10:29:42 -0600
Subject: [PATCH] lib: sbi_hsm: Rename 'priv' argument to 'arg1'
In-Reply-To: <20221230050723.1966623-1-bmeng@tinylab.org>
References: <20221230050723.1966623-1-bmeng@tinylab.org>
Message-ID: <b13f4620-c700-fc58-0ef2-9e60486ee4a5@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/29/22 23:07, Bin Meng wrote:
> 'priv' argument of sbi_hsm_hart_start() and sbi_hsm_hart_suspend()
> may mislead people to think it stands for 'privilege mode', but it
> is not. Change it to 'arg1' to clearly indicate the a1 register.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>  include/sbi/sbi_hsm.h | 4 ++--
>  lib/sbi/sbi_hsm.c     | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

> diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
> index d6cc468..c2a728a 100644
> --- a/include/sbi/sbi_hsm.h
> +++ b/include/sbi/sbi_hsm.h
> @@ -59,12 +59,12 @@ void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch);
>  
>  int sbi_hsm_hart_start(struct sbi_scratch *scratch,
>  		       const struct sbi_domain *dom,
> -		       u32 hartid, ulong saddr, ulong smode, ulong priv);
> +		       u32 hartid, ulong saddr, ulong smode, ulong arg1);
>  int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
>  void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch);
>  void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch);
>  int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
> -			 ulong raddr, ulong rmode, ulong priv);
> +			 ulong raddr, ulong rmode, ulong arg1);
>  int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
>  int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
>  				    ulong hbase, ulong *out_hmask);
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 836008f..c0a5505 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -248,7 +248,7 @@ fail_exit:
>  
>  int sbi_hsm_hart_start(struct sbi_scratch *scratch,
>  		       const struct sbi_domain *dom,
> -		       u32 hartid, ulong saddr, ulong smode, ulong priv)
> +		       u32 hartid, ulong saddr, ulong smode, ulong arg1)
>  {
>  	unsigned long init_count;
>  	unsigned int hstate;
> @@ -281,7 +281,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
>  		return SBI_EINVAL;
>  
>  	init_count = sbi_init_count(hartid);
> -	rscratch->next_arg1 = priv;
> +	rscratch->next_arg1 = arg1;
>  	rscratch->next_addr = saddr;
>  	rscratch->next_mode = smode;
>  
> @@ -402,7 +402,7 @@ void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch)
>  }
>  
>  int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
> -			 ulong raddr, ulong rmode, ulong priv)
> +			 ulong raddr, ulong rmode, ulong arg1)
>  {
>  	int oldstate, ret;
>  	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
> @@ -433,7 +433,7 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>  	}
>  
>  	/* Save the resume address and resume mode */
> -	scratch->next_arg1 = priv;
> +	scratch->next_arg1 = arg1;
>  	scratch->next_addr = raddr;
>  	scratch->next_mode = rmode;
>  


