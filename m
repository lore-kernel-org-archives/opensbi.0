From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu, 9 May 2024 16:13:27 +0530
Subject: [PATCH v2 4/5] lib: sbi: fix DBTR_SHMEM_MAKE_PHYS for RV64
In-Reply-To: <20240423145743.392718-5-wxjstz@126.com>
References: <20240423145743.392718-1-wxjstz@126.com>
 <20240423145743.392718-5-wxjstz@126.com>
Message-ID: <98bad5f6-a24f-4d64-9251-5d1d0f2a7366@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 23/04/24 20:27, Xiang W wrote:
> Obtaining a 64-bit address under rv64 does not require combining
> 32-bit registers
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>   lib/sbi/sbi_dbtr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 4093a82..29be9bb 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -48,7 +48,7 @@ static unsigned long hart_state_ptr_offset;
>   	     _idx++, _entry = ((_etype *)_base + _idx))
>   
>   #if __riscv_xlen == 64
> -#define DBTR_SHMEM_MAKE_PHYS(_p_hi, _p_lo) (((u64)(_p_hi) << 32) | (_p_lo))
> +#define DBTR_SHMEM_MAKE_PHYS(_p_hi, _p_lo) (_p_lo)
>   #elif __riscv_xlen == 32
>   #define DBTR_SHMEM_MAKE_PHYS(_p_hi, _p_lo) (((u64)(_p_hi) << 32) | (_p_lo))
>   #else
LGTM

Reviewed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Regards
Himanshu

