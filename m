From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Dec 2024 11:59:19 +0530
Subject: [PATCH 2/2] lib: sbi: sse: Fix a6 and a7 register content upon injection
In-Reply-To: <20241125105303.1113607-3-cleger@rivosinc.com>
References: <20241125105303.1113607-1-cleger@rivosinc.com> <20241125105303.1113607-3-cleger@rivosinc.com>
Message-ID: <CAAhSdy2kfFxYSuWPGzPf5Z4vi3QBP9h_7f4R6jL3Vnwccs2mkw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 25, 2024 at 4:24?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> The specification states that a6 contains the current hart id and a7
> contains the entry argument. This was inverted in the current
> implementation.
>
> Reported-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_sse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index bf5620e..c9f9a9d 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -509,8 +509,8 @@ static void sse_event_inject(struct sbi_sse_event *e,
>         csr_write(CSR_SEPC, regs->mepc);
>
>         /* Setup entry context */
> -       regs->a6 = e->attrs.entry.arg;
> -       regs->a7 = current_hartid();
> +       regs->a6 = current_hartid();
> +       regs->a7 = e->attrs.entry.arg;
>         regs->mepc = e->attrs.entry.pc;
>
>         /* Return to S-mode with virtualization disabled */
> --
> 2.45.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

