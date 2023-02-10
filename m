From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 10 Feb 2023 05:19:59 +0000
Subject: [PATCH v5 5/8] lib: sbi: Implement SBI debug console extension
In-Reply-To: <CAAhSdy0HC23UTSFV6_hep7+QMsp2sHOG-QhQLwGzFBvD1ivgkg@mail.gmail.com>
References: <20230113114110.1916226-1-apatel@ventanamicro.com>
 <20230113114110.1916226-6-apatel@ventanamicro.com>
 <20230201085815.77wcmkw76l2in5qc@orel>
 <CAAhSdy0HC23UTSFV6_hep7+QMsp2sHOG-QhQLwGzFBvD1ivgkg@mail.gmail.com>
Message-ID: <205F9423-3BD2-4510-854E-6FDE749BE7AB@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10 Feb 2023, at 04:23, Anup Patel <anup@brainfault.org> wrote:
> 
> On Wed, Feb 1, 2023 at 2:28 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>> 
>> On Fri, Jan 13, 2023 at 05:11:07PM +0530, Anup Patel wrote:
>>> We implement SBI debug console extension as one of the replacement
>>> SBI extensions. This extension is only available when OpenSBI platform
>>> provides a console device to generic library.
>>> 
>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>>> Reviewed-by: Xiang W <wxjstz@126.com>
>>> Reviewed-by: Bin Meng <bmeng@tinylab.org>
>>> ---
>>> lib/sbi/Kconfig          |  4 +++
>>> lib/sbi/objects.mk       |  3 ++
>>> lib/sbi/sbi_ecall_dbcn.c | 72 ++++++++++++++++++++++++++++++++++++++++
>>> 3 files changed, 79 insertions(+)
>>> create mode 100644 lib/sbi/sbi_ecall_dbcn.c
>>> 
>>> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
>>> index df74bba..ef6728b 100644
>>> --- a/lib/sbi/Kconfig
>>> +++ b/lib/sbi/Kconfig
>>> @@ -26,6 +26,10 @@ config SBI_ECALL_PMU
>>>      bool "Performance Monitoring Unit extension"
>>>      default y
>>> 
>>> +config SBI_ECALL_DBCN
>>> +     bool "Debug Console extension"
>>> +     default y
>>> +
>>> config SBI_ECALL_LEGACY
>>>      bool "SBI v0.1 legacy extensions"
>>>      default y
>>> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
>>> index c774ebb..319f38d 100644
>>> --- a/lib/sbi/objects.mk
>>> +++ b/lib/sbi/objects.mk
>>> @@ -37,6 +37,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SRST) += sbi_ecall_srst.o
>>> carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_PMU) += ecall_pmu
>>> libsbi-objs-$(CONFIG_SBI_ECALL_PMU) += sbi_ecall_pmu.o
>>> 
>>> +carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_DBCN) += ecall_dbcn
>>> +libsbi-objs-$(CONFIG_SBI_ECALL_DBCN) += sbi_ecall_dbcn.o
>>> +
>>> carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_LEGACY) += ecall_legacy
>>> libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
>>> 
>>> diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
>>> new file mode 100644
>>> index 0000000..bfa40e9
>>> --- /dev/null
>>> +++ b/lib/sbi/sbi_ecall_dbcn.c
>>> @@ -0,0 +1,72 @@
>>> +/*
>>> + * SPDX-License-Identifier: BSD-2-Clause
>>> + *
>>> + * Copyright (c) 2022 Ventana Micro Systems Inc.
>>> + *
>>> + * Authors:
>>> + *   Anup Patel <apatel@ventanamicro.com>
>>> + */
>>> +
>>> +#include <sbi/sbi_console.h>
>>> +#include <sbi/sbi_domain.h>
>>> +#include <sbi/sbi_error.h>
>>> +#include <sbi/sbi_ecall.h>
>>> +#include <sbi/sbi_ecall_interface.h>
>>> +#include <sbi/sbi_trap.h>
>>> +#include <sbi/riscv_asm.h>
>>> +
>>> +static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
>>> +                               const struct sbi_trap_regs *regs,
>>> +                               unsigned long *out_val,
>>> +                               struct sbi_trap_info *out_trap)
>>> +{
>>> +     ulong smode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >>
>>> +                     MSTATUS_MPP_SHIFT;
>>> +
>>> +     switch (funcid) {
>>> +     case SBI_EXT_DBCN_CONSOLE_WRITE:
>>> +     case SBI_EXT_DBCN_CONSOLE_READ:
>>> +             /*
>>> +              * On RV32, the M-mode can only access the first 4GB of
>>> +              * the physical address space because M-mode does not have
>>> +              * MMU to access full 34-bit physical address space.
>>> +              *
>>> +              * Based on above, we simply fail if the upper 32bits of
>>> +              * the physical address (i.e. a2 register) is non-zero on
>>> +              * RV32.
>>> +              */
>>> +#if __riscv_xlen == 32
>>> +             if (regs->a2)
>>> +                     return SBI_ERR_FAILED;
>> 
>> The spec drafts says SBI_ERR_FAILED is only for I/O errors. I think
>> we should extend the spec draft to point this situation out and return
>> SBI_ERR_INVALID_ADDRESS.
> 
> This is a limitation for OpenSBI RV32 because to support a 34bit
> physical address for RV32, we will need special infrastructure
> using a temporary page table. Due to this reason, twe reat this
> limitation as I/O error on OpenSBI RV32 side.

Were the interface to take a virtual address (or, really, pointer) this
would not be an issue as the supervisor would already have handled the
mapping for you. Which is what I?ve kept advocating for.

Jess

>> 
>>> +#endif
>>> +             if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
>>> +                                     regs->a1, regs->a0, smode,
>>> +                                     SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
>>> +                     return SBI_EINVALID_ADDR;
>> 
>> The spec draft says this should be SBI_ERR_INVALID_PARAM
> 
> Okay, I will update.
> 
>> 
>>> +             if (funcid == SBI_EXT_DBCN_CONSOLE_WRITE)
>>> +                     sbi_nputs((const char *)regs->a1, regs->a0);
>>> +             else
>>> +                     *out_val = sbi_ngets((char *)regs->a1, regs->a0);
>>> +             return 0;
>>> +     case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
>>> +             sbi_putc(regs->a0);
>>> +             return 0;
>>> +     default:
>>> +             break;
>>> +     }
>>> +
>>> +     return SBI_ENOTSUPP;
>>> +}
>>> +
>>> +static int sbi_ecall_dbcn_probe(unsigned long extid, unsigned long *out_val)
>>> +{
>>> +     *out_val = (sbi_console_get_device()) ? 1 : 0;
>> 
>> nit: Unnecessary ()
> 
> Okay, I will update.
> 
>> 
>>> +     return 0;
>>> +}
>>> +
>>> +struct sbi_ecall_extension ecall_dbcn = {
>>> +     .extid_start = SBI_EXT_DBCN,
>>> +     .extid_end = SBI_EXT_DBCN,
>>> +     .handle = sbi_ecall_dbcn_handler,
>>> +     .probe = sbi_ecall_dbcn_probe,
>>> +};
>>> --
>>> 2.34.1
>>> 
>>> 
>> 
>> Thanks,
>> drew
> 
> Regards,
> Anup
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


