From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 28 Apr 2021 10:45:27 +0000
Subject: [PATCH 1/2] platform: Remove platform/thead
In-Reply-To: <1619506073-1398-1-git-send-email-guoren@kernel.org>
References: <1619506073-1398-1-git-send-email-guoren@kernel.org>
Message-ID: <DM6PR04MB6201480DE0AAC6B4FBE6651F8D409@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> guoren at kernel.org
> Sent: 27 April 2021 12:18
> To: guoren at kernel.org; anup at brainfault.org
> Cc: opensbi at lists.infradead.org; Guo Ren <guoren@linux.alibaba.com>
> Subject: [PATCH 1/2] platform: Remove platform/thead
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> We could use platform/generic instead, and won't use it again.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
>  docs/platform/platform.md        |   3 -
>  docs/platform/thead-c910.md      |  34 ---------
>  platform/thead/c910/config.mk    |  14 ----
>  platform/thead/c910/objects.mk   |   5 --
>  platform/thead/c910/platform.c   | 156 ---------------------------------------
>  platform/thead/c910/platform.h   |  46 ------------
>  scripts/create-binary-archive.sh |   1 -
>  7 files changed, 259 deletions(-)
>  delete mode 100644 docs/platform/thead-c910.md  delete mode 100644
> platform/thead/c910/config.mk  delete mode 100644
> platform/thead/c910/objects.mk  delete mode 100644
> platform/thead/c910/platform.c  delete mode 100644
> platform/thead/c910/platform.h
> 
> diff --git a/docs/platform/platform.md b/docs/platform/platform.md index
> 7f47068..b0cff37 100644
> --- a/docs/platform/platform.md
> +++ b/docs/platform/platform.md
> @@ -28,9 +28,6 @@ OpenSBI currently supports the following virtual and
> hardware platforms:
>  * **Andes AE350 SoC**: Platform support for the Andes's SoC (AE350).
> More
>    details on this platform can be found in the file *[andes-ae350.md]*.
> 
> -* **T-HEAD C910**: Platform support for the T-HEAD C910 Processor. More
> -  details on this platform can be found in the file *[thead-c910.md]*.
> -
>  * **Spike**: Platform support for the Spike emulator. More
>    details on this platform can be found in the file *[spike.md]*.
> 
> diff --git a/docs/platform/thead-c910.md b/docs/platform/thead-c910.md
> deleted file mode 100644 index 786b47d..0000000
> --- a/docs/platform/thead-c910.md
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -T-HEAD C910 Processor
> -=====================
> -C910 is a 12-stage, 3 issues, 8 executions, out-of-order 64-bit RISC-V CPU
> which -supports 16 cores, runs with 2.5GHz, and is capable of running Linux.
> -
> -To build platform specific library and firmwares, provide the
> -*PLATFORM=thead/c910* parameter to the top level make command.
> -
> -Platform Options
> -----------------
> -
> -The *T-HEAD C910* platform does not have any platform-specific options.
> -
> -Building T-HEAD C910 Platform
> ------------------------------
> -
> -```
> -make PLATFORM=thead/c910
> -```
> -
> -Booting T-HEAD C910 Platform
> -----------------------------
> -
> -**No Payload**
> -
> -As there's no payload, you may download vmlinux or u-boot to
> FW_JUMP_ADDR which -specified in config.mk or compile commands with
> GDB. And the execution flow will -turn to vmlinux or u-boot when opensbi
> ends.
> -
> -**Linux Kernel Payload**
> -
> -You can also choose to use Linux kernel as payload by enabling
> FW_PAYLOAD=y -along with specifying FW_PAYLOAD_OFFSET. The kernel
> image will be embedded in -the OPENSBI firmware binary, T-head will
> directly boot into Linux after OpenSBI.
> diff --git a/platform/thead/c910/config.mk b/platform/thead/c910/config.mk
> deleted file mode 100644 index bd5eab7..0000000
> --- a/platform/thead/c910/config.mk
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#
> -# SPDX-License-Identifier: BSD-2-Clause -#
> -
> -# Compiler flags
> -platform-cppflags-y =
> -platform-cflags-y =
> -platform-asflags-y =
> -platform-ldflags-y =
> -
> -# Blobs to build
> -FW_TEXT_START?=0x0
> -FW_JUMP=y
> -FW_JUMP_ADDR?=0x00200000
> diff --git a/platform/thead/c910/objects.mk
> b/platform/thead/c910/objects.mk deleted file mode 100644 index
> d025a36..0000000
> --- a/platform/thead/c910/objects.mk
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -#
> -# SPDX-License-Identifier: BSD-2-Clause -#
> -
> -platform-objs-y += platform.o
> diff --git a/platform/thead/c910/platform.c
> b/platform/thead/c910/platform.c deleted file mode 100644 index
> dfa484a..0000000
> --- a/platform/thead/c910/platform.c
> +++ /dev/null
> @@ -1,156 +0,0 @@
> -/*
> - * SPDX-License-Identifier: BSD-2-Clause
> - */
> -
> -#include <sbi/riscv_encoding.h>
> -#include <sbi/riscv_io.h>
> -#include <sbi/sbi_console.h>
> -#include <sbi/sbi_const.h>
> -#include <sbi/sbi_hart.h>
> -#include <sbi/sbi_platform.h>
> -#include <sbi_utils/irqchip/plic.h>
> -#include <sbi_utils/serial/uart8250.h>
> -#include <sbi_utils/sys/clint.h>
> -#include "platform.h"
> -
> -static struct c910_regs_struct c910_regs;
> -
> -static struct clint_data clint = {
> -	.addr = 0, /* Updated at cold boot time */
> -	.first_hartid = 0,
> -	.hart_count = C910_HART_COUNT,
> -	.has_64bit_mmio = FALSE,
> -};
> -
> -static int c910_early_init(bool cold_boot) -{
> -	if (cold_boot) {
> -		/* Load from boot core */
> -		c910_regs.pmpaddr0 = csr_read(CSR_PMPADDR0);
> -		c910_regs.pmpaddr1 = csr_read(CSR_PMPADDR1);
> -		c910_regs.pmpaddr2 = csr_read(CSR_PMPADDR2);
> -		c910_regs.pmpaddr3 = csr_read(CSR_PMPADDR3);
> -		c910_regs.pmpaddr4 = csr_read(CSR_PMPADDR4);
> -		c910_regs.pmpaddr5 = csr_read(CSR_PMPADDR5);
> -		c910_regs.pmpaddr6 = csr_read(CSR_PMPADDR6);
> -		c910_regs.pmpaddr7 = csr_read(CSR_PMPADDR7);
> -		c910_regs.pmpcfg0  = csr_read(CSR_PMPCFG0);
> -
> -		c910_regs.mcor     = csr_read(CSR_MCOR);
> -		c910_regs.mhcr     = csr_read(CSR_MHCR);
> -		c910_regs.mccr2    = csr_read(CSR_MCCR2);
> -		c910_regs.mhint    = csr_read(CSR_MHINT);
> -		c910_regs.mxstatus = csr_read(CSR_MXSTATUS);
> -
> -		c910_regs.plic_base_addr = csr_read(CSR_PLIC_BASE);
> -		c910_regs.clint_base_addr =
> -			c910_regs.plic_base_addr +
> C910_PLIC_CLINT_OFFSET;
> -	} else {
> -		/* Store to other core */
> -		csr_write(CSR_PMPADDR0, c910_regs.pmpaddr0);
> -		csr_write(CSR_PMPADDR1, c910_regs.pmpaddr1);
> -		csr_write(CSR_PMPADDR2, c910_regs.pmpaddr2);
> -		csr_write(CSR_PMPADDR3, c910_regs.pmpaddr3);
> -		csr_write(CSR_PMPADDR4, c910_regs.pmpaddr4);
> -		csr_write(CSR_PMPADDR5, c910_regs.pmpaddr5);
> -		csr_write(CSR_PMPADDR6, c910_regs.pmpaddr6);
> -		csr_write(CSR_PMPADDR7, c910_regs.pmpaddr7);
> -		csr_write(CSR_PMPCFG0, c910_regs.pmpcfg0);
> -
> -		csr_write(CSR_MCOR, c910_regs.mcor);
> -		csr_write(CSR_MHCR, c910_regs.mhcr);
> -		csr_write(CSR_MHINT, c910_regs.mhint);
> -		csr_write(CSR_MXSTATUS, c910_regs.mxstatus);
> -	}
> -
> -	return 0;
> -}
> -
> -static int c910_final_init(bool cold_boot) -{
> -	return 0;
> -}
> -
> -static int c910_irqchip_init(bool cold_boot) -{
> -	/* Delegate plic enable into S-mode */
> -	writel(C910_PLIC_DELEG_ENABLE,
> -		(void *)c910_regs.plic_base_addr +
> C910_PLIC_DELEG_OFFSET);
> -
> -	return 0;
> -}
> -
> -static int c910_ipi_init(bool cold_boot) -{
> -	int rc;
> -
> -	if (cold_boot) {
> -		clint.addr = c910_regs.clint_base_addr;
> -		rc = clint_cold_ipi_init(&clint);
> -		if (rc)
> -			return rc;
> -	}
> -
> -	return clint_warm_ipi_init();
> -}
> -
> -static int c910_timer_init(bool cold_boot) -{
> -	int ret;
> -
> -	if (cold_boot) {
> -		clint.addr = c910_regs.clint_base_addr;
> -		ret = clint_cold_timer_init(&clint, NULL);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return clint_warm_timer_init();
> -}
> -
> -static int c910_system_reset_check(u32 type, u32 reason) -{
> -	return 1;
> -}
> -
> -static void c910_system_reset(u32 type, u32 reason) -{
> -	asm volatile ("ebreak");
> -}
> -
> -int c910_hart_start(u32 hartid, ulong saddr) -{
> -	csr_write(CSR_MRVBR, saddr);
> -	csr_write(CSR_MRMR, csr_read(CSR_MRMR) | (1 << hartid));
> -
> -	return 0;
> -}
> -
> -const struct sbi_platform_operations platform_ops = {
> -	.early_init          = c910_early_init,
> -	.final_init          = c910_final_init,
> -
> -	.irqchip_init        = c910_irqchip_init,
> -
> -	.ipi_init            = c910_ipi_init,
> -	.ipi_send            = clint_ipi_send,
> -	.ipi_clear           = clint_ipi_clear,
> -
> -	.timer_init          = c910_timer_init,
> -	.timer_event_start   = clint_timer_event_start,
> -
> -	.system_reset_check  = c910_system_reset_check,
> -	.system_reset        = c910_system_reset,
> -
> -	.hart_start          = c910_hart_start,
> -};
> -
> -const struct sbi_platform platform = {
> -	.opensbi_version     = OPENSBI_VERSION,
> -	.platform_version    = SBI_PLATFORM_VERSION(0x0, 0x01),
> -	.name                = "T-HEAD Xuantie c910",
> -	.features            = SBI_THEAD_FEATURES,
> -	.hart_count          = C910_HART_COUNT,
> -	.hart_stack_size     = SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
> -	.platform_ops_addr   = (unsigned long)&platform_ops
> -};
> diff --git a/platform/thead/c910/platform.h
> b/platform/thead/c910/platform.h deleted file mode 100644 index
> 354404e..0000000
> --- a/platform/thead/c910/platform.h
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -/*
> - * SPDX-License-Identifier: BSD-2-Clause
> - */
> -
> -#ifndef _C910_PLATFORM_H_
> -#define _C910_PLATFORM_H_
> -
> -#define C910_HART_COUNT   16
> -
> -#define SBI_THEAD_FEATURES	\
> -	 (SBI_PLATFORM_HAS_MFAULTS_DELEGATION | \
> -	 SBI_PLATFORM_HAS_HART_SECONDARY_BOOT)
> -
> -#define CSR_MCOR         0x7c2
> -#define CSR_MHCR         0x7c1
> -#define CSR_MCCR2        0x7c3
> -#define CSR_MHINT        0x7c5
> -#define CSR_MXSTATUS     0x7c0
> -#define CSR_PLIC_BASE    0xfc1
> -#define CSR_MRMR         0x7c6
> -#define CSR_MRVBR        0x7c7
> -
> -#define C910_PLIC_CLINT_OFFSET     0x04000000  /* 64M */
> -#define C910_PLIC_DELEG_OFFSET     0x001ffffc
> -#define C910_PLIC_DELEG_ENABLE     0x1
> -
> -struct c910_regs_struct {
> -	u64 pmpaddr0;
> -	u64 pmpaddr1;
> -	u64 pmpaddr2;
> -	u64 pmpaddr3;
> -	u64 pmpaddr4;
> -	u64 pmpaddr5;
> -	u64 pmpaddr6;
> -	u64 pmpaddr7;
> -	u64 pmpcfg0;
> -	u64 mcor;
> -	u64 mhcr;
> -	u64 mccr2;
> -	u64 mhint;
> -	u64 mxstatus;
> -	u64 plic_base_addr;
> -	u64 clint_base_addr;
> -};
> -
> -#endif /* _C910_PLATFORM_H_ */
> diff --git a/scripts/create-binary-archive.sh b/scripts/create-binary-archive.sh
> index c19af26..a8bd335 100755
> --- a/scripts/create-binary-archive.sh
> +++ b/scripts/create-binary-archive.sh
> @@ -106,7 +106,6 @@ build_opensbi() {
>  		BUILD_PLATFORM_SUBDIR+=("fpga/ariane")
>  		BUILD_PLATFORM_SUBDIR+=("fpga/openpiton")
>  		BUILD_PLATFORM_SUBDIR+=("andes/ae350")
> -		BUILD_PLATFORM_SUBDIR+=("thead/c910")
>  		BUILD_PLATFORM_SUBDIR+=("generic")
>  		;;
>  	*)
> --
> 2.7.4
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

