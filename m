From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 29 Nov 2024 15:50:34 +0100
Subject: [PATCH 1/1] lib: sbi_misaligned_ldst: Add handling of vector
 load/store
In-Reply-To: <20241016103558.1745563-1-nylon.chen@sifive.com>
References: <20241016103558.1745563-1-nylon.chen@sifive.com>
Message-ID: <c77bf462-c198-41e9-9811-373ea23bd804@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Nylon,

Do you plan to backport this patch to Linux as well ?

Thanks !

Cl?ment

On 16/10/2024 12:35, Nylon Chen wrote:
> Add exception handling vector instructions from
> 
> the vector extension to the sbi_misaligned_ldst library.
> 
> This implementation references the misaligned_vec_ldst
> implementation in the riscv-pk project.
> 
> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  Makefile                     |  15 +-
>  include/sbi/riscv_encoding.h | 385 ++++++++++++++++++++++++++++++++++-
>  include/sbi/sbi_trap_ldst.h  |   9 +
>  lib/sbi/Kconfig              |   4 +
>  lib/sbi/objects.mk           |   1 +
>  lib/sbi/sbi_trap_ldst.c      |  23 ++-
>  lib/sbi/sbi_trap_v_ldst.c    | 341 +++++++++++++++++++++++++++++++
>  7 files changed, 766 insertions(+), 12 deletions(-)
>  create mode 100644 lib/sbi/sbi_trap_v_ldst.c
> 
> diff --git a/Makefile b/Makefile
> index f0012f6..20cae08 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -189,6 +189,9 @@ CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib
>  # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
>  CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
>  
> +# Check whether the assembler and the compiler support the Vector extension
> +CC_SUPPORT_VECT := $(shell echo | $(CC) -dM -E -march=rv$(OPENSBI_CC_XLEN)gv - | grep -q riscv.*vector && echo y || echo n)
> +
>  ifneq ($(OPENSBI_LD_PIE),y)
>  $(error Your linker does not support creating PIEs, opensbi requires this.)
>  endif
> @@ -294,10 +297,16 @@ ifndef PLATFORM_RISCV_ABI
>  endif
>  ifndef PLATFORM_RISCV_ISA
>    ifneq ($(PLATFORM_RISCV_TOOLCHAIN_DEFAULT), 1)
> -    ifeq ($(CC_SUPPORT_ZICSR_ZIFENCEI), y)
> -      PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc_zicsr_zifencei
> +    PLATFORM_RISCV_ISA := rv$(PLATFORM_RISCV_XLEN)imafdc
> +ifdef CONFIG_SUPPORT_VECTOR
> +    ifeq ($(CC_SUPPORT_VECT), y)
> +      PLATFORM_RISCV_ISA := $(PLATFORM_RISCV_ISA)v
>      else
> -      PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc
> +      $(warning Vector extension requested but not supported by the compiler)
> +    endif
> +endif
> +    ifeq ($(CC_SUPPORT_ZICSR_ZIFENCEI), y)
> +      PLATFORM_RISCV_ISA := $(PLATFORM_RISCV_ISA)_zicsr_zifencei
>      endif
>    else
>      PLATFORM_RISCV_ISA = $(OPENSBI_CC_ISA)
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 980abdb..bf58a8d 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -756,6 +756,12 @@
>  #define CSR_MVIPH			0x319
>  #define CSR_MIPH			0x354
>  
> +/* Vector extension registers */
> +#define CSR_VSTART                     0x8
> +#define CSR_VL                         0xc20
> +#define CSR_VTYPE                      0xc21
> +#define CSR_VLENB                      0xc22
> +
>  /* ===== Trap/Exception Causes ===== */
>  
>  #define CAUSE_MISALIGNED_FETCH		0x0
> @@ -883,11 +889,364 @@
>  #define INSN_MASK_FENCE_TSO		0xffffffff
>  #define INSN_MATCH_FENCE_TSO		0x8330000f
>  
> +#define INSN_MASK_VECTOR_UNIT_STRIDE		0xfdf0707f
> +#define INSN_MASK_VECTOR_FAULT_ONLY_FIRST	0xfdf0707f
> +#define INSN_MASK_VECTOR_STRIDE		0xfc00707f
> +#define INSN_MASK_VECTOR_WHOLE_REG		0xfff0707f
> +#define INSN_MASK_VECTOR_INDEXED		0xfc00707f
> +
> +#define INSN_MATCH_VLUXSEG(n, bits) ((((n) - 1) << 29) | 0x04000007 | \
> +		((bits) == 16 ? 5 : (bits) == 32 ? 6 : 7) << 12)
> +#define INSN_MATCH_VSUXSEG(n, bits) ((((n) - 1) << 29) | 0x04000027 | \
> +		((bits) == 16 ? 5 : (bits) == 32 ? 6 : 7) << 12)
> +#define INSN_MATCH_VLOXSEG(n, bits) ((((n) - 1) << 29) | 0x0c000007 | \
> +		((bits) == 16 ? 5 : (bits) == 32 ? 6 : 7) << 12)
> +#define INSN_MATCH_VSOXSEG(n, bits) ((((n) - 1) << 29) | 0x0c000027 | \
> +		((bits) == 16 ? 5 : (bits) == 32 ? 6 : 7) << 12)
> +#define INSN_MATCH_VLSSEG(n, bits)  ((((n) - 1) << 29) | 0x08000007 | \
> +		((bits) == 16 ? 5 : (bits) == 32 ? 6 : 7) << 12)
> +#define INSN_MATCH_VSSSEG(n, bits)  ((((n) - 1) << 29) | 0x08000027 | \
> +		((bits) == 16 ? 5 : (bits) == 32 ? 6 : 7) << 12)
> +#define INSN_MATCH_VSSEG(n, bits)   ((((n) - 1) << 29) | 0x00004027 | \
> +		((bits) == 16 ? 5 : (bits) == 32 ? 6 : 7) << 12)
> +#define INSN_MATCH_VLSEG(n, bits)   ((((n) - 1) << 29) | 0x00004007 | \
> +		((bits) == 16 ? 5 : (bits) == 32 ? 6 : 7) << 12)
> +#define INSN_MATCH_VLSEGFF(n, bits) ((((n) - 1) << 29) | 0x1000007 | \
> +		((bits) == 16 ? 5 : (bits) == 32 ? 6 : 7) << 12)
> +
> +#define INSN_MATCH_VLE16V              0x00005007
> +#define INSN_MATCH_VLE32V              0x00006007
> +#define INSN_MATCH_VLE64V              0x00007007
> +#define INSN_MATCH_VSE16V              0x00005027
> +#define INSN_MATCH_VSE32V              0x00006027
> +#define INSN_MATCH_VSE64V              0x00007027
> +#define INSN_MATCH_VLSE16V             0x08005007
> +#define INSN_MATCH_VLSE32V             0x08006007
> +#define INSN_MATCH_VLSE64V             0x08007007
> +#define INSN_MATCH_VSSE16V             0x08005027
> +#define INSN_MATCH_VSSE32V             0x08006027
> +#define INSN_MATCH_VSSE64V             0x08007027
> +#define INSN_MATCH_VLOXEI16V           0x0c005007
> +#define INSN_MATCH_VLOXEI32V           0x0c006007
> +#define INSN_MATCH_VLOXEI64V           0x0c007007
> +#define INSN_MATCH_VSOXEI16V           0x0c005027
> +#define INSN_MATCH_VSOXEI32V           0x0c006027
> +#define INSN_MATCH_VSOXEI64V           0x0c007027
> +#define INSN_MATCH_VLUXEI16V           0x04005007
> +#define INSN_MATCH_VLUXEI32V           0x04006007
> +#define INSN_MATCH_VLUXEI64V           0x04007007
> +#define INSN_MATCH_VSUXEI16V           0x04005027
> +#define INSN_MATCH_VSUXEI32V           0x04006027
> +#define INSN_MATCH_VSUXEI64V           0x04007027
> +#define INSN_MATCH_VLE16FFV            0x01005007
> +#define INSN_MATCH_VLE32FFV            0x01006007
> +#define INSN_MATCH_VLE64FFV            0x01007007
> +#define INSN_MATCH_VL1RE8V             0x02800007
> +#define INSN_MATCH_VL1RE16V            0x02805007
> +#define INSN_MATCH_VL1RE32V            0x02806007
> +#define INSN_MATCH_VL1RE64V            0x02807007
> +#define INSN_MATCH_VL2RE8V             0x22800007
> +#define INSN_MATCH_VL2RE16V            0x22805007
> +#define INSN_MATCH_VL2RE32V            0x22806007
> +#define INSN_MATCH_VL2RE64V            0x22807007
> +#define INSN_MATCH_VL4RE8V             0x62800007
> +#define INSN_MATCH_VL4RE16V            0x62805007
> +#define INSN_MATCH_VL4RE32V            0x62806007
> +#define INSN_MATCH_VL4RE64V            0x62807007
> +#define INSN_MATCH_VL8RE8V             0xe2800007
> +#define INSN_MATCH_VL8RE16V            0xe2805007
> +#define INSN_MATCH_VL8RE32V            0xe2806007
> +#define INSN_MATCH_VL8RE64V            0xe2807007
> +#define INSN_MATCH_VS1RV               0x02800027
> +#define INSN_MATCH_VS2RV               0x22800027
> +#define INSN_MATCH_VS4RV               0x62800027
> +#define INSN_MATCH_VS8RV               0xe2800027
> +
> +#define INSN_MASK_VECTOR_LOAD_STORE	0x7f
> +#define INSN_MATCH_VECTOR_LOAD		0x07
> +#define INSN_MATCH_VECTOR_STORE		0x27
> +
> +#define IS_VECTOR_LOAD_STORE(insn) \
> +	((((insn) & INSN_MASK_VECTOR_LOAD_STORE) == INSN_MATCH_VECTOR_LOAD) || \
> +	(((insn) & INSN_MASK_VECTOR_LOAD_STORE) == INSN_MATCH_VECTOR_STORE))
> +
> +#define IS_VECTOR_INSN_MATCH(insn, match, mask) \
> +	(((insn) & (mask)) == ((match) & (mask)))
> +
> +#define IS_UNIT_STRIDE_MATCH(insn, match) \
> +	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_UNIT_STRIDE)
> +
> +#define IS_STRIDE_MATCH(insn, match) \
> +	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_STRIDE)
> +
> +#define IS_INDEXED_MATCH(insn, match) \
> +	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_INDEXED)
> +
> +#define IS_FAULT_ONLY_FIRST_MATCH(insn, match) \
> +	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_FAULT_ONLY_FIRST)
> +
> +#define IS_WHOLE_REG_MATCH(insn, match) \
> +	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_WHOLE_REG)
> +
> +#define IS_UNIT_STRIDE_LOAD(insn) ( \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLE16V) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLE32V) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLE64V) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(2, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(3, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(4, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(5, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(6, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(7, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(8, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(2, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(3, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(4, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(5, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(6, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(7, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(8, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(2, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(3, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(4, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(5, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(6, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(7, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VLSEG(8, 64)))
> +
> +#define IS_UNIT_STRIDE_STORE(insn) ( \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSE16V) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSE32V) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSE64V) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(2, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(3, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(4, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(5, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(6, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(7, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(8, 16)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(2, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(3, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(4, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(5, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(6, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(7, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(8, 32)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(2, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(3, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(4, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(5, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(6, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(7, 64)) || \
> +	IS_UNIT_STRIDE_MATCH(insn, INSN_MATCH_VSSEG(8, 64)))
> +
> +#define IS_STRIDE_LOAD(insn) ( \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSE16V) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSE32V) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSE64V) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(2, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(3, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(4, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(5, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(6, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(7, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(8, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(2, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(3, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(4, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(5, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(6, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(7, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(8, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(2, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(3, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(4, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(5, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(6, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(7, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VLSSEG(8, 64)))
> +
> +#define IS_STRIDE_STORE(insn) ( \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSE16V) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSE32V) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSE64V) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(2, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(3, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(4, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(5, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(6, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(7, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(8, 16)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(2, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(3, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(4, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(5, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(6, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(7, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(8, 32)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(2, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(3, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(4, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(5, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(6, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(7, 64)) || \
> +	IS_STRIDE_MATCH(insn, INSN_MATCH_VSSSEG(8, 64)))
> +
> +#define IS_INDEXED_LOAD(insn) ( \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXEI16V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXEI32V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXEI64V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXEI16V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXEI32V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXEI64V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(2, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(3, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(4, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(5, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(6, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(7, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(8, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(2, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(3, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(4, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(5, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(6, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(7, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(8, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(2, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(3, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(4, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(5, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(6, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(7, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLUXSEG(8, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(2, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(3, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(4, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(5, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(6, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(7, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(8, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(2, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(3, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(4, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(5, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(6, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(7, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(8, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(2, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(3, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(4, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(5, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(6, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(7, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VLOXSEG(8, 64)))
> +
> +#define IS_INDEXED_STORE(insn) ( \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXEI16V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXEI32V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXEI64V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXEI16V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXEI32V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXEI64V) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(2, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(3, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(4, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(5, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(6, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(7, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(8, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(2, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(3, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(4, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(5, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(6, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(7, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(8, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(2, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(3, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(4, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(5, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(6, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(7, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSUXSEG(8, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(2, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(3, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(4, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(5, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(6, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(7, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(8, 16)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(2, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(3, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(4, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(5, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(6, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(7, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(8, 32)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(2, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(3, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(4, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(5, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(6, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(7, 64)) || \
> +	IS_INDEXED_MATCH(insn, INSN_MATCH_VSOXSEG(8, 64)))
> +
> +#define IS_FAULT_ONLY_FIRST_LOAD(insn) ( \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLE16FFV) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLE32FFV) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLE64FFV) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(2, 16)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(3, 16)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(4, 16)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(5, 16)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(6, 16)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(7, 16)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(8, 16)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(2, 32)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(3, 32)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(4, 32)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(5, 32)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(6, 32)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(7, 32)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(8, 32)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(2, 64)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(3, 64)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(4, 64)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(5, 64)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(6, 64)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(7, 64)) || \
> +	IS_FAULT_ONLY_FIRST_MATCH(insn, INSN_MATCH_VLSEGFF(8, 64)))
> +
> +	#define IS_WHOLE_REG_LOAD(insn) ( \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL1RE8V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL1RE16V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL1RE32V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL1RE64V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL2RE8V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL2RE16V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL2RE32V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL2RE64V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL4RE8V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL4RE16V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL4RE32V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL4RE64V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL8RE8V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL8RE16V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL8RE32V) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VL8RE64V))
> +
> +#define IS_WHOLE_REG_STORE(insn) ( \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VS1RV) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VS2RV) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VS4RV) || \
> +	IS_WHOLE_REG_MATCH(insn, INSN_MATCH_VS8RV))
> +
> +
>  #if __riscv_xlen == 64
>  
>  /* 64-bit read for VS-stage address translation (RV64) */
>  #define INSN_PSEUDO_VS_LOAD		0x00003000
> -
>  /* 64-bit write for VS-stage address translation (RV64) */
>  #define INSN_PSEUDO_VS_STORE	0x00003020
>  
> @@ -903,6 +1262,12 @@
>  #error "Unexpected __riscv_xlen"
>  #endif
>  
> +#define VM_MASK				0x1
> +#define VIEW_MASK				0x3
> +#define VSEW_MASK				0x3
> +#define VLMUL_MASK				0x7
> +#define VD_MASK				0x1f
> +#define VS2_MASK				0x1f
>  #define INSN_16BIT_MASK			0x3
>  #define INSN_32BIT_MASK			0x1c
>  
> @@ -921,6 +1286,12 @@
>  #endif
>  #define REGBYTES			(1 << LOG_REGBYTES)
>  
> +#define SH_VSEW			3
> +#define SH_VIEW			12
> +#define SH_VD				7
> +#define SH_VS2				20
> +#define SH_VM				25
> +#define SH_MEW				28
>  #define SH_RD				7
>  #define SH_RS1				15
>  #define SH_RS2				20
> @@ -974,6 +1345,18 @@
>  #define IMM_S(insn)			(((s32)(insn) >> 25 << 5) | \
>  					 (s32)(((insn) >> 7) & 0x1f))
>  
> +#define IS_MASKED(insn)		(((insn >> SH_VM) & VM_MASK) == 0)
> +#define GET_VD(insn)			((insn >> SH_VD) & VD_MASK)
> +#define GET_VS2(insn)			((insn >> SH_VS2) & VS2_MASK)
> +#define GET_VIEW(insn)			(((insn) >> SH_VIEW) & VIEW_MASK)
> +#define GET_MEW(insn)			(((insn) >> SH_MEW) & 1)
> +#define GET_VSEW(vtype)		(((vtype) >> SH_VSEW) & VSEW_MASK)
> +#define GET_VLMUL(vtype)		((vtype) & VLMUL_MASK)
> +#define GET_LEN(view)			(1UL << (view))
> +#define GET_NF(insn)			(1 + ((insn >> 29) & 7))
> +#define GET_VEMUL(vlmul, view, vsew)	((vlmul + view - vsew) & 7)
> +#define GET_EMUL(vemul)		(1UL << ((vemul) >= 4 ? 0 : (vemul)))
> +
>  #define MASK_FUNCT3			0x7000
>  #define MASK_RS1			0xf8000
>  #define MASK_CSR			0xfff00000
> diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
> index 8aee316..a6a6c75 100644
> --- a/include/sbi/sbi_trap_ldst.h
> +++ b/include/sbi/sbi_trap_ldst.h
> @@ -28,4 +28,13 @@ int sbi_load_access_handler(struct sbi_trap_context *tcntx);
>  
>  int sbi_store_access_handler(struct sbi_trap_context *tcntx);
>  
> +ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
> +				 ulong addr_offset);
> +
> +int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
> +				 struct sbi_trap_context *tcntx);
> +
> +int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
> +				 struct sbi_trap_context *tcntx);
> +
>  #endif
> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> index bd8ba2b..f4427fd 100644
> --- a/lib/sbi/Kconfig
> +++ b/lib/sbi/Kconfig
> @@ -66,4 +66,8 @@ config SBI_ECALL_SSE
>  	bool "SSE extension"
>  	default y
>  
> +config SUPPORT_VECTOR
> +       bool "Enable vector extension"
> +       default n
> +
>  endmenu
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 535aa70..9dbe218 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -89,6 +89,7 @@ libsbi-objs-y += sbi_timer.o
>  libsbi-objs-y += sbi_tlb.o
>  libsbi-objs-y += sbi_trap.o
>  libsbi-objs-y += sbi_trap_ldst.o
> +libsbi-objs-y += sbi_trap_v_ldst.o
>  libsbi-objs-y += sbi_unpriv.o
>  libsbi-objs-y += sbi_expected_trap.o
>  libsbi-objs-y += sbi_cppc.o
> diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
> index f9c0241..d3a4d24 100644
> --- a/lib/sbi/sbi_trap_ldst.c
> +++ b/lib/sbi/sbi_trap_ldst.c
> @@ -32,7 +32,7 @@ typedef int (*sbi_trap_ld_emulator)(int rlen, union sbi_ldst_data *out_val,
>  typedef int (*sbi_trap_st_emulator)(int wlen, union sbi_ldst_data in_val,
>  				    struct sbi_trap_context *tcntx);
>  
> -static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
> +ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
>  					ulong addr_offset)
>  {
>  	if (new_tinst == INSN_PSEUDO_VS_LOAD ||
> @@ -52,7 +52,7 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
>  	ulong insn, insn_len;
>  	union sbi_ldst_data val = { 0 };
>  	struct sbi_trap_info uptrap;
> -	int rc, fp = 0, shift = 0, len = 0;
> +	int rc, fp = 0, shift = 0, len = 0, vector = 0;
>  
>  	if (orig_trap->tinst & 0x1) {
>  		/*
> @@ -144,6 +144,9 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
>  		len = 2;
>  		shift = 8 * (sizeof(ulong) - len);
>  		insn = RVC_RS2S(insn) << SH_RD;
> +	} else if (IS_VECTOR_LOAD_STORE(insn)) {
> +		vector = 1;
> +		emu = sbi_misaligned_v_ld_emulator;
>  	} else {
>  		return sbi_trap_redirect(regs, orig_trap);
>  	}
> @@ -152,14 +155,16 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
>  	if (rc <= 0)
>  		return rc;
>  
> -	if (!fp)
> -		SET_RD(insn, regs, ((long)(val.data_ulong << shift)) >> shift);
> +	if (!vector) {
> +		if (!fp)
> +			SET_RD(insn, regs, ((long)(val.data_ulong << shift)) >> shift);
>  #ifdef __riscv_flen
> -	else if (len == 8)
> -		SET_F64_RD(insn, regs, val.data_u64);
> -	else
> -		SET_F32_RD(insn, regs, val.data_ulong);
> +		else if (len == 8)
> +			SET_F64_RD(insn, regs, val.data_u64);
> +		else
> +			SET_F32_RD(insn, regs, val.data_ulong);
>  #endif
> +	}
>  
>  	regs->mepc += insn_len;
>  
> @@ -248,6 +253,8 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
>  	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
>  		len		= 2;
>  		val.data_ulong = GET_RS2S(insn, regs);
> +	} else if (IS_VECTOR_LOAD_STORE(insn)) {
> +		emu = sbi_misaligned_v_st_emulator;
>  	} else {
>  		return sbi_trap_redirect(regs, orig_trap);
>  	}
> diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
> new file mode 100644
> index 0000000..9ca16d5
> --- /dev/null
> +++ b/lib/sbi/sbi_trap_v_ldst.c
> @@ -0,0 +1,341 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2024 SiFive Inc.
> + *
> + * Authors:
> + *   Andrew Waterman <andrew@sifive.com>
> + *   Nylon Chen <nylon.chen@sifive.com>
> + *   Zong Li <nylon.chen@sifive.com>
> + */
> +
> +#include <sbi/riscv_asm.h>
> +#include <sbi/riscv_encoding.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_trap_ldst.h>
> +#include <sbi/sbi_trap.h>
> +#include <sbi/sbi_unpriv.h>
> +#include <sbi/sbi_trap.h>
> +
> +#ifdef CONFIG_SUPPORT_VECTOR
> +#define VLEN_MAX 65536
> +
> +static inline void set_vreg(ulong vlenb, ulong which, ulong pos, ulong size, const uint8_t *bytes)
> +{
> +	pos += (which % 8) * vlenb;
> +	bytes -= pos;
> +
> +	asm volatile (
> +		"	.option push\n\t"
> +		"	.option arch, +v\n\t"
> +		"	vsetvli x0, %0, e8, m8, tu, ma\n\t"
> +		"	.option pop\n\t"
> +		:: "r" (pos + size));
> +
> +	csr_write(CSR_VSTART, pos);
> +
> +	switch (which / 8) {
> +	case 0:
> +		asm volatile (
> +			"	.option push\n\t"
> +			"	.option arch, +v\n\t"
> +			"	vle8.v v0,  (%0)\n\t"
> +			"	.option pop\n\t"
> +			:: "r" (bytes) : "memory");
> +		break;
> +	case 1:
> +		asm volatile (
> +			"	.option push\n\t"
> +			"	.option arch, +v\n\t"
> +			"	vle8.v v8,  (%0)\n\t"
> +			"	.option pop\n\t"
> +			:: "r" (bytes) : "memory");
> +		break;
> +	case 2:
> +		asm volatile (
> +			"	.option push\n\t"
> +			"	.option arch, +v\n\t"
> +			"	vle8.v v16,  (%0)\n\t"
> +			"	.option pop\n\t"
> +			:: "r" (bytes) : "memory");
> +		break;
> +	case 3:
> +		asm volatile (
> +			"	.option push\n\t"
> +			"	.option arch, +v\n\t"
> +			"	vle8.v v24,  (%0)\n\t"
> +			"	.option pop\n\t"
> +			:: "r" (bytes) : "memory");
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static inline void get_vreg(ulong vlenb, ulong which, ulong pos, ulong size, uint8_t *bytes)
> +{
> +	pos += (which % 8) * vlenb;
> +	bytes -= pos;
> +
> +	asm volatile (
> +		"	.option push\n\t"
> +		"	.option arch, +v\n\t"
> +		"	vsetvli x0, %0, e8, m8, tu, ma\n\t"
> +		"	.option pop\n\t"
> +		:: "r" (pos + size));
> +
> +	csr_write(CSR_VSTART, pos);
> +
> +	switch (which / 8) {
> +	case 0:
> +		asm volatile (
> +			"	.option push\n\t"
> +			"	.option arch, +v\n\t"
> +			"	vse8.v v0,  (%0)\n\t"
> +			"	.option pop\n\t"
> +			:: "r" (bytes) : "memory");
> +		break;
> +	case 1:
> +		asm volatile (
> +			"	.option push\n\t"
> +			"	.option arch, +v\n\t"
> +			"	vse8.v v8,  (%0)\n\t"
> +			"	.option pop\n\t"
> +			:: "r" (bytes) : "memory");
> +		break;
> +	case 2:
> +		asm volatile (
> +			"	.option push\n\t"
> +			"	.option arch, +v\n\t"
> +			"	vse8.v v16, (%0)\n\t"
> +			"	.option pop\n\t"
> +			:: "r" (bytes) : "memory");
> +		break;
> +	case 3:
> +		asm volatile (
> +				".option push\n\t"
> +				".option arch, +v\n\t"
> +				"vse8.v v24, (%0)\n\t"
> +				".option pop\n\t"
> +				:: "r" (bytes) : "memory");
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static inline void vsetvl(ulong vl, ulong vtype)
> +{
> +	asm volatile (
> +		"	.option push\n\t"
> +		"	.option arch, +v\n\t"
> +		"	vsetvl x0, %0, %1\n\t"
> +		"	.option pop\n\t"
> +			:: "r" (vl), "r" (vtype));
> +}
> +
> +int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
> +				 struct sbi_trap_context *tcntx)
> +{
> +	const struct sbi_trap_info *orig_trap = &tcntx->trap;
> +	struct sbi_trap_regs *regs = &tcntx->regs;
> +	struct sbi_trap_info uptrap;
> +	ulong insn = sbi_get_insn(regs->mepc, &uptrap);
> +	ulong vl = csr_read(CSR_VL);
> +	ulong vtype = csr_read(CSR_VTYPE);
> +	ulong vlenb = csr_read(CSR_VLENB);
> +	ulong vstart = csr_read(CSR_VSTART);
> +	ulong base = GET_RS1(insn, regs);
> +	ulong stride = GET_RS2(insn, regs);
> +	ulong vd = GET_VD(insn);
> +	ulong vs2 = GET_VS2(insn);
> +	ulong view = GET_VIEW(insn);
> +	ulong vsew = GET_VSEW(vtype);
> +	ulong vlmul = GET_VLMUL(vtype);
> +	bool illegal = GET_MEW(insn);
> +	bool masked = IS_MASKED(insn);
> +	uint8_t mask[VLEN_MAX / 8];
> +	uint8_t bytes[8 * sizeof(uint64_t)];
> +	ulong len = GET_LEN(view);
> +	ulong nf = GET_NF(insn);
> +	ulong vemul = GET_VEMUL(vlmul, view, vsew);
> +	ulong emul = GET_EMUL(vemul);
> +
> +	if (IS_UNIT_STRIDE_LOAD(insn) || IS_FAULT_ONLY_FIRST_LOAD(insn)) {
> +		stride = nf * len;
> +	} else if (IS_WHOLE_REG_LOAD(insn)) {
> +		vl = (nf * vlenb) >> view;
> +		nf = 1;
> +		vemul = 0;
> +		emul = 1;
> +		stride = nf * len;
> +	} else if (IS_INDEXED_LOAD(insn)) {
> +		len = 1 << vsew;
> +		vemul = (vlmul + vsew - vsew) & 7;
> +		emul = 1 << ((vemul & 4) ? 0 : vemul);
> +		stride = nf * len;
> +	}
> +
> +	if (illegal || vlenb > VLEN_MAX / 8) {
> +		struct sbi_trap_info trap = {
> +			uptrap.cause = CAUSE_ILLEGAL_INSTRUCTION,
> +			uptrap.tval = insn,
> +		};
> +		return sbi_trap_redirect(regs, &trap);
> +	}
> +
> +	if (masked)
> +		get_vreg(vlenb, 0, 0, vlenb, mask);
> +
> +	do {
> +		if (!masked || ((mask[vstart / 8] >> (vstart % 8)) & 1)) {
> +			// compute element address
> +			ulong addr = base + vstart * stride;
> +
> +			if (IS_INDEXED_LOAD(insn)) {
> +				ulong offset = 0;
> +
> +				get_vreg(vlenb, vs2, vstart << view, 1 << view, (uint8_t *)&offset);
> +				addr = base + offset;
> +			}
> +
> +			csr_write(CSR_VSTART, vstart);
> +
> +			// obtain load data from memory
> +			for (ulong seg = 0; seg < nf; seg++) {
> +				for (ulong i = 0; i < len; i++) {
> +					bytes[seg * len + i] =
> +						sbi_load_u8((void *)(addr + seg * len + i),
> +							    &uptrap);
> +
> +					if (uptrap.cause) {
> +						if (IS_FAULT_ONLY_FIRST_LOAD(insn) && vstart != 0) {
> +							vl = vstart;
> +							break;
> +						}
> +						vsetvl(vl, vtype);
> +						uptrap.tinst = sbi_misaligned_tinst_fixup(
> +							orig_trap->tinst, uptrap.tinst, i);
> +						return sbi_trap_redirect(regs, &uptrap);
> +					}
> +				}
> +			}
> +
> +			// write load data to regfile
> +			for (ulong seg = 0; seg < nf; seg++)
> +				set_vreg(vlenb, vd + seg * emul, vstart * len,
> +					 len, &bytes[seg * len]);
> +		}
> +	} while (++vstart < vl);
> +
> +	// restore clobbered vl/vtype
> +	vsetvl(vl, vtype);
> +
> +	return vl;
> +}
> +
> +int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
> +				 struct sbi_trap_context *tcntx)
> +{
> +	const struct sbi_trap_info *orig_trap = &tcntx->trap;
> +	struct sbi_trap_regs *regs = &tcntx->regs;
> +	struct sbi_trap_info uptrap;
> +	ulong insn = sbi_get_insn(regs->mepc, &uptrap);
> +	ulong vl = csr_read(CSR_VL);
> +	ulong vtype = csr_read(CSR_VTYPE);
> +	ulong vlenb = csr_read(CSR_VLENB);
> +	ulong vstart = csr_read(CSR_VSTART);
> +	ulong base = GET_RS1(insn, regs);
> +	ulong stride = GET_RS2(insn, regs);
> +	ulong vd = GET_VD(insn);
> +	ulong vs2 = GET_VS2(insn);
> +	ulong view = GET_VIEW(insn);
> +	ulong vsew = GET_VSEW(vtype);
> +	ulong vlmul = GET_VLMUL(vtype);
> +	bool illegal = GET_MEW(insn);
> +	bool masked = IS_MASKED(insn);
> +	uint8_t mask[VLEN_MAX / 8];
> +	uint8_t bytes[8 * sizeof(uint64_t)];
> +	ulong len = GET_LEN(view);
> +	ulong nf = GET_NF(insn);
> +	ulong vemul = GET_VEMUL(vlmul, view, vsew);
> +	ulong emul = GET_EMUL(vemul);
> +
> +	if (IS_UNIT_STRIDE_STORE(insn)) {
> +		stride = nf * len;
> +	} else if (IS_WHOLE_REG_STORE(insn)) {
> +		vl = (nf * vlenb) >> view;
> +		nf = 1;
> +		vemul = 0;
> +		emul = 1;
> +		stride = nf * len;
> +	} else if (IS_INDEXED_STORE(insn)) {
> +		len = 1 << vsew;
> +		vemul = (vlmul + vsew - vsew) & 7;
> +		emul = 1 << ((vemul & 4) ? 0 : vemul);
> +		stride = nf * len;
> +	}
> +
> +	if (illegal || vlenb > VLEN_MAX / 8) {
> +		struct sbi_trap_info trap = {
> +			uptrap.cause = CAUSE_ILLEGAL_INSTRUCTION,
> +			uptrap.tval = insn,
> +		};
> +		return sbi_trap_redirect(regs, &trap);
> +	}
> +
> +	if (masked)
> +		get_vreg(vlenb, 0, 0, vlenb, mask);
> +
> +	do {
> +		if (!masked || ((mask[vstart / 8] >> (vstart % 8)) & 1)) {
> +			// compute element address
> +			ulong addr = base + vstart * stride;
> +
> +			if (IS_INDEXED_STORE(insn)) {
> +				ulong offset = 0;
> +
> +				get_vreg(vlenb, vs2, vstart << view, 1 << view, (uint8_t *)&offset);
> +				addr = base + offset;
> +			}
> +
> +			// obtain store data from regfile
> +			for (ulong seg = 0; seg < nf; seg++)
> +				get_vreg(vlenb, vd + seg * emul, vstart * len,
> +					 len, &bytes[seg * len]);
> +
> +			csr_write(CSR_VSTART, vstart);
> +
> +			// write store data to memory
> +			for (ulong seg = 0; seg < nf; seg++) {
> +				for (ulong i = 0; i < len; i++) {
> +					sbi_store_u8((void *)(addr + seg * len + i),
> +						     bytes[seg * len + i], &uptrap);
> +					if (uptrap.cause) {
> +						vsetvl(vl, vtype);
> +						uptrap.tinst = sbi_misaligned_tinst_fixup(
> +							orig_trap->tinst, uptrap.tinst, i);
> +						return sbi_trap_redirect(regs, &uptrap);
> +					}
> +				}
> +			}
> +		}
> +	} while (++vstart < vl);
> +
> +	// restore clobbered vl/vtype
> +	vsetvl(vl, vtype);
> +
> +	return vl;
> +}
> +#else
> +int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
> +				 struct sbi_trap_context *tcntx)
> +{
> +	return 0;
> +}
> +int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
> +				 struct sbi_trap_context *tcntx)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_SUPPORT_VECTOR  */


