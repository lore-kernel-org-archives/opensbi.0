From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 8 Nov 2022 12:36:43 +0100
Subject: [PATCH] firmware: payloads: Remove duplicate "ALIGN"
In-Reply-To: <tencent_A5A2CFBAF1C09F3968C9EB028F1242CCD60A@qq.com>
References: <tencent_A5A2CFBAF1C09F3968C9EB028F1242CCD60A@qq.com>
Message-ID: <20221108113643.njqgagnrabxqw66a@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 08, 2022 at 06:10:21PM +0800, 1220749046 at qq.com wrote:
> From: zhangleizheng <zhangleizheng@eswincomputing.com>
> 
> ". = ALIGN(0x1000)" is used redundantly in firmware/fw_base.ldS
> and fw_base.ldS files.
> 
> Signed-off-by: zhangleizheng <zhangleizheng@eswincomputing.com>
> ---
>  firmware/fw_base.ldS           | 2 --
>  firmware/payloads/test.elf.ldS | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index 220c043..382da25 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -24,8 +24,6 @@
>  		PROVIDE(_text_end = .);
>  	}
>  
> -	. = ALIGN(0x1000); /* Ensure next section is page aligned */
> -
>  	/* End of the code sections */
>  
>  	/* Beginning of the read-only data sections */
> diff --git a/firmware/payloads/test.elf.ldS b/firmware/payloads/test.elf.ldS
> index f3f3242..763103c 100644
> --- a/firmware/payloads/test.elf.ldS
> +++ b/firmware/payloads/test.elf.ldS
> @@ -33,8 +33,6 @@ SECTIONS
>  		PROVIDE(_text_end = .);
>  	}
>  
> -	. = ALIGN(0x1000); /* Ensure next section is page aligned */
> -
>  	/* End of the code sections */
>  
>  	/* Beginning of the read-only data sections */
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

