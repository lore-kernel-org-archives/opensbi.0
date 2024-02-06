From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Feb 2024 13:13:25 +0530
Subject: [PATCH v3 07/10] firmware: fw_dynamic.S: Remove _bad_dynamic_info
In-Reply-To: <20240117104212.1055737-8-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com> <20240117104212.1055737-8-wxjstz@126.com>
Message-ID: <CAAhSdy2rNUG2AyHaiyRCsROXSHQ_Zz+Q4mUzwEbMj+gLgf=FNw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 17, 2024 at 4:12?PM Xiang W <wxjstz@126.com> wrote:
>
> _bad_dynamic_info is same as _start_hang, so remove it.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  firmware/fw_dynamic.S | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
> index 7ff1c6a..5ee2883 100644
> --- a/firmware/fw_dynamic.S
> +++ b/firmware/fw_dynamic.S
> @@ -11,12 +11,6 @@
>
>  #include "fw_base.S"
>
> -       .section .entry, "ax", %progbits
> -       .align 3
> -_bad_dynamic_info:
> -       wfi
> -       j       _bad_dynamic_info
> -
>         .section .entry, "ax", %progbits
>         .align 3
>         .global fw_boot_hart
> @@ -30,10 +24,10 @@ fw_boot_hart:
>         /* Sanity checks */
>         li      a1, FW_DYNAMIC_INFO_MAGIC_VALUE
>         REG_L   a0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
> -       bne     a0, a1, _bad_dynamic_info
> +       bne     a0, a1, _start_hang
>         li      a1, FW_DYNAMIC_INFO_VERSION_MAX
>         REG_L   a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
> -       bgt     a0, a1, _bad_dynamic_info
> +       bgt     a0, a1, _start_hang
>
>         /* Read boot HART id */
>         li      a1, FW_DYNAMIC_INFO_VERSION_2
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

