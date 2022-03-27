From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Mar 2022 10:00:49 +0530
Subject: [PATCH V2] sbi: Prevent modification of struct fw_dynamic_info
 from affecting FW_DYNAMIC_INFO_xxx_OFFSET
In-Reply-To: <20220316101918.80665-1-wxjstz@126.com>
References: <20220316101918.80665-1-wxjstz@126.com>
Message-ID: <CAAhSdy2_pv220eB6myDPW0vw+hiZOACQTpg-5pa8czbC7_kGMQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 16, 2022 at 3:50 PM Xiang W <wxjstz@126.com> wrote:
>
> Add static detection to prevent the modification of struct fw_dynamic_info
> from forgetting the modification of FW_DYNAMIC_INFO_xxx_OFFSET
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> V1 change:
> * Modify prompt information

Please use a shorter patch subject and "include: " prefix.

>
>  include/sbi/fw_dynamic.h | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/include/sbi/fw_dynamic.h b/include/sbi/fw_dynamic.h
> index dea207b..978f10b 100644
> --- a/include/sbi/fw_dynamic.h
> +++ b/include/sbi/fw_dynamic.h
> @@ -74,6 +74,38 @@ struct fw_dynamic_info {
>          */
>         unsigned long boot_hart;
>  } __packed;
> +/** Prevent modification of struct fw_dynamic_info from affecting
> + * FW_DYNAMIC_INFO_xxx_OFFSET */

This comment block should follow multi-line comment block style
/**
 *  __ xyz __
 */

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

Otherwise, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

I have taken care of the above comments at the time of merging
this patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

