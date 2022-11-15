From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Nov 2022 16:46:20 +0530
Subject: [PATCH v2] lib: utils/serial: Fix semihosting compile error using LLVM
In-Reply-To: <20221108121016.1441356-1-apatel@ventanamicro.com>
References: <20221108121016.1441356-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy0GrckC+SG7k2h-mz0=WjGh79HEhswGiac-0eoLWxvP8w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 8, 2022 at 5:40 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We fix the following semihosting compile error observed using LLVM:
> lib/utils/serial/semihosting.c:158:12: error: result of comparison of constant -1 with expression of type 'char' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>                 ret = ch > -1 ? ch : -1;
>                       ~~ ^ ~~
>
> Fixes: 7f09fba86e43 ("lib: utils/serial: add semihosting support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  lib/utils/serial/semihosting.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> index 5012fa1..86fa296 100644
> --- a/lib/utils/serial/semihosting.c
> +++ b/lib/utils/serial/semihosting.c
> @@ -154,8 +154,8 @@ static int semihosting_getc(void)
>         int ret;
>
>         if (semihosting_infd < 0)  {
> -               ch = semihosting_trap(SYSREADC, NULL);
> -               ret = ch > -1 ? ch : -1;
> +               ret = semihosting_trap(SYSREADC, NULL);
> +               ret = ret < 0 ? -1 : ret;
>         } else
>                 ret = semihosting_read(semihosting_infd, &ch, 1) > 0 ? ch : -1;
>
> --
> 2.34.1
>

