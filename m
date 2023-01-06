From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Jan 2023 17:46:31 +0530
Subject: [PATCH] lib: utils/serial: Simplify semihosting_getc() function
In-Reply-To: <20221222020403.23209-1-peterlin@andestech.com>
References: <20221222020403.23209-1-peterlin@andestech.com>
Message-ID: <CAAhSdy3s_zxOWo5JjE87LR-2g8GJxQG7LXQFHhdz5kmgD_vUYw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 7:34 AM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Simply pass the character returned by semihosting_trap(SYSREADC, NULL)
> on success, or -1 on failure. This also fixes issue [1] of comparison
> of constant -1 with char type.
>
> [1] https://github.com/riscv-software-src/opensbi/issues/269
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  lib/utils/serial/semihosting.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> index 5012fa1..cd15f91 100644
> --- a/lib/utils/serial/semihosting.c
> +++ b/lib/utils/serial/semihosting.c
> @@ -151,15 +151,11 @@ static void semihosting_putc(char ch)
>  static int semihosting_getc(void)
>  {
>         char ch = 0;
> -       int ret;
>
> -       if (semihosting_infd < 0)  {
> -               ch = semihosting_trap(SYSREADC, NULL);
> -               ret = ch > -1 ? ch : -1;

We have to return -1 upon any failure or no character. This is
as-per expectation of SBI v0.1 console_getchar()

Regards,
Anup

> -       } else
> -               ret = semihosting_read(semihosting_infd, &ch, 1) > 0 ? ch : -1;
> -
> -       return ret;
> +       if (semihosting_infd < 0)
> +               return semihosting_trap(SYSREADC, NULL);
> +       else
> +               return semihosting_read(semihosting_infd, &ch, 1) > 0 ? ch : -1;
>  }
>
>  static struct sbi_console_device semihosting_console = {
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

