From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Feb 2024 13:28:22 +0530
Subject: [PATCH v3 08/10] firmware: fw_base.S: Remove _relocate_lottery
In-Reply-To: <20240117104212.1055737-9-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com> <20240117104212.1055737-9-wxjstz@126.com>
Message-ID: <CAAhSdy04NhTP3DX4rZDvSWt2MYvZSeXM1ZF+eH=K=eVBJ+hPZg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 17, 2024 at 4:12?PM Xiang W <wxjstz@126.com> wrote:
>
> Remove _relocate_lottery and use _boot_status instead
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  firmware/fw_base.S | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index d4a6d3a..56bffe8 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -14,8 +14,8 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_trap.h>
>
> -#define BOOT_STATUS_RELOCATE_DONE      1
> -#define BOOT_STATUS_BOOT_HART_DONE     2

Add here:
#define BOOT_STATUS_LOTTERY_DONE      1

> +#define BOOT_STATUS_RELOCATE_DONE      2
> +#define BOOT_STATUS_BOOT_HART_DONE     3
>
>  .macro MOV_3R __d0, __s0, __d1, __s1, __d2, __s2
>         add     \__d0, \__s0, zero
> @@ -64,9 +64,9 @@ _start:
>         bne     a0, a6, _wait_relocate_copy_done
>  _try_lottery:
>         /* Jump to relocation wait loop if we don't get relocation lottery */
> -       lla     a6, _relocate_lottery
> +       lla     a6, _boot_status
>         li      a7, 1

Change this to:
li    a7, BOOT_STATUS_LOTTERY_DONE

> -       amoadd.w a6, a7, (a6)
> +       amoswap.w a6, a7, (a6)
>         bnez    a6, _wait_relocate_copy_done
>
>  #ifdef FW_PIC
> @@ -100,8 +100,6 @@ _relocate:
>         blt     t2, t0, _relocate_copy_to_upper
>  _relocate_copy_to_lower:
>         ble     t1, t2, _relocate_copy_to_lower_loop
> -       lla     t3, _relocate_lottery
> -       BRANGE  t2, t1, t3, _start_hang
>         lla     t3, _boot_status
>         BRANGE  t2, t1, t3, _start_hang
>         lla     t3, _relocate
> @@ -118,8 +116,6 @@ _relocate_copy_to_lower_loop:
>         jr      t4
>  _relocate_copy_to_upper:
>         ble     t3, t0, _relocate_copy_to_upper_loop
> -       lla     t2, _relocate_lottery
> -       BRANGE  t0, t3, t2, _start_hang
>         lla     t2, _boot_status
>         BRANGE  t0, t3, t2, _start_hang
>         lla     t2, _relocate
> @@ -470,8 +466,6 @@ _skip_trap_handler_rv32_hyp:
>
>         .data
>         .align 3
> -_relocate_lottery:
> -       RISCV_PTR       0
>  _boot_status:
>         RISCV_PTR       0
>
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

