From: Xiang W <wxjstz@126.com>
Date: Tue, 25 Jun 2024 09:12:05 +0800
Subject: [RFC PATCH 1/1] lib: sbi: fix dbtr shmem address handling
In-Reply-To: <20240624211350.22794-1-geomatsi@gmail.com>
References: <20240624211350.22794-1-geomatsi@gmail.com>
Message-ID: <fe955758357d5733343b94e6b74d1fb149f0abbc.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-06-25???? 00:13 +0300?Sergey Matyukevich???
> Current debug triggers implementation in OpenSBI is accompanied by the
> Linux kernel PoC code available on github, e.g. see the last two branches:
> 
> - https://github.com/hschauhan/riscv-linux/blob/linux-6.8-rc5-sdtrig
> - https://github.com/hschauhan/riscv-linux/tree/sdtrig-virt
> 
> All implementation versions suggest a common way to pass shared memory
> address to OpenSBI on RV32 and RV64 platforms. Shmem address is split
> into two 32-bit parts and passed using two registers in SBI call.
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-debug-console.adoc?plain=1#L31C35-L33C53

The shmem address is not split into high 32 bits and low 32 bits, but high
XLEN bits and low XLEN bits

Regards,
Xiang W
> 
> This commit fixes shmem address handling for both RV32 and RV64. For
> RV64 macro DBTR_SHMEM_MAKE_PHYS is updated to take into account both
> high and low 32-bit parts of the passed shmem address. On RV32, M-mode
> can only access the first 4GB of the physical address space. Macro
> DBTR_SHMEM_MAKE_PHYS can be kept the same, though sbi_dbtr_setup_shmem
> call should fail if the upper 32-bit part of the physical address is
> not zero.
> 
> Suggested fix is for the kernel linux-6.8-rc5-sdtrig branch with the
> modified sbi call in arch_smp_setup_sbi_shmem function:
> 
> simple snippet from the previous sdtrig-virt branch
> 
> :	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
> :			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
> 
> instead of later version from linux-6.8-rc5-sdtrig
> 
> :	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
> :			(!MEM_LO(shmem_pa) ? 0xFFFFFFFFUL : MEM_LO(shmem_pa)),
> :			(!MEM_HI(shmem_pa) ? 0xFFFFFFFFUL : MEM_HI(shmem_pa)),
> :			 0, 0, 0, 0);
> 
> Fixes: 7f54527029d0 ("lib: sbi: fix DBTR_SHMEM_MAKE_PHYS for RV64")
> Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
> ?lib/sbi/sbi_dbtr.c | 12 ++++++------
> ?1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 9c92af6..8aa835f 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -47,13 +47,7 @@ static unsigned long hart_state_ptr_offset;
> ?	???? _idx < _max;						\
> ?	???? _idx++, _entry = ((_etype *)_base + _idx))
> ?
> -#if __riscv_xlen == 64
> -#define DBTR_SHMEM_MAKE_PHYS(_p_hi, _p_lo) (_p_lo)
> -#elif __riscv_xlen == 32
> ?#define DBTR_SHMEM_MAKE_PHYS(_p_hi, _p_lo) (((u64)(_p_hi) << 32) | (_p_lo))
> -#else
> -#error "Undefined XLEN"
> -#endif
> ?
> ?/* must call with hs != NULL */
> ?static inline bool sbi_dbtr_shmem_disabled(
> @@ -277,6 +271,12 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
> ?	if (shmem_phys_lo & SBI_DBTR_SHMEM_ALIGN_MASK)
> ?		return SBI_ERR_INVALID_PARAM;
> ?
> +#if __riscv_xlen == 32
> +	 /* M-mode on RV32 can only access the first 4GB */
> +	if (shmem_phys_hi)
> +		return SBI_EINVALID_ADDR;
> +#endif
> +
> ?	if (dom && !sbi_domain_check_addr(dom,
> ?		? DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
> ?		? SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
> -- 
> 2.45.2
> 
> 


