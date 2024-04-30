From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 30 Apr 2024 15:11:41 +0530
Subject: [PATCH v2 2/5] lib: sbi: Remove unnecessary
 sbi_dbtr_shmem_disabled
In-Reply-To: <20240423145743.392718-3-wxjstz@126.com>
References: <20240423145743.392718-1-wxjstz@126.com>
 <20240423145743.392718-3-wxjstz@126.com>
Message-ID: <5707af4e-b737-4f16-8b3e-7a1cc14d79af@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 23/04/24 20:27, Xiang W wrote:
> The code of hart_shmem_base is similar to sbi_dbtr_shmem_disabled.
> When hart_shmem_base is used, sbi_dbtr_shmem_disabled can be
> removed.
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>   lib/sbi/sbi_dbtr.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 5b07285..ceff185 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -537,10 +537,9 @@ int sbi_dbtr_read_trig(unsigned long smode,
>   	    trig_idx_base + trig_count >= hs->total_trigs)
>   		return SBI_ERR_INVALID_PARAM;
>   
> -	if (sbi_dbtr_shmem_disabled())
> -		return SBI_ERR_NO_SHMEM;
> -
>   	shmem_base = hart_shmem_base();
> +	if (shmem_base == NULL)
> +		return SBI_ERR_NO_SHMEM;
>   
>   	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
>   		sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
> @@ -567,10 +566,10 @@ int sbi_dbtr_install_trig(unsigned long smode,
>   	struct sbi_dbtr_trigger *trig;
>   	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>   
> -	if (sbi_dbtr_shmem_disabled())
> +	shmem_base = hart_shmem_base();
> +	if (shmem_base == NULL)
>   		return SBI_ERR_NO_SHMEM;
>   
> -	shmem_base = hart_shmem_base();
>   	hs = dbtr_thishart_state_ptr();
>   
>   	/* Check requested triggers configuration */
> @@ -679,10 +678,10 @@ int sbi_dbtr_update_trig(unsigned long smode,
>   	void *shmem_base = NULL;
>   	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>   
> -	if (sbi_dbtr_shmem_disabled())
> +	shmem_base = hart_shmem_base();
> +	if (shmem_base == NULL)
>   		return SBI_ERR_NO_SHMEM;
>   
> -	shmem_base = hart_shmem_base();
>   	hs = dbtr_thishart_state_ptr();
>   	if (!hs)
>   		return SBI_ERR_FAILED;

I would still keep the sbi_dbtr_shmem_disabled() for brevity of usage.
Better, change sbi_dbtr_shmem_disabled() code to do this check and 
return true/false.

Regards
Himanshu

