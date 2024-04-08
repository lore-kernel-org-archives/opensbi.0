From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon, 8 Apr 2024 16:55:59 +0200
Subject: [PATCH v2] lib: sbi: Add missing sscrind and sscfg extensions in
 sbi_hart_ext[]
In-Reply-To: <20240320154531.1496553-1-cleger@rivosinc.com>
References: <20240320154531.1496553-1-cleger@rivosinc.com>
Message-ID: <746c550b-353c-43c8-ac7e-7578dd194515@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20.03.24 16:45, Cl?ment L?ger wrote:
> The sbi_hart_ext[] array is missing these two extensions ids. It is
> expected that this array contains all the extensions declaration at the
> same index of the SBI_HART_EXT_* define. Without this, when adding a new
> extension, there is a mismatch between ids and extension names and it
> can even display corrupted extension names.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
> 
> Changes in v2:
>   - Add _Static_assert() to check sbi_hart_ext[] array size
> 
> ---
>   lib/sbi/sbi_hart.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 3d13694..80efeaa 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -666,8 +666,13 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>   	__SBI_HART_EXT_DATA(sdtrig, SBI_HART_EXT_SDTRIG),
>   	__SBI_HART_EXT_DATA(smcsrind, SBI_HART_EXT_SMCSRIND),
>   	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
> +	__SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
> +	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
>   };
>   
> +_Static_assert(array_size(sbi_hart_ext) == SBI_HART_EXT_MAX,
> +	       "sbi_hart_ext[] array should contain all extensions ids");
> +
>   /**
>    * Get the hart extensions in string format
>    *

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

