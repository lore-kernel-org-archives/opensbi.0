From: Xiang W <wxjstz@126.com>
Date: Wed, 04 Oct 2023 19:48:20 +0800
Subject: [PATCH v2 1/1] lib: utils: Simplify SET_ISA_EXT_MAP()
In-Reply-To: <20230928121720.41669-1-heinrich.schuchardt@canonical.com>
References: <20230928121720.41669-1-heinrich.schuchardt@canonical.com>
Message-ID: <fc00fd7b82fd5013065ad9526a7a26cc0634cdb4.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-09-28???? 14:17 +0200?Heinrich Schuchardt???
> The define is hard to read. The continue statement does not do what was
> intended.
> 
> * Remove do {} while (false);
> * Change the name to set_multi_letter_ext
> ? - Other local macros are lower case too.
> ? - Refer to the fact that this is only used for multi-letter extensions.
> 
> Addresses-Coverity-ID: 1568359 Unexpected control flow
> Fixes: d72f5f17478d ("lib: utils: Add detection of Smepmp from ISA string in FDT")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> v2:
> 	keep continue statement
> 	rename macro
> ---
> ?lib/utils/fdt/fdt_helper.c | 13 ++++++-------
> ?1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index c97f09d..b97ff74 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -369,16 +369,15 @@ static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
> ?		if (!j)
> ?			continue;
> ?
> -#define SET_ISA_EXT_MAP(name, bit)				\
> -		do {						\
> -			if (!strcmp(mstr, name)) {		\
> +#define set_multi_letter_ext(name, bit)				\
> +		{						\
> +			if (!strcmp(mstr, name))		\
> ?				__set_bit(bit, extensions);	\
> ?				continue;			\
> -			}					\
> -		} while (false)					\
> +		}						\
> ?
> -		SET_ISA_EXT_MAP("smepmp", SBI_HART_EXT_SMEPMP);
> -#undef SET_ISA_EXT_MAP
> +		set_multi_letter_ext("smepmp", SBI_HART_EXT_SMEPMP);
> +#undef set_multi_letter_ext
> ?	}
> ?
> ?	return 0;
> -- 
> 2.40.1
> 
> 


