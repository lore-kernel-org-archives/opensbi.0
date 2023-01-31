From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 31 Jan 2023 18:32:47 +0100
Subject: [PATCH v5 2/8] lib: sbi: Add sbi_nputs() function
In-Reply-To: <20230113114110.1916226-3-apatel@ventanamicro.com>
References: <20230113114110.1916226-1-apatel@ventanamicro.com>
 <20230113114110.1916226-3-apatel@ventanamicro.com>
Message-ID: <20230131173247.hxh3s4xhlufmnuvm@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 13, 2023 at 05:11:04PM +0530, Anup Patel wrote:
> We add new sbi_nputs() which help us print a fixed number of characters
> from a physical memory location.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Xiang W <wxjstz@126.com>
> ---
>  include/sbi/sbi_console.h |  2 ++
>  lib/sbi/sbi_console.c     | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> index e15b55d..1bdeeb9 100644
> --- a/include/sbi/sbi_console.h
> +++ b/include/sbi/sbi_console.h
> @@ -33,6 +33,8 @@ void sbi_putc(char ch);
>  
>  void sbi_puts(const char *str);
>  
> +void sbi_nputs(const char *str, unsigned long len);
> +
>  void sbi_gets(char *s, int maxwidth, char endchar);
>  
>  int __printf(2, 3) sbi_sprintf(char *out, const char *format, ...);
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index bb6e1ef..946c61d 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -51,6 +51,16 @@ void sbi_puts(const char *str)
>  	spin_unlock(&console_out_lock);
>  }
>  
> +void sbi_nputs(const char *str, unsigned long len)
> +{
> +	unsigned long i;
> +
> +	spin_lock(&console_out_lock);
> +	for (i = 0; i < len; i++)
> +		sbi_putc(str[i]);

sbi_putc() adds '\r' after '\n'. So, sbi_nputs("\n\n\n\n", 4)
actually outputs 8 chars, but I imagine the new debug extension
will still report it only wrote 4. Is that a problem?

Thanks,
drew


> +	spin_unlock(&console_out_lock);
> +}
> +
>  void sbi_gets(char *s, int maxwidth, char endchar)
>  {
>  	int ch;
> -- 
> 2.34.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

