From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Sep 2024 10:37:15 +0530
Subject: [PATCH] include: sbi: Optimize reads of mhartid and mscratch
In-Reply-To: <20240830163533.4019822-1-samuel.holland@sifive.com>
References: <20240830163533.4019822-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1JvKh87ASA-Vw8Hi-XDMjwMOZc8gpsG92t-p29WhHJ8Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 10:06?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> csr_read() is marked as volatile and clobbering memory, which is
> generally the safe thing to do. However, these two CSRs do not have any
> side effects, and the values returned do not change between calls. The
> compiler can generate better code if we allow it to reorder calls to
> these functions and cache the return value. This change reduces code
> size by about 200 bytes.

Why not introduce csr_read_relaxed() for such CSRs and use that instead?

Regards,
Anup

>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  include/sbi/riscv_asm.h   | 10 +++++++++-
>  include/sbi/sbi_scratch.h | 11 +++++++++--
>  2 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
> index 2c34635a..a439f935 100644
> --- a/include/sbi/riscv_asm.h
> +++ b/include/sbi/riscv_asm.h
> @@ -163,7 +163,15 @@ void csr_write_num(int csr_num, unsigned long val);
>         } while (0)
>
>  /* Get current HART id */
> -#define current_hartid()       ((unsigned int)csr_read(CSR_MHARTID))
> +static inline unsigned int current_hartid(void)
> +{
> +       unsigned int hartid;
> +
> +       /* Do not use csr_read() so the compiler can cache the value. */
> +       __asm__ ("csrr %0, mhartid" : "=r"(hartid));
> +
> +       return hartid;
> +}
>
>  /* determine CPU extension, return non-zero support */
>  int misa_extension_imp(char ext);
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 12e6a983..28b6d7c9 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -154,8 +154,15 @@ enum sbi_scratch_options {
>  };
>
>  /** Get pointer to sbi_scratch for current HART */
> -#define sbi_scratch_thishart_ptr() \
> -       ((struct sbi_scratch *)csr_read(CSR_MSCRATCH))
> +static inline struct sbi_scratch *sbi_scratch_thishart_ptr(void)
> +{
> +       struct sbi_scratch *scratch;
> +
> +       /* Do not use csr_read() so the compiler can cache the value. */
> +       __asm__ ("csrr %0, mscratch" : "=r"(scratch));
> +
> +       return scratch;
> +}
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

