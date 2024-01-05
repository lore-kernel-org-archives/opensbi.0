From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jan 2024 21:47:29 +0530
Subject: [PATCH v1 6/7] lib: sbi: Introduce ecall handler for SBI debug
 trigger extension
In-Reply-To: <20231219112856.3865827-7-hchauhan@ventanamicro.com>
References: <20231219112856.3865827-1-hchauhan@ventanamicro.com> <20231219112856.3865827-7-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy2G1zX3KCcJBTxozp+XSDHcvhGY2x0OEbn0Z5quoGHReQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Simplify patch subject to:
lib: sbi: Implement SBI debug trigger extension

On Tue, Dec 19, 2023 at 4:59?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> This patch adds functions to register ecalls for debug triggers
> and handler to handle the debug trigger function IDs.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  lib/sbi/Kconfig          |  4 +++
>  lib/sbi/objects.mk       |  3 ++
>  lib/sbi/sbi_ecall_dbtr.c | 74 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+)
>  create mode 100644 lib/sbi/sbi_ecall_dbtr.c
>
> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> index 477775e..81dd2db 100644
> --- a/lib/sbi/Kconfig
> +++ b/lib/sbi/Kconfig
> @@ -46,4 +46,8 @@ config SBI_ECALL_VENDOR
>         bool "Platform-defined vendor extensions"
>         default y
>
> +config SBI_ECALL_DBTR
> +       bool "Debug Trigger Extension"
> +       default y
> +
>  endmenu
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index c7de150..0a50e95 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -52,6 +52,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VENDOR) += ecall_vendor
>  libsbi-objs-$(CONFIG_SBI_ECALL_VENDOR) += sbi_ecall_vendor.o
>
> +carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_DBTR) += ecall_dbtr
> +libsbi-objs-$(CONFIG_SBI_ECALL_DBTR) += sbi_ecall_dbtr.o
> +
>  libsbi-objs-y += sbi_bitmap.o
>  libsbi-objs-y += sbi_bitops.o
>  libsbi-objs-y += sbi_console.o
> diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
> new file mode 100644
> index 0000000..0b589b2
> --- /dev/null
> +++ b/lib/sbi/sbi_ecall_dbtr.c
> @@ -0,0 +1,74 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + *
> + * Author(s):
> + *   Himanshu Chauhan <hchauhan@ventanamicro.com>
> + */
> +
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_trap.h>
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_dbtr.h>
> +
> +static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
> +                                 const struct sbi_trap_regs *regs,
> +                                 unsigned long *out_val,
> +                                 struct sbi_trap_info *out_trap)

The prototype of ecall handler has changed so please rebase this
series on the latest OpenSBI.

> +{
> +       unsigned long smode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >>
> +                       MSTATUS_MPP_SHIFT;
> +       const struct sbi_domain *dom = sbi_domain_thishart_ptr();
> +       int ret = 0;
> +
> +       switch (funcid) {
> +       case SBI_EXT_DBTR_NUM_TRIGGERS:
> +               ret = sbi_dbtr_num_trig(regs->a0, out_val);
> +               break;
> +       case SBI_EXT_DBTR_SETUP_SHMEM:
> +               ret = sbi_dbtr_setup_shmem(dom, smode, regs->a0, regs->a1);
> +               break;
> +       case SBI_EXT_DBTR_TRIGGER_READ:
> +               ret = sbi_dbtr_read_trig(dom, smode, regs->a0, regs->a1);
> +               break;
> +       case SBI_EXT_DBTR_TRIGGER_INSTALL:
> +               ret = sbi_dbtr_install_trig(dom, smode, regs->a0, out_val);
> +               break;
> +       case SBI_EXT_DBTR_TRIGGER_UNINSTALL:
> +               ret = sbi_dbtr_uninstall_trig(regs->a0, regs->a1);
> +               break;
> +       case SBI_EXT_DBTR_TRIGGER_ENABLE:
> +               ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
> +               break;
> +       case SBI_EXT_DBTR_TRIGGER_UPDATE:
> +               ret = sbi_dbtr_update_trig(dom, smode, regs->a0, regs->a1);
> +               break;
> +       case SBI_EXT_DBTR_TRIGGER_DISABLE:
> +               ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);
> +               break;
> +       default:
> +               ret = SBI_ENOTSUPP;
> +       };
> +
> +       return ret;
> +}
> +
> +struct sbi_ecall_extension ecall_dbtr;
> +
> +static int sbi_ecall_dbtr_register_extensions(void)
> +{
> +       if (!sbi_dbtr_supported())
> +               return 0;
> +
> +       return sbi_ecall_register_extension(&ecall_dbtr);
> +}
> +
> +struct sbi_ecall_extension ecall_dbtr = {
> +       .extid_start = SBI_EXT_DBTR,
> +       .extid_end = SBI_EXT_DBTR,
> +       .handle = sbi_ecall_dbtr_handler,
> +       .register_extensions = sbi_ecall_dbtr_register_extensions,
> +};
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

