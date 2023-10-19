From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 19 Oct 2023 10:43:06 +0200
Subject: [PATCH] include: sbi: Change spec version to 2.0
In-Reply-To: <20231010102125.603343-1-apatel@ventanamicro.com>
References: <20231010102125.603343-1-apatel@ventanamicro.com>
Message-ID: <20231019-1a0cc8a5a3643dbf4d4d51f6@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 10, 2023 at 03:51:25PM +0530, Anup Patel wrote:
> Now that SBI v2.0 specification is frozen, we change spec verion
> implemented by OpenSBI to v2.0.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_ecall.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
> index 90f33ba..027213c 100644
> --- a/include/sbi/sbi_ecall.h
> +++ b/include/sbi/sbi_ecall.h
> @@ -13,7 +13,7 @@
>  #include <sbi/sbi_types.h>
>  #include <sbi/sbi_list.h>
>  
> -#define SBI_ECALL_VERSION_MAJOR		1
> +#define SBI_ECALL_VERSION_MAJOR		2
>  #define SBI_ECALL_VERSION_MINOR		0
>  #define SBI_OPENSBI_IMPID		1
>  
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


It'd be good to get this merged and also build a new version of opensbi
which can be incorporated into QEMU. Without this change several new SBI
extensions won't be usable by Linux, even though the implementations are
present, because Linux checks that the SBI implementation version is at
least as big as the spec version where the extensions were frozen.

Thanks,
drew

