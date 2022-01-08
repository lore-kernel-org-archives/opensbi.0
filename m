From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Sat, 8 Jan 2022 11:24:04 +0300
Subject: [PATCH v1 2/3] lib: sbi: Disable interrupt during config matching
In-Reply-To: <20220107185409.1172221-3-atishp@rivosinc.com>
References: <20220107185409.1172221-1-atishp@rivosinc.com>
 <20220107185409.1172221-3-atishp@rivosinc.com>
Message-ID: <20220108112404.7581b81b@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Atish!

On Fri,  7 Jan 2022 10:54:08 -0800
Atish Patra <atishp@rivosinc.com> wrote:

> PMU overflow interrupt should be disabled durinig initial
> configuration of counters. They should be enabled while starting
> counters.
> 
> Fixes: 730f01bb41a6 ("lib: sbi: Support sscofpmf extension in
> OpenSBI")
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  include/sbi/riscv_encoding.h |  3 ++-
>  lib/sbi/sbi_pmu.c            | 10 +++++++---
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sbi/riscv_encoding.h
> b/include/sbi/riscv_encoding.h index 8a29f8e05c9a..ac8590d72e4f 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -181,13 +181,14 @@
>  #define MHPMEVENT_VSINH			(_UL(1) << 59)
>  #define MHPMEVENT_VUINH			(_UL(1) << 58)
>  #else
> -#define MHPMEVENTH_OF			(_UL(1) << 31)
> +#define MHPMEVENTH_OF			(_ULL(1) << 31)
>  #define MHPMEVENTH_MINH			(_ULL(1) << 30)
>  #define MHPMEVENTH_SINH			(_ULL(1) << 29)
>  #define MHPMEVENTH_UINH			(_ULL(1) << 28)
>  #define MHPMEVENTH_VSINH		(_ULL(1) << 27)
>  #define MHPMEVENTH_VUINH		(_ULL(1) << 26)
>  
> +#define MHPMEVENT_OF			(MHPMEVENTH_OF << 32)
>  #define MHPMEVENT_MINH			(MHPMEVENTH_MINH << 32)
>  #define MHPMEVENT_SINH			(MHPMEVENTH_SINH << 32)
>  #define MHPMEVENT_UINH			(MHPMEVENTH_UINH << 32)
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 376afec13491..a209c8e266d6 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -256,7 +256,7 @@ static int pmu_ctr_enable_irq_hw(int ctr_idx)
>  
>  #if __riscv_xlen == 32
>  	mhpmevent_csr = CSR_MHPMEVENT3H  + ctr_idx - 3;
> -	of_mask = ~MHPMEVENTH_OF;
> +	of_mask = (uint32_t)~MHPMEVENTH_OF;
>  #else
>  	mhpmevent_csr = CSR_MHPMEVENT3 + ctr_idx - 3;
>  	of_mask = ~MHPMEVENT_OF;
> @@ -470,9 +470,13 @@ static int pmu_update_hw_mhpmevent(struct
> sbi_pmu_hw_event *hw_evt, int ctr_idx, if (!mhpmevent_val || ctr_idx
> < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX) return SBI_EFAIL;
>  
> -	/* Always clear the OVF bit and inhibit countin of events in
> M-mode */
> +	/**
> +	 * Always set the OVF bit(disable interrupts) and inhibit
> counting of
> +	 * events in M-mode. The OVF bit should be enabled during
> the start call.
> +	 */
>  	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> -		mhpmevent_val = (mhpmevent_val &
> ~MHPMEVENT_SSCOF_MASK) | MHPMEVENT_MINH;
> +		mhpmevent_val = (mhpmevent_val &
> ~MHPMEVENT_SSCOF_MASK) |
> +				 MHPMEVENT_MINH | MHPMEVENT_OF;

Is there some strong reason to inhibit M-Mode counting here or it is
just a workaround until mode filtering support will come up ?

>  
>  	/* Update the inhibit flags based on inhibit flags received
> from supervisor */ pmu_update_inhibit_flags(flags, &mhpmevent_val);


