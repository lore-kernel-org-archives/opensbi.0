From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 30 Apr 2024 15:08:57 +0530
Subject: [PATCH v2 3/5] lib: sbi: Removal unnecessary check
 dbtr_thishart_state_ptr
In-Reply-To: <20240423145743.392718-4-wxjstz@126.com>
References: <20240423145743.392718-1-wxjstz@126.com>
 <20240423145743.392718-4-wxjstz@126.com>
Message-ID: <f6bd765b-c342-45c9-a02e-ca359ecd3cd2@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 23/04/24 20:27, Xiang W wrote:
> After getting hart_shmem_base, dbtr_thishart_state_ptr cannot be
> empty. So remove check code.
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>   lib/sbi/sbi_dbtr.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index ceff185..4093a82 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -683,8 +683,6 @@ int sbi_dbtr_update_trig(unsigned long smode,
>   		return SBI_ERR_NO_SHMEM;
>   
>   	hs = dbtr_thishart_state_ptr();
> -	if (!hs)
> -		return SBI_ERR_FAILED;
>   
>   	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
>   		trig = INDEX_TO_TRIGGER(idx);

LGTM

Reviewed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

- Himanshu

