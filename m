From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 27 Oct 2020 07:41:26 +0000
Subject: [PATCH v4 1/2] lib: sbi: Detect PMP granularity and number of
 address bits
In-Reply-To: <20201026210334.782098-2-atish.patra@wdc.com>
References: <20201026210334.782098-1-atish.patra@wdc.com>
 <20201026210334.782098-2-atish.patra@wdc.com>
Message-ID: <DM6PR04MB6201C032C819DE08AB2695288D160@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atish.patra@wdc.com>
> Sent: 27 October 2020 02:34
> To: opensbi at lists.infradead.org
> Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel <Anup.Patel@wdc.com>
> Subject: [PATCH v4 1/2] lib: sbi: Detect PMP granularity and number of
> address bits
> 
> As per RISC-V privilege specification, a platform may choose to implement a
> coarser granularity scheme for PMP addresses. In that case, we shouldn't
> allow any pmp region size smaller than the platform supports. A platform
> may not also implement all the bits for a PMP address specified in the priv
> specification.
> 
> The pmp range granularity and address bits should be detected dynamically
> before detecing PMP regions. Any pmp modification request beyond these
> detected value must not succeed.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  include/sbi/sbi_hart.h |  2 ++
>  lib/sbi/sbi_hart.c     | 62 +++++++++++++++++++++++++++++++++++++++--
> -
>  2 files changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h index
> 3ac150036c79..ec9e30f913ce 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -39,6 +39,8 @@ unsigned int sbi_hart_mhpm_count(struct sbi_scratch
> *scratch);  void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
>  			      const char *prefix, const char *suffix);  unsigned
> int sbi_hart_pmp_count(struct sbi_scratch *scratch);
> +unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch);
> +unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch);  bool
> sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long feature);
> void sbi_hart_get_features_str(struct sbi_scratch *scratch, diff --git
> a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c index 8ded82841d82..1e3a759229ca
> 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -30,6 +30,8 @@ void (*sbi_hart_expected_trap)(void) =
> &__sbi_expected_trap;  struct hart_features {
>  	unsigned long features;
>  	unsigned int pmp_count;
> +	unsigned int pmp_addr_bits;
> +	unsigned long pmp_gran;
>  	unsigned int mhpm_count;
>  };
>  static unsigned long hart_features_offset; @@ -159,16 +161,37 @@
> unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
>  	return hfeatures->pmp_count;
>  }
> 
> +unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch) {
> +	struct hart_features *hfeatures =
> +			sbi_scratch_offset_ptr(scratch,
> hart_features_offset);
> +
> +	return hfeatures->pmp_gran;
> +}
> +
> +unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch) {
> +	struct hart_features *hfeatures =
> +			sbi_scratch_offset_ptr(scratch,
> hart_features_offset);
> +
> +	return hfeatures->pmp_addr_bits;
> +}
> +
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch)  {
>  	struct sbi_domain_memregion *reg;
>  	struct sbi_domain *dom = sbi_domain_thishart_ptr();
> -	unsigned int pmp_idx = 0, pmp_flags;
> +	unsigned int pmp_idx = 0, pmp_flags, pmp_bits, pmp_gran_log2;
>  	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
> +	unsigned long pmp_addr = 0, pmp_addr_max = 0;
> 
>  	if (!pmp_count)
>  		return 0;
> 
> +	pmp_gran_log2 = log2roundup(sbi_hart_pmp_granularity(scratch));
> +	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
> +	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
> +
>  	sbi_domain_for_each_memregion(dom, reg) {
>  		if (pmp_count <= pmp_idx)
>  			break;
> @@ -183,7 +206,14 @@ int sbi_hart_pmp_configure(struct sbi_scratch
> *scratch)
>  		if (reg->flags & SBI_DOMAIN_MEMREGION_MMODE)
>  			pmp_flags |= PMP_L;
> 
> -		pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
> +		pmp_addr =  reg->base >> PMP_SHIFT;
> +		if (pmp_gran_log2 <= reg->order && pmp_addr <
> pmp_addr_max)
> +			pmp_set(pmp_idx++, pmp_flags, reg->base, reg-
> >order);
> +		else {
> +			sbi_printf("Can not configure pmp for domain %s",
> dom->name);
> +			sbi_printf("because memory region address %lx or
> size %lx is not in range\n",
> +				    reg->base, reg->order);
> +		}
>  	}
> 
>  	return 0;
> @@ -282,6 +312,21 @@ done:
>  		sbi_strncpy(features_str, "none", nfstr);  }
> 
> +static unsigned long hart_pmp_get_allowed_addr(void) {
> +	unsigned long val = 0;
> +	struct sbi_trap_info trap = {0};
> +
> +	csr_write_allowed(CSR_PMPADDR0, (ulong)&trap,
> PMP_ADDR_MASK);			\
> +	if (!trap.cause) {
> +		val = csr_read_allowed(CSR_PMPADDR0, (ulong)&trap);
> +		if (trap.cause)
> +			val = 0;
> +	}
> +
> +	return val;
> +}
> +
>  static void hart_detect_features(struct sbi_scratch *scratch)  {
>  	struct sbi_trap_info trap = {0};
> @@ -332,8 +377,17 @@ static void hart_detect_features(struct sbi_scratch
> *scratch)
>  	__check_csr_32(__csr + 0, __rdonly, __wrval, __field, __skip)	\
>  	__check_csr_32(__csr + 32, __rdonly, __wrval, __field, __skip)
> 
> -	/* Detect number of PMP regions */
> -	__check_csr_64(CSR_PMPADDR0, 0, 1UL, pmp_count, __pmp_skip);
> +	/**
> +	 * Detect the allowed address bits & granularity. At least PMPADDR0
> +	 * should be implemented.
> +	 */
> +	val = hart_pmp_get_allowed_addr();
> +	if (val) {
> +		hfeatures->pmp_gran =  1 << (__ffs(val) + 2);
> +		hfeatures->pmp_addr_bits = __fls(val) + 1;
> +		/* Detect number of PMP regions. At least PMPADDR0
> should be implemented*/
> +		__check_csr_64(CSR_PMPADDR0, 0, val, pmp_count,
> __pmp_skip);
> +	}
>  __pmp_skip:
> 
>  	/* Detect number of MHPM counters */
> --
> 2.25.1

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup


