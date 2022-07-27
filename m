From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 27 Jul 2022 17:50:09 +0200
Subject: [PATCH v2] lib: sbi: Fix printf handling of long long
In-Reply-To: <TYYP286MB143938D036AFEF2F33EBF335C6979@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB143938D036AFEF2F33EBF335C6979@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <20220727155009.ix4dv5gb3r4nnpru@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 27, 2022 at 11:06:12PM +0800, dramforever wrote:
> Read long long arguments directly using va_arg. Remove original hack for
> RV32 that read a long long arg as two long args.
> 
> This un-breaks the case on RV64 where e.g. the long long is followed by
> an odd number of ints:
> 
>     sbi_printf("%d %lld", (int) 1, (long long) 2LL);
> 
> Signed-off-by: dramforever <dramforever@live.com>
> ---
>  lib/sbi/sbi_console.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index 34c843d..f18411b 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -261,22 +261,8 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
>  				continue;
>  			}
>  			if (*format == 'l' && *(format + 1) == 'l') {
> -				while (acnt &
> -				       (sizeof(unsigned long long) - 1)) {
> -					va_arg(args, int);
> -					acnt += sizeof(int);
> -				}
> -				if (sizeof(unsigned long long) ==
> -				    sizeof(unsigned long)) {
> -					tmp = va_arg(args, unsigned long long);
> -					acnt += sizeof(unsigned long long);
> -				} else {
> -					((unsigned long *)&tmp)[0] =
> -						va_arg(args, unsigned long);
> -					((unsigned long *)&tmp)[1] =
> -						va_arg(args, unsigned long);
> -					acnt += 2 * sizeof(unsigned long);
> -				}
> +				tmp = va_arg(args, unsigned long long);
> +				acnt += sizeof(unsigned long long);
>  				if (*(format + 2) == 'u') {
>  					format += 2;
>  					pc += printi(out, out_len, tmp, 10, 0,
> -- 
> 2.37.0
>

We need to remove all acnt lines from print() and the variable itself as
it's unused after the while loop above is removed.

Thanks,
drew 

