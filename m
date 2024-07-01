From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 1 Jul 2024 08:25:13 +0200
Subject: [PATCH v2 1/3] lib: sbi: print before sbi_console_init
In-Reply-To: <20240624141903.2305676-2-wxjstz@126.com>
References: <20240624141903.2305676-1-wxjstz@126.com>
 <20240624141903.2305676-2-wxjstz@126.com>
Message-ID: <20240701-e6d6d2c7993c6c903c4e1034@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 24, 2024 at 10:18:57PM GMT, Xiang W wrote:
> The information from the print is cached via a ring buffer and
> output to the console after initialization is complete.
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_console.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index d3ec461..1a91f88 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -19,6 +19,8 @@
>  static const struct sbi_console_device *console_dev = NULL;
>  static char console_tbuf[CONSOLE_TBUF_MAX];
>  static u32 console_tbuf_len;
> +static u32 console_tbuf_stat;
> +static u32 console_tbuf_i;
>  static spinlock_t console_out_lock	       = SPIN_LOCK_INITIALIZER;
>  
>  bool sbi_isprintable(char c)
> @@ -135,6 +137,24 @@ static void printc(char **out, u32 *out_len, char ch, int flags)
>  		return;
>  	}
>  
> +	/* early print before sbi_console_init */
> +	if (!console_dev && (flags & USE_TBUF)) {
> +		/*
> +		 * console_tbuf_stat
> +		 *   0 buff is empty
> +		 *   1 buff is not empty and does not overflow
> +		 *   2 buff is overflow
> +		 */
> +		console_tbuf [console_tbuf_i++] = ch;
                            ^
                            ^ remove the blank here

> +		if (console_tbuf_stat == 0)
> +			console_tbuf_stat = 1;
> +		if (console_tbuf_i == CONSOLE_TBUF_MAX) {
> +			console_tbuf_stat = 2;
> +			console_tbuf_i = 0;
> +		}
> +		return;
> +	}
> +
>  	/*
>  	 * The *printf entry point functions have enforced that (*out) can
>  	 * only be null when out_len is non-null and its value is zero.
> @@ -476,6 +496,15 @@ void sbi_console_set_device(const struct sbi_console_device *dev)
>  		return;
>  
>  	console_dev = dev;
> +
> +	if (console_tbuf_stat == 2)
> +		sbi_nputs(console_tbuf + console_tbuf_i,
> +				CONSOLE_TBUF_MAX - console_tbuf_i);
> +	if (console_tbuf_stat)
> +		sbi_nputs(console_tbuf, console_tbuf_i);
> +
> +	console_tbuf_stat = 0;
> +	console_tbuf_i = 0;
>  }
>  
>  int sbi_console_init(struct sbi_scratch *scratch)
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

