From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 9 Jun 2023 05:16:49 +0100
Subject: [PATCH v5 01/14] lib: sbi: Fix missing contine in print
In-Reply-To: <20230609033430.84471-2-wxjstz@126.com>
References: <20230609033430.84471-1-wxjstz@126.com>
 <20230609033430.84471-2-wxjstz@126.com>
Message-ID: <1794DCF8-26E3-44EB-8598-C6581AF29C85@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Jun 2023, at 04:34, Xiang W <wxjstz@126.com> wrote:
> 
> Missing continue after print %lu %ld %lx ...

What kind of commit message is this? What?s the exact bug?

Jess

> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> lib/sbi/sbi_console.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 168dffd..1f0727c 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -370,6 +370,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>     va_arg(args, long), 10, 1,
>     width, flags, '0');
> }
> + continue;
> }
> if (*format == 'c') {
> /* char are converted to int then pushed on the stack */
> -- 
> 2.39.2
> 


