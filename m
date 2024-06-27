From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 27 Jun 2024 15:04:09 +0300
Subject: [PATCH v2 1/1] lib: sbi: check incoming dbtr shmem address
Message-ID: <20240627121228.67874-1-geomatsi@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Current Debug Trigger SBI extension proposal suggests to activate
shmem area and obtain its physical address from S-mode software
in the following way:

: If both `shmem_phys_lo` and `shmem_phys_hi` parameters are not
: all-ones bitwise then `shmem_phys_lo` specifies the lower XLEN
: bits and `shmem_phys_hi` specifies the upper XLEN bits of the
: shared memory physical base address. The `shmem_phys_lo` MUST
: be `(XLEN / 8)` byte aligned and the size of shared memory is
: assumed to be `trig_max * (XLEN / 2)` bytes.

For more details see the current version of the proposal:
- https://lists.riscv.org/g/tech-debug/message/1302

On the other hand, on RV32, the M-mode can only access the first 4GB of
the physical address space because M-mode does not have MMU to access
full 34-bit physical address space. Similarly, on RV64, the M-mode can
only access memory addressed by 64 bits.

This commit checks shmem address in function sbi_dbtr_setup_shmem
to make sure that shmem_phys_hi part of the valid address is zero.
Besides, the macro DBTR_SHMEM_MAKE_PHYS is updated to take into
account only low XLEN part.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---

Tested RV32 and RV64 using QEMU and patches from Himanshu Chauhan kernel
tree https://github.com/hschauhan/riscv-linux/blob/linux-6.8-rc5-sdtrig
with the following patch on top of it:

: diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
: index fe8215868530..adab63a80336 100644
: --- a/arch/riscv/kernel/hw_breakpoint.c
: +++ b/arch/riscv/kernel/hw_breakpoint.c
: @@ -27,16 +27,6 @@ static int dbtr_total_num __ro_after_init;
:  static int dbtr_type __ro_after_init;
:  static int dbtr_init __ro_after_init;
:  
: -#if __riscv_xlen == 64
: -#define MEM_HI(_m)     ((u64)_m >> 32)
: -#define MEM_LO(_m)     ((u64)_m & 0xFFFFFFFFUL)
: -#elif __riscv_xlen == 32
: -#define MEM_HI(_m)     (((u64)_m >> 32) & 0x3)
: -#define MEM_LO(_m)     ((u64)_m & 0xFFFFFFFFUL)
: -#else
: -#error "Unknown __riscv_xlen"
: -#endif
: -
:  static int arch_smp_setup_sbi_shmem(unsigned int cpu)
:  {
:         struct sbi_dbtr_shmem_entry *dbtr_shmem;
: @@ -52,10 +42,14 @@ static int arch_smp_setup_sbi_shmem(unsigned int cpu)
:  
:         shmem_pa = __pa(dbtr_shmem);
:  
: -       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
: -                       (!MEM_LO(shmem_pa) ? 0xFFFFFFFFUL : MEM_LO(shmem_pa)),
: -                       (!MEM_HI(shmem_pa) ? 0xFFFFFFFFUL : MEM_HI(shmem_pa)),
: -                        0, 0, 0, 0);
: +       if (IS_ENABLED(CONFIG_32BIT))
: +               ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
: +                               lower_32_bits(shmem_pa),
: +                               upper_32_bits(shmem_pa),
: +                               0, 0, 0, 0);
: +       else
: +               ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
: +                               shmem_pa, 0, 0, 0, 0, 0);
:  
:         if (ret.error) {
:                 switch(ret.error) {


Changes RFC (v1) -> v2
- align with DBTR SBI extension proposal

 lib/sbi/sbi_dbtr.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 9c92af6..6e2083e 100644
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
@@ -277,6 +271,20 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 	if (shmem_phys_lo & SBI_DBTR_SHMEM_ALIGN_MASK)
 		return SBI_ERR_INVALID_PARAM;
 
+	/*
+	* On RV32, the M-mode can only access the first 4GB of
+	* the physical address space because M-mode does not have
+	* MMU to access full 34-bit physical address space.
+	* So fail if the upper 32 bits of the physical address
+	* is non-zero on RV32.
+	*
+	* On RV64, kernel sets upper 64bit address part to zero.
+	* So fail if the upper 64bit of the physical address
+	* is non-zero on RV64.
+	*/
+	if (shmem_phys_hi)
+		return SBI_EINVALID_ADDR;
+
 	if (dom && !sbi_domain_check_addr(dom,
 		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
 		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
-- 
2.45.2


