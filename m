From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Mar 2022 09:59:55 +0530
Subject: [PATCH V2] sbi: Prevent modification of struct sbi_scratch from
 affecting SBI_SCRATCH_xxx_OFFSET
In-Reply-To: <20220316101648.79880-1-wxjstz@126.com>
References: <20220316101648.79880-1-wxjstz@126.com>
Message-ID: <CAAhSdy17Qt50U4iAtxMbF0UBiA4d1z3fTBaim7qEvpT9xJKEdA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 16, 2022 at 3:47 PM Xiang W <wxjstz@126.com> wrote:
>
> Add static detection to prevent the modification of struct sbi_scratch
> from forgetting the modification of SBI_SCRATCH_xxx_OFFSET
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> V1 change:
> * Modify prompt information

Please use a shorter patch subject and "include: " prefix.

>
>  include/sbi/sbi_scratch.h | 57 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 0c27307..67b71cd 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -72,6 +72,63 @@ struct sbi_scratch {
>         /** Options for OpenSBI library */
>         unsigned long options;
>  };
> +/** Prevent modification of struct sbi_scratch from affecting
> + * SBI_SCRATCH_xxx_OFFSET */

This comment block should follow multi-line comment block style
/**
 *  __ xyz __
 */

> +_Static_assert(
> +       offsetof(struct sbi_scratch, fw_start)
> +               == SBI_SCRATCH_FW_START_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_FW_START_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, fw_size)
> +               == SBI_SCRATCH_FW_SIZE_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_FW_SIZE_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, next_arg1)
> +               == SBI_SCRATCH_NEXT_ARG1_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_NEXT_ARG1_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, next_addr)
> +               == SBI_SCRATCH_NEXT_ADDR_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_NEXT_ADDR_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, next_mode)
> +               == SBI_SCRATCH_NEXT_MODE_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_NEXT_MODE_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, warmboot_addr)
> +               == SBI_SCRATCH_WARMBOOT_ADDR_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_WARMBOOT_ADDR_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, platform_addr)
> +               == SBI_SCRATCH_PLATFORM_ADDR_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_PLATFORM_ADDR_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, hartid_to_scratch)
> +               == SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, trap_exit)
> +               == SBI_SCRATCH_TRAP_EXIT_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_TRAP_EXIT_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, tmp0)
> +               == SBI_SCRATCH_TMP0_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_TMP0_OFFSET");
> +_Static_assert(
> +       offsetof(struct sbi_scratch, options)
> +               == SBI_SCRATCH_OPTIONS_OFFSET,
> +       "struct sbi_scratch definition has changed, please redefine "
> +       "SBI_SCRATCH_OPTIONS_OFFSET");
>
>  /** Possible options for OpenSBI library */
>  enum sbi_scratch_options {
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

