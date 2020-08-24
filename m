From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Mon, 24 Aug 2020 16:56:35 +0000
Subject: [PATCH v2 2/5] lib: sbi: Improve PMP CSR detection and progamming
In-Reply-To: <20200824135243.136769-3-anup.patel@wdc.com>
References: <20200824135243.136769-1-anup.patel@wdc.com>
 <20200824135243.136769-3-anup.patel@wdc.com>
Message-ID: <78257f3b9add8641a5cc383bd0dc1ad4b3209b17.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-24 at 19:22 +0530, Anup Patel wrote:
> The RISC-V spec allows 4, 16 or 64 PMP regions and some of the PMP
> regions may be hardwired to zero.

I don't think this is true. The spec just says:

Up to 64 PMP entries are supported. Implementations may implement zero,
16, or 64 PMP CSRs.
All PMP CSR fields are WARL and may be hardwired to zero.

Alistair

> 
> This patch improves PMP CSR detection and progamming considering
> above facts.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/riscv_encoding.h |  67 ++++++++++++-
>  lib/sbi/riscv_asm.c          | 186 +++++++++++++------------------
> ----
>  lib/sbi/sbi_hart.c           |  72 +++++++++-----
>  3 files changed, 180 insertions(+), 145 deletions(-)
> 
> diff --git a/include/sbi/riscv_encoding.h
> b/include/sbi/riscv_encoding.h
> index 827c86c..073261f 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -144,7 +144,12 @@
>  #define PMP_L				_UL(0x80)
>  
>  #define PMP_SHIFT			2
> -#define PMP_COUNT			16
> +#define PMP_COUNT			64
> +#if __riscv_xlen == 64
> +#define PMP_ADDR_MASK			((_ULL(0x1) << 54) - 1)
> +#else
> +#define PMP_ADDR_MASK			_UL(0xFFFFFFFF)
> +#endif
>  
>  #if __riscv_xlen == 64
>  #define MSTATUS_SD			MSTATUS64_SD
> @@ -263,6 +268,18 @@
>  #define CSR_PMPCFG1			0x3a1
>  #define CSR_PMPCFG2			0x3a2
>  #define CSR_PMPCFG3			0x3a3
> +#define CSR_PMPCFG4			0x3a4
> +#define CSR_PMPCFG5			0x3a5
> +#define CSR_PMPCFG6			0x3a6
> +#define CSR_PMPCFG7			0x3a7
> +#define CSR_PMPCFG8			0x3a8
> +#define CSR_PMPCFG9			0x3a9
> +#define CSR_PMPCFG10			0x3aa
> +#define CSR_PMPCFG11			0x3ab
> +#define CSR_PMPCFG12			0x3ac
> +#define CSR_PMPCFG13			0x3ad
> +#define CSR_PMPCFG14			0x3ae
> +#define CSR_PMPCFG15			0x3af
>  #define CSR_PMPADDR0			0x3b0
>  #define CSR_PMPADDR1			0x3b1
>  #define CSR_PMPADDR2			0x3b2
> @@ -279,6 +296,54 @@
>  #define CSR_PMPADDR13			0x3bd
>  #define CSR_PMPADDR14			0x3be
>  #define CSR_PMPADDR15			0x3bf
> +#define CSR_PMPADDR16			0x3c0
> +#define CSR_PMPADDR17			0x3c1
> +#define CSR_PMPADDR18			0x3c2
> +#define CSR_PMPADDR19			0x3c3
> +#define CSR_PMPADDR20			0x3c4
> +#define CSR_PMPADDR21			0x3c5
> +#define CSR_PMPADDR22			0x3c6
> +#define CSR_PMPADDR23			0x3c7
> +#define CSR_PMPADDR24			0x3c8
> +#define CSR_PMPADDR25			0x3c9
> +#define CSR_PMPADDR26			0x3ca
> +#define CSR_PMPADDR27			0x3cb
> +#define CSR_PMPADDR28			0x3cc
> +#define CSR_PMPADDR29			0x3cd
> +#define CSR_PMPADDR30			0x3ce
> +#define CSR_PMPADDR31			0x3cf
> +#define CSR_PMPADDR32			0x3d0
> +#define CSR_PMPADDR33			0x3d1
> +#define CSR_PMPADDR34			0x3d2
> +#define CSR_PMPADDR35			0x3d3
> +#define CSR_PMPADDR36			0x3d4
> +#define CSR_PMPADDR37			0x3d5
> +#define CSR_PMPADDR38			0x3d6
> +#define CSR_PMPADDR39			0x3d7
> +#define CSR_PMPADDR40			0x3d8
> +#define CSR_PMPADDR41			0x3d9
> +#define CSR_PMPADDR42			0x3da
> +#define CSR_PMPADDR43			0x3db
> +#define CSR_PMPADDR44			0x3dc
> +#define CSR_PMPADDR45			0x3dd
> +#define CSR_PMPADDR46			0x3de
> +#define CSR_PMPADDR47			0x3df
> +#define CSR_PMPADDR48			0x3e0
> +#define CSR_PMPADDR49			0x3e1
> +#define CSR_PMPADDR50			0x3e2
> +#define CSR_PMPADDR51			0x3e3
> +#define CSR_PMPADDR52			0x3e4
> +#define CSR_PMPADDR53			0x3e5
> +#define CSR_PMPADDR54			0x3e6
> +#define CSR_PMPADDR55			0x3e7
> +#define CSR_PMPADDR56			0x3e8
> +#define CSR_PMPADDR57			0x3e9
> +#define CSR_PMPADDR58			0x3ea
> +#define CSR_PMPADDR59			0x3eb
> +#define CSR_PMPADDR60			0x3ec
> +#define CSR_PMPADDR61			0x3ed
> +#define CSR_PMPADDR62			0x3ee
> +#define CSR_PMPADDR63			0x3ef
>  #define CSR_TSELECT			0x7a0
>  #define CSR_TDATA1			0x7a1
>  #define CSR_TDATA2			0x7a2
> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> index 6dfebd9..799123f 100644
> --- a/lib/sbi/riscv_asm.c
> +++ b/lib/sbi/riscv_asm.c
> @@ -90,142 +90,88 @@ void misa_string(int xlen, char *out, unsigned
> int out_sz)
>  
>  unsigned long csr_read_num(int csr_num)
>  {
> +#define switchcase_csr_read(__csr_num, __val)		\
> +	case __csr_num:					\
> +		__val = csr_read(__csr_num);		\
> +		break;
> +#define switchcase_csr_read_2(__csr_num, __val)	\
> +	switchcase_csr_read(__csr_num + 0, __val)	\
> +	switchcase_csr_read(__csr_num + 1, __val)
> +#define switchcase_csr_read_4(__csr_num, __val)	\
> +	switchcase_csr_read_2(__csr_num + 0, __val)	\
> +	switchcase_csr_read_2(__csr_num + 2, __val)
> +#define switchcase_csr_read_8(__csr_num, __val)	\
> +	switchcase_csr_read_4(__csr_num + 0, __val)	\
> +	switchcase_csr_read_4(__csr_num + 4, __val)
> +#define switchcase_csr_read_16(__csr_num, __val)	\
> +	switchcase_csr_read_8(__csr_num + 0, __val)	\
> +	switchcase_csr_read_8(__csr_num + 8, __val)
> +#define switchcase_csr_read_32(__csr_num, __val)	\
> +	switchcase_csr_read_16(__csr_num + 0, __val)	\
> +	switchcase_csr_read_16(__csr_num + 16, __val)
> +#define switchcase_csr_read_64(__csr_num, __val)	\
> +	switchcase_csr_read_32(__csr_num + 0, __val)	\
> +	switchcase_csr_read_32(__csr_num + 32, __val)
> +
>  	unsigned long ret = 0;
>  
>  	switch (csr_num) {
> -	case CSR_PMPCFG0:
> -		ret = csr_read(CSR_PMPCFG0);
> -		break;
> -	case CSR_PMPCFG1:
> -		ret = csr_read(CSR_PMPCFG1);
> -		break;
> -	case CSR_PMPCFG2:
> -		ret = csr_read(CSR_PMPCFG2);
> -		break;
> -	case CSR_PMPCFG3:
> -		ret = csr_read(CSR_PMPCFG3);
> -		break;
> -	case CSR_PMPADDR0:
> -		ret = csr_read(CSR_PMPADDR0);
> -		break;
> -	case CSR_PMPADDR1:
> -		ret = csr_read(CSR_PMPADDR1);
> -		break;
> -	case CSR_PMPADDR2:
> -		ret = csr_read(CSR_PMPADDR2);
> -		break;
> -	case CSR_PMPADDR3:
> -		ret = csr_read(CSR_PMPADDR3);
> -		break;
> -	case CSR_PMPADDR4:
> -		ret = csr_read(CSR_PMPADDR4);
> -		break;
> -	case CSR_PMPADDR5:
> -		ret = csr_read(CSR_PMPADDR5);
> -		break;
> -	case CSR_PMPADDR6:
> -		ret = csr_read(CSR_PMPADDR6);
> -		break;
> -	case CSR_PMPADDR7:
> -		ret = csr_read(CSR_PMPADDR7);
> -		break;
> -	case CSR_PMPADDR8:
> -		ret = csr_read(CSR_PMPADDR8);
> -		break;
> -	case CSR_PMPADDR9:
> -		ret = csr_read(CSR_PMPADDR9);
> -		break;
> -	case CSR_PMPADDR10:
> -		ret = csr_read(CSR_PMPADDR10);
> -		break;
> -	case CSR_PMPADDR11:
> -		ret = csr_read(CSR_PMPADDR11);
> -		break;
> -	case CSR_PMPADDR12:
> -		ret = csr_read(CSR_PMPADDR12);
> -		break;
> -	case CSR_PMPADDR13:
> -		ret = csr_read(CSR_PMPADDR13);
> -		break;
> -	case CSR_PMPADDR14:
> -		ret = csr_read(CSR_PMPADDR14);
> -		break;
> -	case CSR_PMPADDR15:
> -		ret = csr_read(CSR_PMPADDR15);
> -		break;
> +	switchcase_csr_read_16(CSR_PMPCFG0, ret)
> +	switchcase_csr_read_64(CSR_PMPADDR0, ret)
>  	default:
>  		break;
>  	};
>  
>  	return ret;
> +
> +#undef switchcase_csr_read_64
> +#undef switchcase_csr_read_32
> +#undef switchcase_csr_read_16
> +#undef switchcase_csr_read_8
> +#undef switchcase_csr_read_4
> +#undef switchcase_csr_read_2
> +#undef switchcase_csr_read
>  }
>  
>  void csr_write_num(int csr_num, unsigned long val)
>  {
> +#define switchcase_csr_write(__csr_num, __val)		\
> +	case __csr_num:					\
> +		csr_write(__csr_num, __val);		\
> +		break;
> +#define switchcase_csr_write_2(__csr_num, __val)	\
> +	switchcase_csr_write(__csr_num + 0, __val)	\
> +	switchcase_csr_write(__csr_num + 1, __val)
> +#define switchcase_csr_write_4(__csr_num, __val)	\
> +	switchcase_csr_write_2(__csr_num + 0, __val)	\
> +	switchcase_csr_write_2(__csr_num + 2, __val)
> +#define switchcase_csr_write_8(__csr_num, __val)	\
> +	switchcase_csr_write_4(__csr_num + 0, __val)	\
> +	switchcase_csr_write_4(__csr_num + 4, __val)
> +#define switchcase_csr_write_16(__csr_num, __val)	\
> +	switchcase_csr_write_8(__csr_num + 0, __val)	\
> +	switchcase_csr_write_8(__csr_num + 8, __val)
> +#define switchcase_csr_write_32(__csr_num, __val)	\
> +	switchcase_csr_write_16(__csr_num + 0, __val)	\
> +	switchcase_csr_write_16(__csr_num + 16, __val)
> +#define switchcase_csr_write_64(__csr_num, __val)	\
> +	switchcase_csr_write_32(__csr_num + 0, __val)	\
> +	switchcase_csr_write_32(__csr_num + 32, __val)
> +
>  	switch (csr_num) {
> -	case CSR_PMPCFG0:
> -		csr_write(CSR_PMPCFG0, val);
> -		break;
> -	case CSR_PMPCFG1:
> -		csr_write(CSR_PMPCFG1, val);
> -		break;
> -	case CSR_PMPCFG2:
> -		csr_write(CSR_PMPCFG2, val);
> -		break;
> -	case CSR_PMPCFG3:
> -		csr_write(CSR_PMPCFG3, val);
> -		break;
> -	case CSR_PMPADDR0:
> -		csr_write(CSR_PMPADDR0, val);
> -		break;
> -	case CSR_PMPADDR1:
> -		csr_write(CSR_PMPADDR1, val);
> -		break;
> -	case CSR_PMPADDR2:
> -		csr_write(CSR_PMPADDR2, val);
> -		break;
> -	case CSR_PMPADDR3:
> -		csr_write(CSR_PMPADDR3, val);
> -		break;
> -	case CSR_PMPADDR4:
> -		csr_write(CSR_PMPADDR4, val);
> -		break;
> -	case CSR_PMPADDR5:
> -		csr_write(CSR_PMPADDR5, val);
> -		break;
> -	case CSR_PMPADDR6:
> -		csr_write(CSR_PMPADDR6, val);
> -		break;
> -	case CSR_PMPADDR7:
> -		csr_write(CSR_PMPADDR7, val);
> -		break;
> -	case CSR_PMPADDR8:
> -		csr_write(CSR_PMPADDR8, val);
> -		break;
> -	case CSR_PMPADDR9:
> -		csr_write(CSR_PMPADDR9, val);
> -		break;
> -	case CSR_PMPADDR10:
> -		csr_write(CSR_PMPADDR10, val);
> -		break;
> -	case CSR_PMPADDR11:
> -		csr_write(CSR_PMPADDR11, val);
> -		break;
> -	case CSR_PMPADDR12:
> -		csr_write(CSR_PMPADDR12, val);
> -		break;
> -	case CSR_PMPADDR13:
> -		csr_write(CSR_PMPADDR13, val);
> -		break;
> -	case CSR_PMPADDR14:
> -		csr_write(CSR_PMPADDR14, val);
> -		break;
> -	case CSR_PMPADDR15:
> -		csr_write(CSR_PMPADDR15, val);
> -		break;
> +	switchcase_csr_write_16(CSR_PMPCFG0, val)
> +	switchcase_csr_write_64(CSR_PMPADDR0, val)
>  	default:
>  		break;
>  	};
> +
> +#undef switchcase_csr_write_64
> +#undef switchcase_csr_write_32
> +#undef switchcase_csr_write_16
> +#undef switchcase_csr_write_8
> +#undef switchcase_csr_write_4
> +#undef switchcase_csr_write_2
> +#undef switchcase_csr_write
>  }
>  
>  static unsigned long ctz(unsigned long x)
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 80ed86a..8f31d58 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -340,31 +340,55 @@ static void hart_detect_features(struct
> sbi_scratch *scratch)
>  	hfeatures->features = 0;
>  	hfeatures->pmp_count = 0;
>  
> -	/* Detect if hart supports PMP feature */
> -#define __detect_pmp(__pmp_csr)					
> \
> -	val = csr_read_allowed(__pmp_csr, (ulong)&trap);	\
> -	if (!trap.cause) {					\
> -		csr_write_allowed(__pmp_csr, (ulong)&trap, val);\
> -		if (!trap.cause)				\
> -			hfeatures->pmp_count++;			\
> +#define __check_csr(__csr, __rdonly, __wrval, __field, __skip)	
> \
> +	val = csr_read_allowed(__csr, (ulong)&trap);			
> \
> +	if (!trap.cause) {						
> \
> +		if (__rdonly) {						
> \
> +			(hfeatures->__field)++;				
> \
> +		} else {						\
> +			csr_write_allowed(__csr, (ulong)&trap,
> __wrval);\
> +			if (!trap.cause) {				
> \
> +				if (csr_swap(__csr, val) == __wrval)	
> \
> +					(hfeatures->__field)++;		
> \
> +				else					
> \
> +					goto __skip;			
> \
> +			} else {					\
> +				goto __skip;				
> \
> +			}						\
> +		}							\
> +	} else {							\
> +		goto __skip;						
> \
>  	}
> -	__detect_pmp(CSR_PMPADDR0);
> -	__detect_pmp(CSR_PMPADDR1);
> -	__detect_pmp(CSR_PMPADDR2);
> -	__detect_pmp(CSR_PMPADDR3);
> -	__detect_pmp(CSR_PMPADDR4);
> -	__detect_pmp(CSR_PMPADDR5);
> -	__detect_pmp(CSR_PMPADDR6);
> -	__detect_pmp(CSR_PMPADDR7);
> -	__detect_pmp(CSR_PMPADDR8);
> -	__detect_pmp(CSR_PMPADDR9);
> -	__detect_pmp(CSR_PMPADDR10);
> -	__detect_pmp(CSR_PMPADDR11);
> -	__detect_pmp(CSR_PMPADDR12);
> -	__detect_pmp(CSR_PMPADDR13);
> -	__detect_pmp(CSR_PMPADDR14);
> -	__detect_pmp(CSR_PMPADDR15);
> -#undef __detect_pmp
> +#define __check_csr_2(__csr, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr(__csr + 0, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr(__csr + 1, __rdonly, __wrval, __field, __skip)
> +#define __check_csr_4(__csr, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_2(__csr + 0, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_2(__csr + 2, __rdonly, __wrval, __field, __skip)
> +#define __check_csr_8(__csr, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_4(__csr + 0, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_4(__csr + 4, __rdonly, __wrval, __field, __skip)
> +#define __check_csr_16(__csr, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_8(__csr + 0, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_8(__csr + 8, __rdonly, __wrval, __field, __skip)
> +#define __check_csr_32(__csr, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_16(__csr + 0, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_16(__csr + 16, __rdonly, __wrval, __field, __skip)
> +#define __check_csr_64(__csr, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_32(__csr + 0, __rdonly, __wrval, __field, __skip)	
> \
> +	__check_csr_32(__csr + 32, __rdonly, __wrval, __field, __skip)
> +
> +	/* Detect number of PMP regions */
> +	__check_csr_64(CSR_PMPADDR0, 0, PMP_ADDR_MASK, pmp_count,
> __pmp_skip);
> +__pmp_skip:
> +
> +#undef __check_csr_64
> +#undef __check_csr_32
> +#undef __check_csr_16
> +#undef __check_csr_8
> +#undef __check_csr_4
> +#undef __check_csr_2
> +#undef __check_csr
>  
>  	/* Detect if hart supports SCOUNTEREN feature */
>  	trap.cause = 0;
