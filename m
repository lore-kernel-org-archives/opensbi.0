From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 Mar 2024 19:13:51 +0530
Subject: [PATCH v6 4/5] firmware: fw_base.S: Remove _relocate_lottery
In-Reply-To: <20240304121557.502655-5-wxjstz@126.com>
References: <20240304121557.502655-1-wxjstz@126.com> <20240304121557.502655-5-wxjstz@126.com>
Message-ID: <CAAhSdy1Wmv9qLM1RUq+trkVz3+5Ao6rYATUGMWcpkV-ZP7YxMw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 4, 2024 at 5:47?PM Xiang W <wxjstz@126.com> wrote:
>
> Remove _relocate_lottery and use _boot_status instead
>
> Signed-off-by: Xiang W <wxjstz@126.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  firmware/fw_base.S | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index d87c0a5..d83397e 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -14,8 +14,9 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_trap.h>
>
> -#define BOOT_STATUS_RELOCATE_DONE      1
> -#define BOOT_STATUS_BOOT_HART_DONE     2
> +#define BOOT_STATUS_LOTTERY_DONE       1
> +#define BOOT_STATUS_RELOCATE_DONE      2
> +#define BOOT_STATUS_BOOT_HART_DONE     3
>
>  .macro MOV_3R __d0, __s0, __d1, __s1, __d2, __s2
>         add     \__d0, \__s0, zero
> @@ -58,9 +59,9 @@ _start:
>         bne     a0, a6, _wait_relocate_copy_done
>  _try_lottery:
>         /* Jump to relocation wait loop if we don't get relocation lottery */
> -       lla     a6, _relocate_lottery
> -       li      a7, 1
> -       amoadd.w a6, a7, (a6)
> +       lla     a6, _boot_status
> +       li      a7, BOOT_STATUS_LOTTERY_DONE
> +       amoswap.w a6, a7, (a6)
>         bnez    a6, _wait_relocate_copy_done
>
>  #ifdef FW_PIC
> @@ -101,8 +102,6 @@ _relocate:
>         blt     t2, t0, _relocate_copy_to_upper
>  _relocate_copy_to_lower:
>         ble     t1, t2, _relocate_copy_to_lower_loop
> -       lla     t3, _relocate_lottery
> -       BRANGE  t2, t1, t3, _start_hang
>         lla     t3, _boot_status
>         BRANGE  t2, t1, t3, _start_hang
>         lla     t3, _relocate
> @@ -119,8 +118,6 @@ _relocate_copy_to_lower_loop:
>         jr      t4
>  _relocate_copy_to_upper:
>         ble     t3, t0, _relocate_copy_to_upper_loop
> -       lla     t2, _relocate_lottery
> -       BRANGE  t0, t3, t2, _start_hang
>         lla     t2, _boot_status
>         BRANGE  t0, t3, t2, _start_hang
>         lla     t2, _relocate
> @@ -474,8 +471,6 @@ _skip_trap_handler_rv32_hyp:
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

