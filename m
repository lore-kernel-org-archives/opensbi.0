From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 11:53:21 +0530
Subject: [PATCH v2] firmware: Minor optimization in _scratch_init()
In-Reply-To: <20210710140031.911-1-bmeng.cn@gmail.com>
References: <20210710140031.911-1-bmeng.cn@gmail.com>
Message-ID: <CAAhSdy1b=M-1vxzu42U0kBD4ECLTq-BDSRge-xtXTkiuPThM7g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 7:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Before entering _scratch_init(), register t3 already holds a copy
> of the firmware end address, hence there is no need to calculate
> it again. This reduces 3 instructions in each _scratch_init() loop.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

>
> ---
>
> Changes in v2:
> - add a comment block before _scratch_init() documenting all registers
>   used in the loop block
>
>  firmware/fw_base.S | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index a5ce946..8e40562 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -278,6 +278,14 @@ _bss_zero:
>         /* hartid 0 is mandated by ISA */
>         li      t1, 0
>  _scratch_init:
> +       /*
> +        * The following registers hold values that are computed before
> +        * entering this block, and should remain unchanged.
> +        *
> +        * t3 -> the firmware end address
> +        * s7 -> HART count
> +        * s8 -> HART stack size
> +        */
>         add     tp, t3, zero
>         mul     a5, s8, t1
>         sub     tp, tp, a5
> @@ -287,10 +295,7 @@ _scratch_init:
>         /* Initialize scratch space */
>         /* Store fw_start and fw_size in scratch space */
>         lla     a4, _fw_start
> -       lla     a5, _fw_end
> -       mul     t0, s7, s8
> -       add     a5, a5, t0
> -       sub     a5, a5, a4
> +       sub     a5, t3, a4
>         REG_S   a4, SBI_SCRATCH_FW_START_OFFSET(tp)
>         REG_S   a5, SBI_SCRATCH_FW_SIZE_OFFSET(tp)
>         /* Store next arg1 in scratch space */
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

