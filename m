From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 20:06:03 +0530
Subject: [PATCH v5 2/6] fw_base: Put data in .data rather than .text
In-Reply-To: <20210711022824.29915-3-jrtc27@jrtc27.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
 <20210711022824.29915-3-jrtc27@jrtc27.com>
Message-ID: <CAAhSdy1BkXiGivUs83T9uEfvZwXL8Us-KzXCyLT+EkYvrkSjiQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 7:58 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> The -N linker option is supposed to make .text writable, but GNU ld and
> LLD differ in interpreting what that means. GNU ld will happily let you
> have relocations in it, but LLD will see that the input section is
> read-only (even though the output section is writable) and give an
> error. It's unclear if either of them intend to have that behaviour in
> this edge case, but regardless there's no reason not to just put the
> data in a writable .data section.
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  firmware/fw_base.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index ee2a51b..f8aea05 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -501,6 +501,7 @@ _skip_trap_exit_rv32_hyp:
>         /* We don't expect to reach here hence just hang */
>         j       _start_hang
>
> +       .data
>         .align 3
>  #ifdef FW_PIC
>  _runtime_offset:
> --
> 2.31.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

