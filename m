From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 15 Sep 2023 16:42:06 +0800
Subject: [PATCH] platform: generic: thead: fix stale TLB entries for th1520/sg2042
In-Reply-To: <50f009df-8da5-4ac3-8439-1fb17ac6df86@dram.page>
References: <50f009df-8da5-4ac3-8439-1fb17ac6df86@dram.page>
Message-ID: <IA1PR20MB495303EA88BD044C95F9360EBBF6A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>Hello,
>
>I still think it would be better if someone in the know from T-Head or
>one of the SoC vendors can provide relevant silicon errata
>documentation. If anything just that this doesn't have to be called
>"that MMU bug" or "SFENCE_QUIRK".
>
>Onto the patch...
>

Yes, there is no public documentation and this is just tested by our team.
"ERRATA_TLB_FLUSH_FIXUP" or something like may be more suitable.

>On 9/14/23 12:27, Inochi Amaoto wrote:
>> The TLB entries remain functional all the time once added in T-HEAD th1520
>> and Sophgo sg2042 even if the MMU is then disabled afterwards. If there
>> are some stale TLB entries that contains the address of SBI, it will cause
>> unexpected memory access and issue a illegal instruction error. To avoid
>> this, a TLB flush is needed to drop these TLB entries before any memory
>> access in the trap handler.
>>
>> To handle this workaroud, add a custom trap handler with executing TLB flush
>> first in the T-HEAD platform to fix affected socs.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>> Changed from RFC v2:
>> 1. rollback the moving of trap helper macro to sbi_trap.h
>> 2. use direct jump in custom trap handler to access _trap_handler
>>
>> Changed from RFC:
>> 1. use custom trap handler instead of asm alternative.
>> 2. change description
>>
>> ---
>>  platform/generic/Kconfig                    |  4 ++
>>  platform/generic/configs/defconfig          |  1 +
>>  platform/generic/thead/objects.mk           | 10 ++++
>>  platform/generic/thead/thead-generic.c      | 57 +++++++++++++++++++++
>>  platform/generic/thead/thead-trap-handler.S | 17 ++++++
>>  5 files changed, 89 insertions(+)
>>  create mode 100644 platform/generic/thead/objects.mk
>>  create mode 100644 platform/generic/thead/thead-generic.c
>>  create mode 100644 platform/generic/thead/thead-trap-handler.S
>>
>> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
>> index 72768ed..68dd58c 100644
>> --- a/platform/generic/Kconfig
>> +++ b/platform/generic/Kconfig
>> @@ -52,6 +52,10 @@ config PLATFORM_STARFIVE_JH7110
>>  	bool "StarFive JH7110 support"
>>  	default n
>>
>> +config PLATFORM_THEAD_GENERIC
>> +	bool "THEAD C9xx generic platform support"
>> +	default n
>> +
>>  source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
>>
>>  endif
>> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
>> index 634d410..26f0874 100644
>> --- a/platform/generic/configs/defconfig
>> +++ b/platform/generic/configs/defconfig
>> @@ -4,6 +4,7 @@ CONFIG_PLATFORM_RENESAS_RZFIVE=y
>>  CONFIG_PLATFORM_SIFIVE_FU540=y
>>  CONFIG_PLATFORM_SIFIVE_FU740=y
>>  CONFIG_PLATFORM_STARFIVE_JH7110=y
>> +CONFIG_PLATFORM_THEAD_GENERIC=y
>>  CONFIG_FDT_GPIO=y
>>  CONFIG_FDT_GPIO_DESIGNWARE=y
>>  CONFIG_FDT_GPIO_SIFIVE=y
>> diff --git a/platform/generic/thead/objects.mk b/platform/generic/thead/objects.mk
>> new file mode 100644
>> index 0000000..cbbab18
>> --- /dev/null
>> +++ b/platform/generic/thead/objects.mk
>> @@ -0,0 +1,10 @@
>> +#
>> +# SPDX-License-Identifier: BSD-2-Clause
>> +#
>> +# Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
>> +# Copyright (C) 2023 Alibaba Group Holding Limited.
>> +#
>> +
>> +carray-platform_override_modules-$(CONFIG_PLATFORM_THEAD_GENERIC) += thead_generic
>> +platform-objs-$(CONFIG_PLATFORM_THEAD_GENERIC) += thead/thead-generic.o
>> +platform-objs-$(CONFIG_PLATFORM_THEAD_GENERIC) += thead/thead-trap-handler.o
>> diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
>> new file mode 100644
>> index 0000000..6cbe44c
>> --- /dev/null
>> +++ b/platform/generic/thead/thead-generic.c
>> @@ -0,0 +1,57 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Authors:
>> + *   Inochi Amaoto <inochiama@outlook.com>
>> + *
>> + */
>> +
>> +#include <platform_override.h>
>> +#include <sbi/riscv_barrier.h>
>> +#include <sbi/sbi_const.h>
>> +#include <sbi/sbi_platform.h>
>> +#include <sbi/sbi_scratch.h>
>> +#include <sbi/sbi_string.h>
>> +#include <sbi_utils/fdt/fdt_helper.h>
>> +
>> +#define THEAD_QUIRK_SFENCE_FIXUP		BIT(0)
>> +
>> +#define thead_get_symbol_local_address(_name)				\
>> +	({								\
>> +		register unsigned long __v;				\
>> +		__asm__ __volatile__ ("lla %0, " STRINGIFY(_name)	\
>> +				     : "=r"(__v)			\
>> +				     :					\
>> +				     : "memory");			\
>> +		(void*)__v;						\
>> +	})
>> +
>
>Any reason for this inline assembly dance? Can't you just declare it
>
>  void _thead_sfence_trap_handler();
>
>And use its address?
>
>  csr_write(CSR_MTVEC, (void*) &_thead_sfence_trap_handler);
>
>Since the this alternative trap handler only matters after entering the
>next stage, there's no need to do this super early pre-relocation. And
>at sbi_platform_early_init this is already post-relocation anyway.
>

