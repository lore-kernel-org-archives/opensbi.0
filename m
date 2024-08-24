From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Aug 2024 14:38:31 +0530
Subject: [PATCH] lib: sbi: Add additional range checks for RV32
In-Reply-To: <20240814122959.49914-2-ajones@ventanamicro.com>
References: <20240814122959.49914-2-ajones@ventanamicro.com>
Message-ID: <CAAhSdy2DrwQ94GgOAtAodQ=hxGog8ovmjoR+9+RnXCMx2bmfWw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 14, 2024 at 6:02?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On RV32, M-mode can only access the first 4G of the physical
> address space because M-mode does not have an MMU to access the
> full 34-bit physical address space. While we already ensure
> the "hi" registers of RV32 physical address inputs are zero we
> need to also ensure that the low register plus the size does
> not cross into 4G address space. The check added to
> sbi_domain_check_addr_range() should be enough for both DBCN
> and SSE, but DBCN returns a different error code for high
> addresses, so we patch that check too.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>
> ---
>
> Should the SSE functions return SBI_ERR_FAILED in this case like DBCN
> does? We'd need to patch the SSE spec to call out SBI_ERR_FAILED as
> "Failed to write due to I/O errors." like DBCN does too.

Instead of special-casing wrap-around check separately for each SBI
extension, I suggest:
1) Add one more requirement in section 3.2 of the SBI spec to prevent
wrap-around
2) Update sbi_domain_check_addr_range() like this patch does.

Regards,
Anup

>
>  lib/sbi/sbi_domain.c     | 3 +++
>  lib/sbi/sbi_ecall_dbcn.c | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 374ac36b2f3e..5f6efe884952 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -412,6 +412,9 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
>         if (!dom)
>                 return false;
>
> +       if (max < addr)
> +               return false;
> +
>         while (addr < max) {
>                 reg = find_region(dom, addr);
>                 if (!reg)
> diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
> index 49a7713f48bb..a3262ab9a90c 100644
> --- a/lib/sbi/sbi_ecall_dbcn.c
> +++ b/lib/sbi/sbi_ecall_dbcn.c
> @@ -39,7 +39,7 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
>                  * physical address (i.e. a2 register) is non-zero on
>                  * RV64.
>                  */
> -               if (regs->a2)
> +               if (regs->a2 || regs->a1 + regs->a0 < regs->a1)
>                         return SBI_ERR_FAILED;
>
>                 if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
> --
> 2.45.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

