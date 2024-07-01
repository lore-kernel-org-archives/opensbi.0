From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 1 Jul 2024 11:20:37 +0200
Subject: [PATCH] lib:sbi: Enhance CSR Handling in system_opcode_insn
In-Reply-To: <20240701024516.20320-1-zhangdongdong@eswincomputing.com>
References: <20240701024516.20320-1-zhangdongdong@eswincomputing.com>
Message-ID: <20240701-843601b1dc18aee9a657be49@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 01, 2024 at 10:45:16AM GMT, zhangdongdong at eswincomputing.com wrote:
> From: Dongdong Zhang <zhangdongdong@eswincomputing.com>
> 
> - Completed TODO in `system_opcode_insn` to ensure CSR read/write
>   instruction handling.
> - Refactored to use new macros `GET_RS1_NUM` and `GET_CSR_NUM`.
> - Updated `GET_RM` macro and replaced hardcoded funct3 values with
>   constants (`CSRRW`, `CSRRS`, `CSRRC`, etc.).
> - Removed redundant `GET_RM` from `riscv_fp.h`.
> - Improved validation and error handling for CSR instructions.
> 
> This patch enhances the clarity and correctness of CSR handling
> in `system_opcode_insn`.
> 
> Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
> ---
>  include/sbi/riscv_encoding.h | 19 +++++++++++++++++-
>  include/sbi/riscv_fp.h       |  1 -
>  lib/sbi/sbi_illegal_insn.c   | 37 +++++++++++++++++++++++-------------
>  3 files changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 477fa3a..5146654 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -947,7 +947,10 @@
>  #define REG_PTR(insn, pos, regs)	\
>  	(ulong *)((ulong)(regs) + REG_OFFSET(insn, pos))
>  
> -#define GET_RM(insn)			(((insn) >> 12) & 7)
> +#define GET_RM(insn) ((insn & MASK_FUNCT3) >> SHIFT_FUNCT3)
> +
> +#define GET_RS1_NUM(insn)		((insn & MASK_RS1) >> 15)
> +#define GET_CSR_NUM(insn)		((insn & MASK_CSR) >> SHIFT_CSR)
>  
>  #define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
>  #define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
> @@ -959,7 +962,21 @@
>  #define IMM_I(insn)			((s32)(insn) >> 20)
>  #define IMM_S(insn)			(((s32)(insn) >> 25 << 5) | \
>  					 (s32)(((insn) >> 7) & 0x1f))
> +
>  #define MASK_FUNCT3			0x7000
> +#define MASK_RS1			0xf8000
> +#define MASK_CSR            0xfff
> +
> +#define SHIFT_FUNCT3    12
> +#define SHIFT_CSR       20
> +
> +
> +#define CSRRW 1
> +#define CSRRS 2
> +#define CSRRC 3
> +#define CSRRWI 5
> +#define CSRRSI 6
> +#define CSRRCI 7
>  
>  /* clang-format on */
>  
> diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h
> index 3141c1c..f523c56 100644
> --- a/include/sbi/riscv_fp.h
> +++ b/include/sbi/riscv_fp.h
> @@ -15,7 +15,6 @@
>  #include <sbi/sbi_types.h>
>  
>  #define GET_PRECISION(insn) (((insn) >> 25) & 3)
> -#define GET_RM(insn) (((insn) >> 12) & 7)
>  #define PRECISION_S 0
>  #define PRECISION_D 1
>  
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> index ed6f111..7086a5e 100644
> --- a/lib/sbi/sbi_illegal_insn.c
> +++ b/lib/sbi/sbi_illegal_insn.c
> @@ -48,9 +48,10 @@ static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>  
>  static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>  {
> -	int do_write, rs1_num = (insn >> 15) & 0x1f;
> -	ulong rs1_val = GET_RS1(insn, regs);
> -	int csr_num   = (u32)insn >> 20;
> +	bool do_write	= false;
> +	int rs1_num	= GET_RS1_NUM(insn);
> +	ulong rs1_val	= GET_RS1(insn, regs);
> +	int csr_num	= GET_CSR_NUM((u32)insn);
>  	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
>  	ulong csr_val, new_csr_val;
>  
> @@ -60,32 +61,42 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>  		return SBI_EFAIL;
>  	}
>  
> -	/* TODO: Ensure that we got CSR read/write instruction */
> +	/* Ensure that we got CSR read/write instruction */
> +	int funct3 = GET_RM(insn);
> +	if ((funct3 < 1 || funct3 > 3) && (funct3 < 5 || funct3 > 7)) {

This looks complicated. Isn't it just

 (func3 < 1 || func3 > 7 || func3 == 4)

Thanks,
drew

> +		sbi_printf("%s: Invalid opcode for CSR read/write instruction",
> +			   __func__);
> +		return truly_illegal_insn(insn, regs);
> +	}
>  
>  	if (sbi_emulate_csr_read(csr_num, regs, &csr_val))
>  		return truly_illegal_insn(insn, regs);
>  
>  	do_write = rs1_num;
> -	switch (GET_RM(insn)) {
> -	case 1:
> +	switch (funct3) {
> +	case CSRRW:
>  		new_csr_val = rs1_val;
> -		do_write    = 1;
> +		do_write    = true;
>  		break;
> -	case 2:
> +	case CSRRS:
>  		new_csr_val = csr_val | rs1_val;
> +		do_write    = (rs1_num != 0);
>  		break;
> -	case 3:
> +	case CSRRC:
>  		new_csr_val = csr_val & ~rs1_val;
> +		do_write    = (rs1_num != 0);
>  		break;
> -	case 5:
> +	case CSRRWI:
>  		new_csr_val = rs1_num;
> -		do_write    = 1;
> +		do_write    = true;
>  		break;
> -	case 6:
> +	case CSRRSI:
>  		new_csr_val = csr_val | rs1_num;
> +		do_write    = (rs1_num != 0);
>  		break;
> -	case 7:
> +	case CSRRCI:
>  		new_csr_val = csr_val & ~rs1_num;
> +		do_write    = (rs1_num != 0);
>  		break;
>  	default:
>  		return truly_illegal_insn(insn, regs);
> -- 
> 2.17.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