Yes, now use address from GOT is OK. This is a stale code and we can change.

>> +void thead_register_sfence_trap_handler(void)
>> +{
>> +	void* trap_hanlder_addr = thead_get_symbol_local_address(
>> +						_thead_sfence_trap_handler);
>> +
>> +	csr_write(CSR_MTVEC, trap_hanlder_addr);
>
>Typo trap_hanlder_addr -> trap_handler_addr
>

Thanks.

>> +}
>> +
>> +static int thead_generic_early_init(bool cold_boot,
>> +				    const struct fdt_match *match)
>> +{
>> +	unsigned long quirks = (unsigned long)match->data;
>> +
>> +	if (quirks & THEAD_QUIRK_SFENCE_FIXUP)
>> +		thead_register_sfence_trap_handler();
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct fdt_match thead_generic_match[] = {
>> +	{ .compatible = "thead,th1520",
>> +	  .data = (void*)THEAD_QUIRK_SFENCE_FIXUP },
>> +	{ },
>> +};
>> +
>> +const struct platform_override thead_generic = {
>> +	.match_table	= thead_generic_match,
>> +	.early_init	= thead_generic_early_init,
>> +};
>> diff --git a/platform/generic/thead/thead-trap-handler.S b/platform/generic/thead/thead-trap-handler.S
>> new file mode 100644
>> index 0000000..6c99f32
>> --- /dev/null
>> +++ b/platform/generic/thead/thead-trap-handler.S
>> @@ -0,0 +1,17 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Authors:
>> + *   Inochi Amaoto <inochiama@outlook.com>
>> + *
>> + */
>> +
>> +#include <sbi/riscv_elf.h>
>> +#include <sbi/sbi_trap.h>
>> +
>
>Neither of these headers are used, it seems?

Yes, now no needed in for this file.

>
>> +	.section .entry, "ax", %progbits
>
>The .entry section from fw_*.S needs to be at the start of the image as
>that's the entrypoint. Is there a chance a linker might choose to put
>this before the actual entrypoint thus breaking it?
>

We use entry to ensure the function _thead_sfence_trap_handler is close to
the _trap_handler. This function is the entry of trap handler but not the
image.

>> +	.align 3
>> +	.globl _thead_sfence_trap_handler
>> +_thead_sfence_trap_handler:
>> +	sfence.vma t0, zero
>
>This was "sfence.vma zero, t0" in RFC v1, and "t0, zero" here and RFC
>v2. Is there any particular reason for either?
>
>On entry to trap handler t0 contains an arbitrary value from when the
>trap occurred. Is this intentional?
>

For T-HEAD cpus with this issue, a sfence is just OK. Either `sfence.vma`,
`sfence.vma zero` or "sfence.vma t0, zero is OK. We change to this to
minimize the performance impact.

>> +	j _trap_handler
>> --
>> 2.42.0
>>
>>
>
>Thanks,
>Vivian "dramforever" Wang
>

Thanks,
Inochi

