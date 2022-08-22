From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Aug 2022 08:49:48 +0530
Subject: [PATCH v2 5/5] lib: sbi_trap: Set hstatus.GVA when going to HS-mode
In-Reply-To: <TYYP286MB1439CFF3C4F3A1BEE070B4D6C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439FC0A558FBF23B64D8BB4C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB1439CFF3C4F3A1BEE070B4D6C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy1BWONw0iMWvZz86m94TareOWpSkzXDpRcR9VOpMsujrQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 4, 2022 at 9:13 PM Vivian Wang <dramforever@live.com> wrote:
>
> The privileged spec specifies that on a trap to HS-mode, hstatus.GVA
> should be set to 1 if stval is written with a guest virtual address, and
> to 0 otherwise. Implement this by setting hstatus.GVA to trap->gva when
> redirecting traps to HS-mode.
>
> Signed-off-by: Vivian Wang <dramforever@live.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_trap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index 1cf2e6f..925840f 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -128,6 +128,8 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>                 }
>                 hstatus &= ~HSTATUS_SPV;
>                 hstatus |= (prev_virt) ? HSTATUS_SPV : 0;
> +               hstatus &= ~HSTATUS_GVA;
> +               hstatus |= (trap->gva) ? HSTATUS_GVA : 0;
>                 csr_write(CSR_HSTATUS, hstatus);
>                 csr_write(CSR_HTVAL, trap->tval2);
>                 csr_write(CSR_HTINST, trap->tinst);
> --
> 2.37.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

