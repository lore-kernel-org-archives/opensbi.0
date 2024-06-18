From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jun 2024 21:29:12 +0530
Subject: [PATCH v2 4/4] lib: sbi: implement SBI FWFT extension
In-Reply-To: <20240617154110.4007865-5-cleger@rivosinc.com>
References: <20240617154110.4007865-1-cleger@rivosinc.com> <20240617154110.4007865-5-cleger@rivosinc.com>
Message-ID: <CAAhSdy0BqkJthx51Zm=k+NxWnxXkZS+Jh_8VC=e=+=qs46hhTQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 17, 2024 at 9:11?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> The SBI FWFT extension defines a set of function that can be called to
> control the configuration of some platform features (misaligned
> trap delegation, etc). This patch implements sbi_fwft_set() and
> sbi_fwft_get() as defined in the specification [1].
>
> Link: https://lists.riscv.org/g/tech-prs/message/924 [1]
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/Kconfig          |  4 ++++
>  lib/sbi/objects.mk       |  3 +++
>  lib/sbi/sbi_ecall_fwft.c | 49 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+)
>  create mode 100644 lib/sbi/sbi_ecall_fwft.c
>
> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> index cc8e031..6cf54ce 100644
> --- a/lib/sbi/Kconfig
> +++ b/lib/sbi/Kconfig
> @@ -38,6 +38,10 @@ config SBI_ECALL_CPPC
>         bool "CPPC extension"
>         default y
>
> +config SBI_ECALL_FWFT
> +       bool "Firmware Feature extension"
> +       default y
> +
>  config SBI_ECALL_LEGACY
>         bool "SBI v0.1 legacy extensions"
>         default y
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 221e72c..211abad 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -46,6 +46,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_DBCN) += sbi_ecall_dbcn.o
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_CPPC) += ecall_cppc
>  libsbi-objs-$(CONFIG_SBI_ECALL_CPPC) += sbi_ecall_cppc.o
>
> +carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_FWFT) += ecall_fwft
> +libsbi-objs-$(CONFIG_SBI_ECALL_FWFT) += sbi_ecall_fwft.o
> +
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_LEGACY) += ecall_legacy
>  libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
>
> diff --git a/lib/sbi/sbi_ecall_fwft.c b/lib/sbi/sbi_ecall_fwft.c
> new file mode 100644
> index 0000000..267cbab
> --- /dev/null
> +++ b/lib/sbi/sbi_ecall_fwft.c
> @@ -0,0 +1,49 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2024 Rivos Inc.
> + *
> + * Authors:
> + *   Cl?ment L?ger <cleger@rivosinc.com>
> + */
> +
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_fwft.h>
> +#include <sbi/sbi_trap.h>
> +
> +static int sbi_ecall_fwft_handler(unsigned long extid, unsigned long funcid,
> +                                struct sbi_trap_regs *regs,
> +                                struct sbi_ecall_return *out)
> +{
> +       int ret = 0;
> +
> +       switch (funcid) {
> +       case SBI_EXT_FWFT_SET:
> +               ret = sbi_fwft_set(regs->a0, regs->a1, regs->a2);
> +               break;
> +       case SBI_EXT_FWFT_GET:
> +               ret = sbi_fwft_get(regs->a0, &out->value);
> +               break;
> +       default:
> +               ret = SBI_ENOTSUPP;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +struct sbi_ecall_extension ecall_fwft;
> +
> +static int sbi_ecall_fwft_register_extensions(void)
> +{
> +       return sbi_ecall_register_extension(&ecall_fwft);
> +}
> +
> +struct sbi_ecall_extension ecall_fwft = {
> +       .extid_start = SBI_EXT_FWFT,
> +       .extid_end = SBI_EXT_FWFT,
> +       .register_extensions = sbi_ecall_fwft_register_extensions,
> +       .handle = sbi_ecall_fwft_handler,
> +};
> --
> 2.45.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

