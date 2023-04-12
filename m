From: Xiang W <wxjstz@126.com>
Date: Wed, 12 Apr 2023 12:39:06 +0800
Subject: [PATCH 1/2] firmware: Optimize loading relocation type
In-Reply-To: <20230404044601.2835305-1-bmeng@tinylab.org>
References: <20230404044601.2835305-1-bmeng@tinylab.org>
Message-ID: <8663e8becb6ebbc48b131c4caa76734a9cc2da40.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-04-04???? 12:46 +0800?Bin Meng???
> 't5' already contains relocation type so don't bother reloading it.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> 
> ?firmware/fw_base.S | 1 -
> ?1 file changed, 1 deletion(-)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index ceef44f..e30aca6 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -95,7 +95,6 @@ _try_lottery:
> ????????lla?????t4, __dyn_sym_start
> ?
> ?4:
> -???????REG_L???t5, -(REGBYTES*2)(t0)???/* t5 <-- relocation info:type */
> ????????srli????t6, t5, SYM_INDEX???????/* t6 <--- sym table index */
> ????????andi????t5, t5, 0xFF????????????/* t5 <--- relocation type */
> ????????li??????t3, RELOC_TYPE
> -- 
> 2.25.1
> 
> 

