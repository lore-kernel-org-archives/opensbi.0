From: Anup Patel <anup@brainfault.org>
Date: Wed, 21 Jun 2023 11:18:37 +0530
Subject: [PATCH] firmware: Fix find hart index
In-Reply-To: <20230616070351.779644-1-wxjstz@126.com>
References: <20230616070351.779644-1-wxjstz@126.com>
Message-ID: <CAAhSdy3rzr0+Qy_rx079e0WaqF=mgrdSWbh-v9Zuoc1NaEiC+A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 16, 2023 at 12:34?PM Xiang W <wxjstz@126.com> wrote:
>
> After the loop to find the hartid is launched, assigning -1 to
> index will fail in the subsequent compare instruction bge. Fix
> This.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
>  firmware/fw_base.S | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index fff09e1..b947423 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -471,7 +471,6 @@ _start_warm:
>         add     s9, s9, 4
>         add     a4, a4, 1
>         blt     a4, s7, 1b
> -       li      a4, -1
>  2:     add     s6, a4, zero
>  3:     bge     s6, s7, _start_hang
>
> --
> 2.39.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

