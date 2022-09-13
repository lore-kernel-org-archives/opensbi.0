From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Sep 2022 16:22:02 +0530
Subject: [PATCH] lib: sbi: Fix sbi_strnlen wrong count decrement
In-Reply-To: <20220913094708.2089724-1-rpathak@ventanamicro.com>
References: <20220913094708.2089724-1-rpathak@ventanamicro.com>
Message-ID: <CAAhSdy1zKM=Lqj3Yuu_fsocuLBEOmqeVuUTGKzdJaoa8ykrYtQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 13, 2022 at 3:21 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> count(maxlen) should not be decremented here
>
> Fixes: 1901e8a287bc ("platform: Add minimal libc support.")
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>

This one slipped through our reviews. Thanks for catching.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_string.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
> index c163f3176506..9ebea693d0f6 100644
> --- a/lib/sbi/sbi_string.c
> +++ b/lib/sbi/sbi_string.c
> @@ -59,7 +59,6 @@ size_t sbi_strnlen(const char *str, size_t count)
>         while (*str != '\0' && ret < count) {
>                 ret++;
>                 str++;
> -               count--;
>         }
>
>         return ret;
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

