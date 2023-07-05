From: Anup Patel <anup@brainfault.org>
Date: Wed, 5 Jul 2023 10:11:41 +0530
Subject: [PATCH] lib: sbi: fix comment indent
In-Reply-To: <20230629142406.6796-1-gianluca@rivosinc.com>
References: <20230629142406.6796-1-gianluca@rivosinc.com>
Message-ID: <CAAhSdy3t+iC=v-p9p16_6JxVAMbbGyQSprJv78q8B7=6EsyC7g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 29, 2023 at 8:00?PM Gianluca Guida <gianluca@rivosinc.com> wrote:
>
> Use tabs rather than spaces.
>
> Signed-off-by: Gianluca Guida <gianluca@rivosinc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  lib/sbi/sbi_ecall_dbcn.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
> index ecec027..8e68729 100644
> --- a/lib/sbi/sbi_ecall_dbcn.c
> +++ b/lib/sbi/sbi_ecall_dbcn.c
> @@ -34,10 +34,10 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
>                  * Based on above, we simply fail if the upper 32bits of
>                  * the physical address (i.e. a2 register) is non-zero on
>                  * RV32.
> -                 *
> -                 * Analogously, we fail if the upper 64bit of the
> -                 * physical address (i.e. a2 register) is non-zero on
> -                 * RV64.
> +                *
> +                * Analogously, we fail if the upper 64bit of the
> +                * physical address (i.e. a2 register) is non-zero on
> +                * RV64.
>                  */
>                 if (regs->a2)
>                         return SBI_ERR_FAILED;
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

