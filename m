From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Apr 2023 16:06:02 +0530
Subject: [PATCH v2] lib: sbi_scratch: Optimize the alignment code for
 alloc size
In-Reply-To: <20230309103528.78775-1-wxjstz@126.com>
References: <20230309103528.78775-1-wxjstz@126.com>
Message-ID: <CAAhSdy3-2MaQGT8-w4tOXPay7x+pFMATNt3RERcVtaivMVQKgw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 9, 2023 at 4:57?PM Xiang W <wxjstz@126.com> wrote:
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Changes in v2:
> - Added type conversion as suggested by Andreas Schwab to prevent
>   errors when extending sign bits
>
>  lib/sbi/sbi_scratch.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> index 87b34c6..55ebdbb 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -59,8 +59,8 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
>         if (!size)
>                 return 0;
>
> -       if (size & (__SIZEOF_POINTER__ - 1))
> -               size = (size & ~(__SIZEOF_POINTER__ - 1)) + __SIZEOF_POINTER__;
> +       size += __SIZEOF_POINTER__ - 1;
> +       size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
>
>         spin_lock(&extra_lock);
>
> --
> 2.39.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

