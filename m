From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Jul 2023 11:31:08 +0530
Subject: [PATCH] lib: sbi: fix comment indent
In-Reply-To: <20230629142406.6796-1-gianluca@rivosinc.com>
References: <20230629142406.6796-1-gianluca@rivosinc.com>
Message-ID: <CAAhSdy3uy3xCJisA+uPRViaL0GxK5m2i4shRUuDecp4Pej5L5Q@mail.gmail.com>
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

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

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

