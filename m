From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Oct 2024 17:58:53 +0530
Subject: [PATCH v2] include: sbi: Optimize reads of mhartid and mscratch
In-Reply-To: <20241025184608.1365606-1-samuel.holland@sifive.com>
References: <20241025184608.1365606-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1-vjYjR48O-F+psK_okyyZ=wqgmoBDiMDG02PGpr8MUw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 26, 2024 at 12:43?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> csr_read() is marked as volatile and clobbering memory, which is
> generally the safe thing to do. However, these two CSRs do not have any
> side effects, and the values returned do not change between calls. The
> compiler can generate better code if we allow it to reorder calls to
> these functions and cache the return value. Introduce csr_read_relaxed()
> for this use case.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
> Changes in v2:
>  - Add csr_read_relaxed() instead of open-coding the assembly
>
>  include/sbi/riscv_asm.h   | 10 +++++++++-
>  include/sbi/sbi_scratch.h |  2 +-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
> index 2c34635a..4605db20 100644
> --- a/include/sbi/riscv_asm.h
> +++ b/include/sbi/riscv_asm.h
> @@ -101,6 +101,14 @@
>                 __v;                                            \
>         })
>
> +/* Variant of csr_read() that allows the compiler to cache the value. */
> +#define csr_read_relaxed(csr)                                     \
> +       ({                                                        \
> +               register unsigned long __v;                       \
> +               __asm__ ("csrr %0, " __ASM_STR(csr) : "=r"(__v)); \
> +               __v;                                              \
> +       })
> +
>  #define csr_write(csr, val)                                        \
>         ({                                                         \
>                 unsigned long __v = (unsigned long)(val);          \
> @@ -163,7 +171,7 @@ void csr_write_num(int csr_num, unsigned long val);
>         } while (0)
>
>  /* Get current HART id */
> -#define current_hartid()       ((unsigned int)csr_read(CSR_MHARTID))
> +#define current_hartid()       ((unsigned int)csr_read_relaxed(CSR_MHARTID))
>
>  /* determine CPU extension, return non-zero support */
>  int misa_extension_imp(char ext);
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 9ae4f891..9cd7b0d6 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -159,7 +159,7 @@ enum sbi_scratch_options {
>
>  /** Get pointer to sbi_scratch for current HART */
>  #define sbi_scratch_thishart_ptr() \
> -       ((struct sbi_scratch *)csr_read(CSR_MSCRATCH))
> +       ((struct sbi_scratch *)csr_read_relaxed(CSR_MSCRATCH))
>
>  /** Get Arg1 of next booting stage for current HART */
>  #define sbi_scratch_thishart_arg1_ptr() \
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

