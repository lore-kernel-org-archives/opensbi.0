From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Feb 2024 10:33:22 +0530
Subject: [PATCH] fw_base.S: Fix comment errors
In-Reply-To: <20231217134836.895-1-fmrt19zrmin@163.com>
References: <20231217134836.895-1-fmrt19zrmin@163.com>
Message-ID: <CAAhSdy1a-Tbf-8L+19QDkCNsro=t+JrTFmUcp2PB-9JB_FCpbg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 17, 2023 at 7:18?PM <fmrt19zrmin@163.com> wrote:
>
> From: Zhang Runmin <fmrt19zrmin@163.com>
>
> When calling '_reset_regs', it'll reset all registers except some
> specific registers (ra, a0, a1, and a2).
>
> Both boot HART and non-boot HARTs will execute the '_start_warm'
> function. Therefore, when '_reset_regs' is called in '_start_warm', it
> will reset all registers except some specific registers (ra, a0, a1 and
> a2) for both boot HART and non-boot HARTs.
>
> Signed-off-by: Zhang Runmin <fmrt19zrmin@163.com>
> ---
>  firmware/fw_base.S | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index f7763f4..ab432ea 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -188,7 +188,7 @@ _relocate_done:
>
>         /* At this point we are running from link address */
>
> -       /* Reset all registers for boot HART */
> +       /* Reset all registers except ra, a0, a1 and a2 for boot HART */
>         li      ra, 0
>         call    _reset_regs
>
> @@ -415,7 +415,10 @@ _wait_for_boot_hart:
>         bne     t0, t1, _wait_for_boot_hart
>
>  _start_warm:
> -       /* Reset all registers for non-boot HARTs */
> +       /*
> +     * Reset all registers except ra, a0, a1 and a2 for both boot HART
> +     * and non-boot HARTs
> +     */
'
After cold-boot is done, all harts are non-boot harts so this statement
can be simplified.

>         li      ra, 0
>         call    _reset_regs
>
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

I have taken care of the above at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

