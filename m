From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Feb 2024 13:11:45 +0530
Subject: [PATCH v3 06/10] firmware: fw_base: Simplified setup trap handler
In-Reply-To: <20240117104212.1055737-7-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com> <20240117104212.1055737-7-wxjstz@126.com>
Message-ID: <CAAhSdy0BSAjPKjcHipNXzjzxcFFr9Le48b-PdeGpDP4KpSUQiw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 17, 2024 at 4:12?PM Xiang W <wxjstz@126.com> wrote:
>
> The same detection was done twice when setting mtvec and trap_exit.
> Merging can reduce code size.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  firmware/fw_base.S | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 7c7157d..d4a6d3a 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -452,22 +452,14 @@ _start_warm:
>         srli    a5, a5, ('H' - 'A')
>         andi    a5, a5, 0x1
>         beq     a5, zero, _skip_trap_handler_rv32_hyp
> -       lla     a4, _trap_handler_rv32_hyp
> -_skip_trap_handler_rv32_hyp:
> -#endif
> -       csrw    CSR_MTVEC, a4
> -
> -#if __riscv_xlen == 32
>         /* Override trap exit for H-extension */
> -       csrr    a5, CSR_MISA
> -       srli    a5, a5, ('H' - 'A')
> -       andi    a5, a5, 0x1
> -       beq     a5, zero, _skip_trap_exit_rv32_hyp
> -       lla     a4, _trap_exit_rv32_hyp
>         csrr    a5, CSR_MSCRATCH
> +       lla     a4, _trap_exit_rv32_hyp
>         REG_S   a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(a5)
> -_skip_trap_exit_rv32_hyp:
> +       lla     a4, _trap_handler_rv32_hyp
> +_skip_trap_handler_rv32_hyp:
>  #endif
> +       csrw    CSR_MTVEC, a4
>
>         /* Initialize SBI runtime */
>         csrr    a0, CSR_MSCRATCH
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

