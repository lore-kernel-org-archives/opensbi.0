From: Xiang W <wxjstz@126.com>
Date: Mon, 30 Aug 2021 10:50:07 +0800
Subject: [PATCH v2] lib: sbi: protect dprintf output with spinlock
In-Reply-To: <20210828064502.7227-1-Dd_nirvana@sjtu.edu.cn>
References: <20210828064502.7227-1-Dd_nirvana@sjtu.edu.cn>
Message-ID: <8e0a879265c7817ba07e6e64353d81a2816b46b2.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-08-28???? 14:45 +0800?Dong Du???
> Avoid getting messages from multiple harts (using dprintf and printf)
> concurrently with a spinlock serializaing calls to sbi_dprintf(),
> sbi_printf() and sbi_puts()
> 
> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

look good to me.
Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/sbi/sbi_console.c | 5 ++++-
> ?1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index b54f7a2..29eede3 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -387,8 +387,11 @@ int sbi_dprintf(const char *format, ...)
> ????????struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> ?
> ????????va_start(args, format);
> -???????if (scratch->options & SBI_SCRATCH_DEBUG_PRINTS)
> +???????if (scratch->options & SBI_SCRATCH_DEBUG_PRINTS) {
> +???????????????spin_lock(&console_out_lock);
> ????????????????retval = print(NULL, NULL, format, args);
> +???????????????spin_unlock(&console_out_lock);
> +???????}
> ????????va_end(args);
> ?
> ????????return retval;
> -- 
> 2.31.1
> 
> 



