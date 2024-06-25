From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 25 Jun 2024 23:26:38 +0300
Subject: [RFC PATCH 1/1] lib: sbi: fix dbtr shmem address handling
In-Reply-To: <fe955758357d5733343b94e6b74d1fb149f0abbc.camel@126.com>
References: <20240624211350.22794-1-geomatsi@gmail.com>
 <fe955758357d5733343b94e6b74d1fb149f0abbc.camel@126.com>
Message-ID: <Znsn_sta995kK33m@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 25, 2024 at 09:12:05AM +0800, Xiang W wrote:
> ? 2024-06-25???? 00:13 +0300?Sergey Matyukevich???
> > Current debug triggers implementation in OpenSBI is accompanied by the
> > Linux kernel PoC code available on github, e.g. see the last two branches:
> > 
> > - https://github.com/hschauhan/riscv-linux/blob/linux-6.8-rc5-sdtrig
> > - https://github.com/hschauhan/riscv-linux/tree/sdtrig-virt
> > 
> > All implementation versions suggest a common way to pass shared memory
> > address to OpenSBI on RV32 and RV64 platforms. Shmem address is split
> > into two 32-bit parts and passed using two registers in SBI call.
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-debug-console.adoc?plain=1#L31C35-L33C53
> 
> The shmem address is not split into high 32 bits and low 32 bits, but high
> XLEN bits and low XLEN bits

This RFC is for DBTR (debug trigger) and not for DBCN (debug console).
In this case Linux kernel PoC implementation performs split, see:

- https://github.com/hschauhan/riscv-linux/blob/linux-6.8-rc5-sdtrig/arch/riscv/kernel/hw_breakpoint.c#L30-L58

But your remark regarding XLEN is applicable to DBTR case as well. Debug
Trigger Extension is not yet in SBI specification. Its proposal is
posted in riscv tech-debug mailing list:

- https://lists.riscv.org/g/tech-debug/message/1302

This proposal suggests to handle shmem address in sbi_debug_setup_shmem
in a similar way as addresses in DBCN read/write. So current Linux
kernel DBTR PoC code needs to be fixed along the following lines:

:	if (IS_ENABLED(CONFIG_32BIT))
:		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
:				lower_32_bits(base_addr), upper_32_bits(base_addr);
:				0, 0, 0, 0);
:	else
:		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
:				base_addr, 0, 0, 0, 0, 0);

Meanwhile OpenSBI fix is still needed to do the following two things:
- to check that upper address word is zero (makes sense for both RV32/RV64)
- to drop upper address word from DBTR_SHMEM_MAKE_PHYS (for RV32)

The updated RFC patch is as follows:

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 9c92af6..9aab015 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -47,13 +47,7 @@ static unsigned long hart_state_ptr_offset;
 	     _idx < _max;						\
 	     _idx++, _entry = ((_etype *)_base + _idx))
 
-#if __riscv_xlen == 64
 #define DBTR_SHMEM_MAKE_PHYS(_p_hi, _p_lo) (_p_lo)
-#elif __riscv_xlen == 32
-#define DBTR_SHMEM_MAKE_PHYS(_p_hi, _p_lo) (((u64)(_p_hi) << 32) | (_p_lo))
-#else
-#error "Undefined XLEN"
-#endif
 
 /* must call with hs != NULL */
 static inline bool sbi_dbtr_shmem_disabled(
@@ -277,6 +271,9 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 	if (shmem_phys_lo & SBI_DBTR_SHMEM_ALIGN_MASK)
 		return SBI_ERR_INVALID_PARAM;
 
+	if (shmem_phys_hi)
+		return SBI_EINVALID_ADDR;
+
 	if (dom && !sbi_domain_check_addr(dom,
 		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
 		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))

Regards,
Sergey

