From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 1 Feb 2023 10:22:35 +0100
Subject: [PATCH v5 8/8] lib: sbi: Speed-up sbi_printf() and friends using
 nputs()
In-Reply-To: <20230113114110.1916226-9-apatel@ventanamicro.com>
References: <20230113114110.1916226-1-apatel@ventanamicro.com>
 <20230113114110.1916226-9-apatel@ventanamicro.com>
Message-ID: <20230201092235.vessrt2t7jdc5hfl@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 13, 2023 at 05:11:10PM +0530, Anup Patel wrote:
> The sbi_printf() is slow for semihosting because it prints one
> character at a time. To speed-up sbi_printf() for semihosting,
> we use a temporary buffer and nputs().
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_console.c | 52 ++++++++++++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index c1b9f73..41881d7 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -42,31 +42,29 @@ void sbi_putc(char ch)
>  	}
>  }
>  
> -void sbi_puts(const char *str)
> +static void nputs(const char *str, unsigned long len)
>  {
> -	spin_lock(&console_out_lock);
> +	unsigned long i;
> +
>  	if (console_dev && console_dev->console_puts) {
> -		console_dev->console_puts(str, sbi_strlen(str));
> +		console_dev->console_puts(str, len);
>  	} else {
> -		while (*str) {
> -			sbi_putc(*str);
> -			str++;
> -		}
> +		for (i = 0; i < len; i++)
> +			sbi_putc(str[i]);
>  	}
> +}
> +
> +void sbi_puts(const char *str)
> +{
> +	spin_lock(&console_out_lock);
> +	nputs(str, sbi_strlen(str));
>  	spin_unlock(&console_out_lock);
>  }
>  
>  void sbi_nputs(const char *str, unsigned long len)
>  {
> -	unsigned long i;
> -
>  	spin_lock(&console_out_lock);
> -	if (console_dev && console_dev->console_puts) {
> -		console_dev->console_puts(str, len);
> -	} else {
> -		for (i = 0; i < len; i++)
> -			sbi_putc(str[i]);
> -	}
> +	nputs(str, len);
>  	spin_unlock(&console_out_lock);
>  }
>  
> @@ -102,6 +100,7 @@ unsigned long sbi_ngets(char *str, unsigned long len)
>  #define PAD_ZERO 2
>  #define PAD_ALTERNATE 4
>  #define PRINT_BUF_LEN 64
> +#define PRINT_TBUF_MAX 128
>  
>  #define va_start(v, l) __builtin_va_start((v), l)
>  #define va_end __builtin_va_end
> @@ -217,12 +216,26 @@ static int printi(char **out, u32 *out_len, long long i, int b, int sg,
>  
>  static int print(char **out, u32 *out_len, const char *format, va_list args)
>  {
> -	int width, flags;
> -	int pc = 0;
> -	char scr[2];
> +	u32 tbuf_len;
> +	int width, flags, pc = 0;
> +	char scr[2], *tout, tbuf[PRINT_TBUF_MAX];
> +	bool use_tbuf = (!out) ? true : false;

print() is only called with a non-null 'out' parameter or under
console_out_lock, so we can use global variable for the buffer
to avoid putting it on the stack, and it can be larger.

>  	unsigned long long tmp;
>  
> +	if (use_tbuf) {
> +		tbuf_len = PRINT_TBUF_MAX;
> +		tout = tbuf;
> +		out = &tout;
> +		out_len = &tbuf_len;
> +	}
> +
>  	for (; *format != 0; ++format) {
> +		if (use_tbuf && !tbuf_len) {
> +			nputs(tbuf, PRINT_TBUF_MAX);
> +			tbuf_len = PRINT_TBUF_MAX;
> +			tout = tbuf;
> +		}
> +
>  		if (*format == '%') {
>  			++format;
>  			width = flags = 0;
> @@ -348,6 +361,9 @@ literal:
>  		}
>  	}
>  
> +	if (use_tbuf && tbuf_len < PRINT_TBUF_MAX)
> +		nputs(tbuf, PRINT_TBUF_MAX - tbuf_len);
> +
>  	return pc;
>  }
>  
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

