From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Dec 2021 13:56:29 +0530
Subject: [PATCH 2/2] lib: sbi: Fix compile errors using -Os option
In-Reply-To: <20211202060458.616563-3-anup.patel@wdc.com>
References: <20211202060458.616563-1-anup.patel@wdc.com>
 <20211202060458.616563-3-anup.patel@wdc.com>
Message-ID: <CAAhSdy2v+2b4P+FwT60Sd+hqGfm9+yz7xC02P=MqHjBQtqm7eg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 2, 2021 at 11:35 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> When building with -Os option along with -ffreestanding, both GCC
> and clang will add implicit calls to memcpy() and memcpy() for stack
> variables initialized in declaration.
>
> The C standard as per Clause 4, the compiler cannot necessarily
> assume that anything beyond:
>
>  * float.h
>  * iso646.h
>  * limits.h
>  * stdalign.h
>  * stdarg.h
>  * stdbool.h
>  * stddef.h
>  * stdint.h
>  * stdnoreturn.h
>  * fenv.h
>  * math.h
>  * and the numeric conversion functions of stdlib.h.
>
> This patch avoids implicit calls to memcpy() and memset() by using
> appropriate sbi_xyz() functions for initializing stack variables.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/sbi/riscv_asm.c |  3 ++-
>  lib/sbi/sbi_ecall.c |  5 ++++-
>  lib/sbi/sbi_hart.c  | 12 +++++++++---
>  3 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> index 2e2e148..b7122b9 100644
> --- a/lib/sbi/riscv_asm.c
> +++ b/lib/sbi/riscv_asm.c
> @@ -50,10 +50,11 @@ int misa_xlen(void)
>         return r ? r : -1;
>  }
>
> +static const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";
> +
>  void misa_string(int xlen, char *out, unsigned int out_sz)
>  {
>         unsigned int i, pos = 0;
> -       const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";
>
>         if (!out)
>                 return;
> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> index ce021eb..2ef845c 100644
> --- a/lib/sbi/sbi_ecall.c
> +++ b/lib/sbi/sbi_ecall.c
> @@ -11,6 +11,7 @@
>  #include <sbi/sbi_ecall.h>
>  #include <sbi/sbi_ecall_interface.h>
>  #include <sbi/sbi_error.h>
> +#include <sbi/sbi_string.h>
>  #include <sbi/sbi_trap.h>
>
>  u16 sbi_ecall_version_major(void)
> @@ -98,10 +99,12 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
>         struct sbi_ecall_extension *ext;
>         unsigned long extension_id = regs->a7;
>         unsigned long func_id = regs->a6;
> -       struct sbi_trap_info trap = {0};
> +       struct sbi_trap_info trap;
>         unsigned long out_val = 0;
>         bool is_0_1_spec = 0;
>
> +       sbi_memset(&trap, 0, sizeof(trap));
> +

I realized this sbi_memset() call is in the hot-path so it is better to
have an inline macro for initializing struct sbi_trap_info.

I will quickly send v2 to address this.

Regards,
Anup

>         ext = sbi_ecall_find_extension(extension_id);
>         if (ext && ext->handle) {
>                 ret = ext->handle(extension_id, func_id,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index d9a15d9..ce8fa4b 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -336,7 +336,9 @@ done:
>  static unsigned long hart_pmp_get_allowed_addr(void)
>  {
>         unsigned long val = 0;
> -       struct sbi_trap_info trap = {0};
> +       struct sbi_trap_info trap;
> +
> +       sbi_memset(&trap, 0, sizeof(trap));
>
>         csr_write_allowed(CSR_PMPCFG0, (ulong)&trap, 0);
>         if (trap.cause)
> @@ -355,9 +357,11 @@ static unsigned long hart_pmp_get_allowed_addr(void)
>  static int hart_pmu_get_allowed_bits(void)
>  {
>         unsigned long val = ~(0UL);
> -       struct sbi_trap_info trap = {0};
> +       struct sbi_trap_info trap;
>         int num_bits = 0;
>
> +       sbi_memset(&trap, 0, sizeof(trap));
> +
>         /**
>          * It is assumed that platforms will implement same number of bits for
>          * all the performance counters including mcycle/minstret.
> @@ -385,10 +389,12 @@ static int hart_pmu_get_allowed_bits(void)
>
>  static void hart_detect_features(struct sbi_scratch *scratch)
>  {
> -       struct sbi_trap_info trap = {0};
> +       struct sbi_trap_info trap;
>         struct hart_features *hfeatures;
>         unsigned long val;
>
> +       sbi_memset(&trap, 0, sizeof(trap));
> +
>         /* Reset hart features */
>         hfeatures = sbi_scratch_offset_ptr(scratch, hart_features_offset);
>         hfeatures->features = 0;
> --
> 2.25.1
>

