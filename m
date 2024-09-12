From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 12 Sep 2024 18:22:22 -0500
Subject: [PATCH 2/5] lib: sbi: add Ssdbltrp ISA extension support
In-Reply-To: <20240912121052.2959596-3-cleger@rivosinc.com>
References: <20240912121052.2959596-1-cleger@rivosinc.com>
 <20240912121052.2959596-3-cleger@rivosinc.com>
Message-ID: <7be5502a-1fb6-4516-8459-b6209b30b8af@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-12 7:10 AM, Cl?ment L?ger wrote:
> Add Ssdbltrp trap handler support for S-mode double trap handling. If
> the trap is received while in VS-mode, then the trap is redirected to
> S-mode. If caught while in HS-mode, then a double trap SSE event is
> delivered.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  include/sbi/riscv_encoding.h      |  2 ++
>  include/sbi/sbi_ecall_interface.h |  2 ++
>  include/sbi/sbi_hart.h            |  3 ++-
>  include/sbi/sbi_trap_ldst.h       |  2 ++
>  lib/sbi/objects.mk                |  1 +
>  lib/sbi/sbi_double_trap.c         | 26 ++++++++++++++++++++++++++
>  lib/sbi/sbi_hart.c                |  4 ++++
>  lib/sbi/sbi_sse.c                 |  1 +
>  lib/sbi/sbi_trap.c                |  4 ++++
>  9 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 lib/sbi/sbi_double_trap.c
> 
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 2e4391f..4728c63 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -213,6 +213,7 @@
>  #define ENVCFG_PBMTE			(_ULL(1) << 62)
>  #define ENVCFG_ADUE			(_ULL(1) << 61)
>  #define ENVCFG_CDE			(_ULL(1) << 60)
> +#define ENVCFG_DTE			(_ULL(1) << 59)
>  #define ENVCFG_CBZE			(_UL(1) << 7)
>  #define ENVCFG_CBCFE			(_UL(1) << 6)
>  #define ENVCFG_CBIE_SHIFT		4
> @@ -763,6 +764,7 @@
>  #define CAUSE_FETCH_PAGE_FAULT		0xc
>  #define CAUSE_LOAD_PAGE_FAULT		0xd
>  #define CAUSE_STORE_PAGE_FAULT		0xf
> +#define CAUSE_DOUBLE_TRAP		0x10
>  #define CAUSE_FETCH_GUEST_PAGE_FAULT	0x14
>  #define CAUSE_LOAD_GUEST_PAGE_FAULT	0x15
>  #define CAUSE_VIRTUAL_INST_FAULT	0x16
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index e9a8167..d8077a7 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -379,7 +379,9 @@ enum sbi_sse_state {
>  
>  /* SBI SSE Event IDs. */
>  #define SBI_SSE_EVENT_LOCAL_RAS			0x00000000
> +#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
>  #define SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
> +#define	SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000

This duplicate definition looks like it was added accidentally. With this line
removed:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  #define SBI_SSE_EVENT_LOCAL_PLAT_0_END		0x00007fff
>  #define SBI_SSE_EVENT_GLOBAL_RAS		0x00008000
>  #define SBI_SSE_EVENT_GLOBAL_PLAT_0_START	0x00004000
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 81ec061..8aef2a1 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -67,7 +67,8 @@ enum sbi_hart_extensions {
>  	SBI_HART_EXT_SVADE,
>  	/** Hart has Svadu extension */
>  	SBI_HART_EXT_SVADU,
> -
> +	/** Hart has Ssdbltrp extension */
> +	SBI_HART_EXT_SSDBLTRP,
>  	/** Maximum index of Hart extension */
>  	SBI_HART_EXT_MAX,
>  };
> diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
> index 8aee316..4c5cc37 100644
> --- a/include/sbi/sbi_trap_ldst.h
> +++ b/include/sbi/sbi_trap_ldst.h
> @@ -28,4 +28,6 @@ int sbi_load_access_handler(struct sbi_trap_context *tcntx);
>  
>  int sbi_store_access_handler(struct sbi_trap_context *tcntx);
>  
> +int sbi_double_trap_handler(struct sbi_trap_context *tcntx);
> +
>  #endif
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 535aa70..7be943f 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -66,6 +66,7 @@ libsbi-objs-y += sbi_bitops.o
>  libsbi-objs-y += sbi_console.o
>  libsbi-objs-y += sbi_domain_context.o
>  libsbi-objs-y += sbi_domain.o
> +libsbi-objs-y += sbi_double_trap.o
>  libsbi-objs-y += sbi_emulate_csr.o
>  libsbi-objs-y += sbi_fifo.o
>  libsbi-objs-y += sbi_fwft.o
> diff --git a/lib/sbi/sbi_double_trap.c b/lib/sbi/sbi_double_trap.c
> new file mode 100644
> index 0000000..af3c991
> --- /dev/null
> +++ b/lib/sbi/sbi_double_trap.c
> @@ -0,0 +1,26 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2024 Rivos Inc.
> + *
> + * Authors:
> + *   Cl?ment L?ger <clement.leger@rivosinc.com>
> + */
> +
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_sse.h>
> +#include <sbi/sbi_trap.h>
> +
> +int sbi_double_trap_handler(struct sbi_trap_context *tcntx)
> +{
> +	struct sbi_trap_regs *regs = &tcntx->regs;
> +	const struct sbi_trap_info *trap = &tcntx->trap;
> +	bool prev_virt = sbi_regs_from_virt(regs);
> +
> +	/* Exception was taken in VS-mode, redirect it to S-mode */
> +	if (prev_virt)
> +		return sbi_trap_redirect(regs, trap);
> +
> +	return sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
> +}
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index cc364fa..d6b9a0a 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -117,6 +117,9 @@ static void mstatus_init(struct sbi_scratch *scratch)
>  		menvcfg_val |= ((uint64_t)csr_read(CSR_MENVCFGH)) << 32;
>  #endif
>  
> +		/* Disable double trap by default */
> +		menvcfg_val &= ~ENVCFG_DTE;
> +
>  #define __set_menvcfg_ext(__ext, __bits)				\
>  		if (sbi_hart_has_extension(scratch, __ext))		\
>  			menvcfg_val |= __bits;
> @@ -680,6 +683,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>  	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
>  	__SBI_HART_EXT_DATA(svade, SBI_HART_EXT_SVADE),
>  	__SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
> +	__SBI_HART_EXT_DATA(ssdbltrp, SBI_HART_EXT_SSDBLTRP),
>  };
>  
>  _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index 52172fc..b5f076a 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -41,6 +41,7 @@
>  
>  static const uint32_t supported_events[] = {
>  	SBI_SSE_EVENT_LOCAL_RAS,
> +	SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
>  	SBI_SSE_EVENT_GLOBAL_RAS,
>  	SBI_SSE_EVENT_LOCAL_PMU,
>  	SBI_SSE_EVENT_LOCAL_SOFTWARE,
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index 8bd2183..188f2a5 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -330,6 +330,10 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
>  		rc  = sbi_store_access_handler(tcntx);
>  		msg = "store fault handler failed";
>  		break;
> +	case CAUSE_DOUBLE_TRAP:
> +		rc  = sbi_double_trap_handler(tcntx);
> +		msg = "double trap handler failed";
> +		break;
>  	default:
>  		/* If the trap came from S or U mode, redirect it there */
>  		msg = "trap redirect failed";


