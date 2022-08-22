From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Aug 2022 08:49:15 +0530
Subject: [PATCH v2 4/5] lib: sbi_trap: Set hypervisor CSRs for HS-mode
In-Reply-To: <TYYP286MB14394E15716844F8DB334C60C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439FC0A558FBF23B64D8BB4C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB14394E15716844F8DB334C60C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy0KNUkrHFzjeG2Z6e92S92N8dK72ScuBE94k42XZ8k49w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 4, 2022 at 9:13 PM Vivian Wang <dramforever@live.com> wrote:
>
> The hypervisor CSRs hstatus, htval, htinst should always be set if the
> trap is to be taken in HS-mode, regardless of which mode it came from.
>
> Signed-off-by: Vivian Wang <dramforever@live.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_trap.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index db70c26..1cf2e6f 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -118,12 +118,14 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>         regs->mstatus |= (next_virt) ? MSTATUS_MPV : 0UL;
>  #endif
>
> -       /* Update HSTATUS for VS/VU-mode to HS-mode transition */
> -       if (misa_extension('H') && prev_virt && !next_virt) {
> -               /* Update HSTATUS SPVP and SPV bits */
> +       /* Update hypervisor CSRs if going to HS-mode */
> +       if (misa_extension('H') && !next_virt) {
>                 hstatus = csr_read(CSR_HSTATUS);
> -               hstatus &= ~HSTATUS_SPVP;
> -               hstatus |= (prev_mode == PRV_S) ? HSTATUS_SPVP : 0;
> +               if (prev_virt) {
> +                       /* hstatus.SPVP is only updated if coming from VS/VU-mode */
> +                       hstatus &= ~HSTATUS_SPVP;
> +                       hstatus |= (prev_mode == PRV_S) ? HSTATUS_SPVP : 0;
> +               }
>                 hstatus &= ~HSTATUS_SPV;
>                 hstatus |= (prev_virt) ? HSTATUS_SPV : 0;
>                 csr_write(CSR_HSTATUS, hstatus);
> --
> 2.37.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

