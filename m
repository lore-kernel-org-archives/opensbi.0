From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Apr 2024 18:05:11 +0530
Subject: [PATCH v2 1/2] sbi: sbi_domain_context: Check privilege spec
 version before accessing S-mode CSRs
In-Reply-To: <20240328033303.883674-2-peterlin@andestech.com>
References: <20240328033303.883674-1-peterlin@andestech.com> <20240328033303.883674-2-peterlin@andestech.com>
Message-ID: <CAAhSdy2X6JJRdpZfSLzrMzJd5SVDQrWKhcSa=n7CerxmeqVDWw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 28, 2024 at 9:03?AM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> SCOUNTEREN and SENVCFG may not be supported on certain RISC-V core,
> so check the existence of these CSRs via privilege spec version to
> prevent illegal instructions.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Alvin Chang <alvinga@andestech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Changes v2:
>   - No change
> ---
>  lib/sbi/sbi_domain_context.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> index d83a2ba2..a41dc8c7 100755
> --- a/lib/sbi/sbi_domain_context.c
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -54,8 +54,10 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
>         ctx->scause     = csr_swap(CSR_SCAUSE, dom_ctx->scause);
>         ctx->stval      = csr_swap(CSR_STVAL, dom_ctx->stval);
>         ctx->satp       = csr_swap(CSR_SATP, dom_ctx->satp);
> -       ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
> -       ctx->senvcfg    = csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
> +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
> +               ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
> +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
> +               ctx->senvcfg    = csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
>
>         /* Save current trap state and restore target domain's trap state */
>         trap_regs = (struct sbi_trap_regs *)(csr_read(CSR_MSCRATCH) -
> --
> 2.34.1
>

