From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 4 Jul 2023 18:58:23 +0530
Subject: [PATCH 6/6] lib: sbi: Map/Unmap debug console shared memory
 buffers before and after read/write
In-Reply-To: <20230620143854.2752979-1-hchauhan@ventanamicro.com>
References: <20230620143212.2701598-1-hchauhan@ventanamicro.com> <20230620143854.2752979-1-hchauhan@ventanamicro.com>
Message-ID: <CAK9=C2XRzo5tVCF+GWTJ_JxSxwQOcbRwDsT2cgk+01M2aekHRQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 20, 2023 at 8:09?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:

Simplify the patch subject to:
"lib: sbi: Map/Unmap debug console shared memory buffers"

>
> With Smepmp enabled, it is necessary for shared memory from
> S/U mode to be mapped/unmapped before and after read/write
> of the memory region.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  lib/sbi/sbi_ecall_dbcn.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
> index e0b892c..3724d70 100644
> --- a/lib/sbi/sbi_ecall_dbcn.c
> +++ b/lib/sbi/sbi_ecall_dbcn.c
> @@ -14,6 +14,7 @@
>  #include <sbi/sbi_ecall_interface.h>
>  #include <sbi/sbi_trap.h>
>  #include <sbi/riscv_asm.h>
> +#include <sbi/sbi_hart.h>
>
>  static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
>                                   const struct sbi_trap_regs *regs,
> @@ -43,10 +44,12 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
>                                         regs->a1, regs->a0, smode,
>                                         SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
>                         return SBI_ERR_INVALID_PARAM;
> +               sbi_hart_map_saddr(regs->a1, regs->a0);
>                 if (funcid == SBI_EXT_DBCN_CONSOLE_WRITE)
>                         *out_val = sbi_nputs((const char *)regs->a1, regs->a0);
>                 else
>                         *out_val = sbi_ngets((char *)regs->a1, regs->a0);
> +               sbi_hart_unmap_saddr();
>                 return 0;
>         case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
>                 sbi_putc(regs->a0);
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

