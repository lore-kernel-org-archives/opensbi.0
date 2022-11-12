From: Xiang W <wxjstz@126.com>
Date: Sat, 12 Nov 2022 22:58:39 +0800
Subject: [RFC PATCH 3/3] lib: sbi: Implement SBI debug console extension
In-Reply-To: <CAOnJCU+zKsen8RFmsJn4e65GBgQKdrtNoQAZqU3vq3noqS4P0g@mail.gmail.com>
References: <20221110170016.1477865-1-apatel@ventanamicro.com>
	 <20221110170016.1477865-4-apatel@ventanamicro.com>
	 <CAOnJCU+zKsen8RFmsJn4e65GBgQKdrtNoQAZqU3vq3noqS4P0g@mail.gmail.com>
Message-ID: <46cd84e0e4a2a62710b00f77fae307f5a7eb9922.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-12???? 00:54 -0800?Atish Patra???
> On Thu, Nov 10, 2022 at 9:01 AM Anup Patel <apatel@ventanamicro.com> wrote:
> > 
> > We implement SBI debug console extension as one of the replacement
> > SBI extensions. This extension is only available when OpenSBI platform
> > provides a console device to generic library.
> > 
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> > ?lib/sbi/Kconfig???????????? |? 4 ++++
> > ?lib/sbi/objects.mk????????? |? 1 +
> > ?lib/sbi/sbi_ecall_replace.c | 30 ++++++++++++++++++++++++++++++
> > ?3 files changed, 35 insertions(+)
> > 
> > diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> > index df74bba..ef6728b 100644
> > --- a/lib/sbi/Kconfig
> > +++ b/lib/sbi/Kconfig
> > @@ -26,6 +26,10 @@ config SBI_ECALL_PMU
> > ??????? bool "Performance Monitoring Unit extension"
> > ??????? default y
> > 
> > +config SBI_ECALL_DBCN
> > +?????? bool "Debug Console extension"
> > +?????? default y
> > +
> > ?config SBI_ECALL_LEGACY
> > ??????? bool "SBI v0.1 legacy extensions"
> > ??????? default y
> > diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> > index 783c46d..7ccad52 100644
> > --- a/lib/sbi/objects.mk
> > +++ b/lib/sbi/objects.mk
> > @@ -23,6 +23,7 @@ carray-sbi_ecall_exts-y += ecall_base
> > ?carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_HSM) += ecall_hsm
> > ?carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_SRST) += ecall_srst
> > ?carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_PMU) += ecall_pmu
> > +carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_DBCN) += ecall_dbcn
> > ?carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_LEGACY) += ecall_legacy
> > ?carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VENDOR) += ecall_vendor
> > 
> > diff --git a/lib/sbi/sbi_ecall_replace.c b/lib/sbi/sbi_ecall_replace.c
> > index 0ea00d6..a092e2f 100644
> > --- a/lib/sbi/sbi_ecall_replace.c
> > +++ b/lib/sbi/sbi_ecall_replace.c
> > @@ -9,6 +9,7 @@
> > ? */
> > 
> > ?#include <sbi/riscv_asm.h>
> > +#include <sbi/sbi_console.h>
> > ?#include <sbi/sbi_ecall.h>
> > ?#include <sbi/sbi_ecall_interface.h>
> > ?#include <sbi/sbi_error.h>
> > @@ -202,3 +203,32 @@ struct sbi_ecall_extension ecall_srst = {
> > ??????? .probe = sbi_ecall_srst_probe,
> > ?};
> > ?#endif
> > +
> > +#ifdef CONFIG_SBI_ECALL_DBCN
> > +static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
> > +???????????????????????????????? const struct sbi_trap_regs *regs,
> > +???????????????????????????????? unsigned long *out_val,
> > +???????????????????????????????? struct sbi_trap_info *out_trap)
> > +{
> > +?????? if (funcid == SBI_EXT_DBCN_CONSOLE_PUTS) {
> > +?????????????? /* TODO: sanity check on the physical address range */
> 
> We need PMP validation to ensure that it is not one of the M-mode
> reserved addresses.
> What else needed to be done here ?

We also need to confirm that this memory is not mmio.

We can imitate sbi_domain_check_addr to create sbi_domain_check_range for
range checking.

Regards,
Xiang W

> 
> > +?????????????? sbi_nputs((const char *)regs->a1, regs->a0);
> > +?????????????? return 0;
> > +?????? }
> > +
> > +?????? return SBI_ENOTSUPP;
> > +}
> > +
> > +static int sbi_ecall_dbcn_probe(unsigned long extid, unsigned long *out_val)
> > +{
> > +?????? *out_val = (sbi_console_get_device()) ? 1 : 0;
> > +?????? return 0;
> > +}
> > +
> > +struct sbi_ecall_extension ecall_dbcn = {
> > +?????? .extid_start = SBI_EXT_DBCN,
> > +?????? .extid_end = SBI_EXT_DBCN,
> > +?????? .handle = sbi_ecall_dbcn_handler,
> > +?????? .probe = sbi_ecall_dbcn_probe,
> > +};
> > +#endif
> > --
> > 2.34.1
> > 
> 
> 
> --
> Regards,
> Atish
> 



