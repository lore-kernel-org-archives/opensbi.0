From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Mar 2022 20:59:54 +0530
Subject: [PATCH V4] include: Add check for offset fw_dynamic_info
In-Reply-To: <20220327082520.66613-1-wxjstz@126.com>
References: <20220327082520.66613-1-wxjstz@126.com>
Message-ID: <CAAhSdy1Vt9nWcsSekE4=2R9AZgiixiNqoE8wEy4Da1tidAH5Vg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Mar 27, 2022 at 1:55 PM Xiang W <wxjstz@126.com> wrote:
>
> Add static detection to prevent the modification of struct fw_dynamic_info
> from forgetting the modification of FW_DYNAMIC_INFO_xxx_OFFSET
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> V4 change:
> * comment style change

This and other patches adding static_assert() are already merged.

Regards,
Anup

>
>  include/sbi/fw_dynamic.h | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/include/sbi/fw_dynamic.h b/include/sbi/fw_dynamic.h
> index dea207b..d007b05 100644
> --- a/include/sbi/fw_dynamic.h
> +++ b/include/sbi/fw_dynamic.h
> @@ -74,6 +74,40 @@ struct fw_dynamic_info {
>          */
>         unsigned long boot_hart;
>  } __packed;
> +/**
> + * Prevent modification of struct fw_dynamic_info from affecting
> + * FW_DYNAMIC_INFO_xxx_OFFSET
> + */
> +_Static_assert(
> +       offsetof(struct fw_dynamic_info, magic)
> +               == FW_DYNAMIC_INFO_MAGIC_OFFSET,
> +       "struct fw_dynamic_info definition has changed, please redefine "
> +       "FW_DYNAMIC_INFO_MAGIC_OFFSET");
> +_Static_assert(
> +       offsetof(struct fw_dynamic_info, version)
> +               == FW_DYNAMIC_INFO_VERSION_OFFSET,
> +       "struct fw_dynamic_info definition has changed, please redefine "
> +       "FW_DYNAMIC_INFO_VERSION_OFFSET");
> +_Static_assert(
> +       offsetof(struct fw_dynamic_info, next_addr)
> +               == FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET,
> +       "struct fw_dynamic_info definition has changed, please redefine "
> +       "FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET");
> +_Static_assert(
> +       offsetof(struct fw_dynamic_info, next_mode)
> +               == FW_DYNAMIC_INFO_NEXT_MODE_OFFSET,
> +       "struct fw_dynamic_info definition has changed, please redefine "
> +       "FW_DYNAMIC_INFO_NEXT_MODE_OFFSET");
> +_Static_assert(
> +       offsetof(struct fw_dynamic_info, options)
> +               == FW_DYNAMIC_INFO_OPTIONS_OFFSET,
> +       "struct fw_dynamic_info definition has changed, please redefine "
> +       "FW_DYNAMIC_INFO_OPTIONS_OFFSET");
> +_Static_assert(
> +       offsetof(struct fw_dynamic_info, boot_hart)
> +               == FW_DYNAMIC_INFO_BOOT_HART_OFFSET,
> +       "struct fw_dynamic_info definition has changed, please redefine "
> +       "FW_DYNAMIC_INFO_BOOT_HART_OFFSET");
>
>  #endif
>
> --
> 2.30.2
>

