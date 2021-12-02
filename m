From: Alexandre ghiti <alex@ghiti.fr>
Date: Thu, 2 Dec 2021 10:41:02 +0100
Subject: [PATCH v2 2/2] lib: sbi: Fix compile errors using -Os option
In-Reply-To: <20211202083440.656777-3-anup.patel@wdc.com>
References: <20211202083440.656777-1-anup.patel@wdc.com>
 <20211202083440.656777-3-anup.patel@wdc.com>
Message-ID: <0e1a345c-245d-61f5-8c0a-830400b4561e@ghiti.fr>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On 12/2/21 09:34, Anup Patel wrote:
> When building with -Os option along with -ffreestanding, both GCC
> and clang will add implicit calls to memcpy() and memcpy() for stack
> variables initialized in declaration.
>
> The C standard as per Clause 4, the compiler cannot necessarily
> assume that anything beyond:
>
>   * float.h
>   * iso646.h
>   * limits.h
>   * stdalign.h
>   * stdarg.h
>   * stdbool.h
>   * stddef.h
>   * stdint.h
>   * stdnoreturn.h
>   * fenv.h
>   * math.h
>   * and the numeric conversion functions of stdlib.h.
>
> This patch avoids implicit calls to memcpy() and memset() by
> explicitly initializing stack variables.


Wouldn't it be easier to implement memcpy and memset? I find it is a 
hard requirement to explicitly initialize variables and it's likely to 
get broken in the future.

Alex


>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>   include/sbi/sbi_trap.h |  9 +++++++++
>   lib/sbi/riscv_asm.c    |  3 ++-
>   lib/sbi/sbi_ecall.c    |  4 +++-
>   lib/sbi/sbi_hart.c     | 12 +++++++++---
>   4 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
> index d205056..7edf15b 100644
> --- a/include/sbi/sbi_trap.h
> +++ b/include/sbi/sbi_trap.h
> @@ -202,6 +202,15 @@ struct sbi_trap_info {
>   	unsigned long tinst;
>   };
>   
> +#define sbi_trap_info_init(__tinfo)	\
> +do { \
> +	(__tinfo)->epc = 0; \
> +	(__tinfo)->cause = 0; \
> +	(__tinfo)->tval = 0; \
> +	(__tinfo)->tval2 = 0; \
> +	(__tinfo)->tinst = 0; \
> +} while (0)
> +
>   int sbi_trap_redirect(struct sbi_trap_regs *regs,
>   		      struct sbi_trap_info *trap);
>   
> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> index 2e2e148..b7122b9 100644
> --- a/lib/sbi/riscv_asm.c
> +++ b/lib/sbi/riscv_asm.c
> @@ -50,10 +50,11 @@ int misa_xlen(void)
>   	return r ? r : -1;
>   }
>   
> +static const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";
> +
>   void misa_string(int xlen, char *out, unsigned int out_sz)
>   {
>   	unsigned int i, pos = 0;
> -	const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";
>   
>   	if (!out)
>   		return;
> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> index ce021eb..f006463 100644
> --- a/lib/sbi/sbi_ecall.c
> +++ b/lib/sbi/sbi_ecall.c
> @@ -98,10 +98,12 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
>   	struct sbi_ecall_extension *ext;
>   	unsigned long extension_id = regs->a7;
>   	unsigned long func_id = regs->a6;
> -	struct sbi_trap_info trap = {0};
> +	struct sbi_trap_info trap;
>   	unsigned long out_val = 0;
>   	bool is_0_1_spec = 0;
>   
> +	sbi_trap_info_init(&trap);
> +
>   	ext = sbi_ecall_find_extension(extension_id);
>   	if (ext && ext->handle) {
>   		ret = ext->handle(extension_id, func_id,
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index d9a15d9..90c6a93 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -336,7 +336,9 @@ done:
>   static unsigned long hart_pmp_get_allowed_addr(void)
>   {
>   	unsigned long val = 0;
> -	struct sbi_trap_info trap = {0};
> +	struct sbi_trap_info trap;
> +
> +	sbi_trap_info_init(&trap);
>   
>   	csr_write_allowed(CSR_PMPCFG0, (ulong)&trap, 0);
>   	if (trap.cause)
> @@ -355,9 +357,11 @@ static unsigned long hart_pmp_get_allowed_addr(void)
>   static int hart_pmu_get_allowed_bits(void)
>   {
>   	unsigned long val = ~(0UL);
> -	struct sbi_trap_info trap = {0};
> +	struct sbi_trap_info trap;
>   	int num_bits = 0;
>   
> +	sbi_trap_info_init(&trap);
> +
>   	/**
>   	 * It is assumed that platforms will implement same number of bits for
>   	 * all the performance counters including mcycle/minstret.
> @@ -385,10 +389,12 @@ static int hart_pmu_get_allowed_bits(void)
>   
>   static void hart_detect_features(struct sbi_scratch *scratch)
>   {
> -	struct sbi_trap_info trap = {0};
> +	struct sbi_trap_info trap;
>   	struct hart_features *hfeatures;
>   	unsigned long val;
>   
> +	sbi_trap_info_init(&trap);
> +
>   	/* Reset hart features */
>   	hfeatures = sbi_scratch_offset_ptr(scratch, hart_features_offset);
>   	hfeatures->features = 0;

