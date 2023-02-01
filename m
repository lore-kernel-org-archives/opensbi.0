From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 1 Feb 2023 10:30:13 +0100
Subject: [PATCH v5 6/8] lib: sbi: Add console_puts() callback in the
 console device
In-Reply-To: <20230113114110.1916226-7-apatel@ventanamicro.com>
References: <20230113114110.1916226-1-apatel@ventanamicro.com>
 <20230113114110.1916226-7-apatel@ventanamicro.com>
Message-ID: <20230201093013.sibkotoeehynl7py@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 13, 2023 at 05:11:08PM +0530, Anup Patel wrote:
> We add console_puts() callback in the console device which allows
> console drivers (such as semihosting) to implement a specialized
> way to output character string.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>  include/sbi/sbi_console.h |  3 +++
>  lib/sbi/sbi_console.c     | 19 ++++++++++++++-----
>  2 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> index 660c239..8e95b9d 100644
> --- a/include/sbi/sbi_console.h
> +++ b/include/sbi/sbi_console.h
> @@ -19,6 +19,9 @@ struct sbi_console_device {
>  	/** Write a character to the console output */
>  	void (*console_putc)(char ch);
>  
> +	/** Write a character string to the console output */
> +	void (*console_puts)(const char *str, unsigned long len);

The spec draft says the write command is non-blocking and returns the
number of bytes written. So this interface should at least return the
number of bytes written. And, maybe it should take a flags parameter
where a NON_BLOCKING flag can be set? But, if we can't enforce the
console to be non-blocking at the SBI implementation level, then
maybe the spec should state that the calls may block?

Thanks,
drew

> +
>  	/** Read a character from the console input */
>  	int (*console_getc)(void);
>  };
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 89d6a49..c1b9f73 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -12,6 +12,7 @@
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_string.h>
>  
>  static const struct sbi_console_device *console_dev = NULL;
>  static spinlock_t console_out_lock	       = SPIN_LOCK_INITIALIZER;
> @@ -44,9 +45,13 @@ void sbi_putc(char ch)
>  void sbi_puts(const char *str)
>  {
>  	spin_lock(&console_out_lock);
> -	while (*str) {
> -		sbi_putc(*str);
> -		str++;
> +	if (console_dev && console_dev->console_puts) {
> +		console_dev->console_puts(str, sbi_strlen(str));
> +	} else {
> +		while (*str) {
> +			sbi_putc(*str);
> +			str++;
> +		}
>  	}
>  	spin_unlock(&console_out_lock);
>  }
> @@ -56,8 +61,12 @@ void sbi_nputs(const char *str, unsigned long len)
>  	unsigned long i;
>  
>  	spin_lock(&console_out_lock);
> -	for (i = 0; i < len; i++)
> -		sbi_putc(str[i]);
> +	if (console_dev && console_dev->console_puts) {
> +		console_dev->console_puts(str, len);
> +	} else {
> +		for (i = 0; i < len; i++)
> +			sbi_putc(str[i]);
> +	}
>  	spin_unlock(&console_out_lock);
>  }
>  
> -- 
> 2.34.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

