From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Feb 2024 12:54:07 +0530
Subject: [PATCH v3 02/10] firmware: fw_base.S: remove _runtime_offset
In-Reply-To: <20240117104212.1055737-3-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com> <20240117104212.1055737-3-wxjstz@126.com>
Message-ID: <CAAhSdy21XBuUGWRtekVupsN2q-9s0BAo9Upt2FpVydL0LMpvvw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 17, 2024 at 4:12?PM Xiang W <wxjstz@126.com> wrote:
>
> _runtime_offset is a variable not used elsewhere, so remove it.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  firmware/fw_base.S | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 2f30d00..0e1b6fb 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -74,8 +74,6 @@ _try_lottery:
>         REG_L   t0, 0(t0)
>         /* t1 shall has the address of _fw_start */
>         sub     t2, t1, t0
> -       lla     t3, _runtime_offset
> -       REG_S   t2, (t3)
>         lla     t0, __rel_dyn_start
>         lla     t1, __rel_dyn_end
>         beq     t0, t1, _relocate_done
> @@ -500,10 +498,6 @@ _skip_trap_exit_rv32_hyp:
>
>         .data
>         .align 3
> -#ifdef FW_PIC
> -_runtime_offset:
> -       RISCV_PTR       0
> -#endif
>  _relocate_lottery:
>         RISCV_PTR       0
>  _boot_status:
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

