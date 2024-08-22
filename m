From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 21 Aug 2024 19:32:35 -0500
Subject: [PATCH 2/3] lib: sbi: Zicfilp/Zicfiss detection and elp cfi state
 reflect back in status
In-Reply-To: <20240821235546.3876172-3-debug@rivosinc.com>
References: <20240821235546.3876172-1-debug@rivosinc.com>
 <20240821235546.3876172-3-debug@rivosinc.com>
Message-ID: <511056b1-95d1-43f2-8f6c-42321bbbe7e4@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Deepak,

On 2024-08-21 6:55 PM, Deepak Gupta wrote:
> This patch adds support for zicfilp / zicfiss detection in sbi_hart.c
> If zicfilp and zicfiss are detected, this patch turns on menvcfg.LPE and
> menvcfg.SSE
> 
> Zicfilp records status of hart's ELP state in *status csr. Missing landing pad
> sets MPELP in mstatus. When SBI is redirecting back to S/VS/HS, SPELP is
> set in sstatus/vsstatus.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  lib/sbi/sbi_hart.c | 28 ++++++++++++++++++++++++++++
>  lib/sbi/sbi_trap.c | 16 ++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index c366701..67a2e42 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -148,6 +148,16 @@ static void mstatus_init(struct sbi_scratch *scratch)
>  		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
>  			menvcfg_val &= ~ENVCFG_ADUE;
>  
> +		/*
> +		 * By default allow shadow stack opreations in S/HS mode
> +		 * don't enable landing pad because supervisor may keep faulting
> +		 * due to missing landing pad. Open up a SBI interface to enable
> +		 * landing pad
> +		 */
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICFISS)) {
> +			menvcfg_val |= ENVCFG_SSE;
> +		}

This violates the default value provided for the SHADOW_STACK feature in the SBI
FWFT extension specification[1].

[1]:
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-firmware-features.adoc#user-content-table_fw_features_attribute_values

> +
>  		csr_write(CSR_MENVCFG, menvcfg_val);
>  #if __riscv_xlen == 32
>  		csr_write(CSR_MENVCFGH, menvcfg_val >> 32);
> @@ -680,6 +690,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>  	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
>  	__SBI_HART_EXT_DATA(svade, SBI_HART_EXT_SVADE),
>  	__SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
> +	__SBI_HART_EXT_DATA(zicfilp, SBI_HART_EXT_ZICFILP),
> +	__SBI_HART_EXT_DATA(zicfiss, SBI_HART_EXT_ZICFISS),
>  };
>  
>  _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
> @@ -776,6 +788,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>  	unsigned long val, oldval;
>  	bool has_zicntr = false;
>  	int rc;
> +	bool ssp_exist, elp_exist;
>  
>  	/* If hart features already detected then do nothing */
>  	if (hfeatures->detected)
> @@ -933,6 +946,21 @@ __pmp_skip:
>  	/* Save trap based detection of Zicntr */
>  	has_zicntr = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR);
>  
> +	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> +		val = csr_read_allowed(CSR_SSP, (unsigned long)&trap);
> +		ssp_exist = trap.cause == 0;

Would it be simpler to try setting menvcfg.SSE here, since that would never
cause a trap?

> +		if (ssp_exist)
> +			__sbi_hart_update_extension(hfeatures,
> +					SBI_HART_EXT_ZICFISS, true);
> +
> +		csr_set(CSR_MSTATUS, MSTATUS_MPELP);
> +		val = csr_read_clear(CSR_MSTATUS, MSTATUS_MPELP);
> +		elp_exist = val & MSTATUS_MPELP;
> +		if (elp_exist)
> +			__sbi_hart_update_extension(hfeatures,
> +					SBI_HART_EXT_ZICFILP, true);
> +	}
> +
>  	/* Let platform populate extensions */
>  	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
>  					  hfeatures);
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index b4f3a17..2273b3a 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -103,6 +103,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>  		      const struct sbi_trap_info *trap)
>  {
>  	ulong hstatus, vsstatus, prev_mode;
> +	bool elp = false;
>  #if __riscv_xlen == 32
>  	bool prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? true : false;
>  #else
> @@ -116,6 +117,13 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>  	if (prev_mode != PRV_S && prev_mode != PRV_U)
>  		return SBI_ENOTSUPP;
>  
> +	/* If extension has support for CFI, clear MPELP because redirecting to VS or (H)S */
> +	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_ZICFILP)) {
> +		elp = (regs->mstatus & MSTATUS_MPELP)? true: false;

The ternary expression here is unnecessary. The left side is already truthy/falsy.

Regards,
Samuel

> +		/* Since redirecting, clear mpelp unconditionally */
> +		regs->mstatus &= ~MSTATUS_MPELP;
> +	}
> +
>  	/* If exceptions came from VS/VU-mode, redirect to VS-mode if
>  	 * delegated in hedeleg
>  	 */
> @@ -169,6 +177,10 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>  		/* Get VS-mode SSTATUS CSR */
>  		vsstatus = csr_read(CSR_VSSTATUS);
>  
> +		/*if elp was set, set it back in vsstatus */
> +		if (elp)
> +			vsstatus |= MSTATUS_SPELP;
> +
>  		/* Set SPP for VS-mode */
>  		vsstatus &= ~SSTATUS_SPP;
>  		if (prev_mode == PRV_S)
> @@ -209,6 +221,10 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>  
>  		/* Clear SIE for S-mode */
>  		regs->mstatus &= ~MSTATUS_SIE;
> +
> +		/* if elp was set, set it back in mstatus */
> +		if (elp)
> +			regs->mstatus |= MSTATUS_SPELP;
>  	}
>  
>  	return 0;


