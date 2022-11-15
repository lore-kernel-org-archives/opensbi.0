From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Nov 2022 16:52:02 +0530
Subject: [PATCH] lib: sbi_ecall: Split up sbi_ecall_replace
In-Reply-To: <TYYP286MB14394A21B7C5D612DBC5F3ECC63E9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB14394A21B7C5D612DBC5F3ECC63E9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy2LZnDx5gZxSANfOUO9NyqbrUgJN_K7bctkiy10bpNBHg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 9, 2022 at 12:24 PM Vivian Wang <dramforever@live.com> wrote:
>
> Split up sbi_ecall_replace so that each extension is in its individual
> file.
>
> Also reorganize the corresponding section in lib/sbi/objects.mk so
> that it is grouped by extension, now that the object file targets are
> split up.
>
> Signed-off-by: Vivian Wang <dramforever@live.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/objects.mk                            |  22 +++-
>  lib/sbi/sbi_ecall_ipi.c                       |  36 ++++++
>  ...sbi_ecall_replace.c => sbi_ecall_rfence.c} | 122 +-----------------
>  lib/sbi/sbi_ecall_srst.c                      |  75 +++++++++++
>  lib/sbi/sbi_ecall_time.c                      |  40 ++++++
>  5 files changed, 169 insertions(+), 126 deletions(-)
>  create mode 100644 lib/sbi/sbi_ecall_ipi.c
>  rename lib/sbi/{sbi_ecall_replace.c => sbi_ecall_rfence.c} (50%)
>  create mode 100644 lib/sbi/sbi_ecall_srst.c
>  create mode 100644 lib/sbi/sbi_ecall_time.c
>
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 783c46d..c774ebb 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -17,20 +17,30 @@ libsbi-objs-y += sbi_ecall_exts.o
>
>  # The order of below extensions is performance optimized
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_TIME) += ecall_time
> +libsbi-objs-$(CONFIG_SBI_ECALL_TIME) += sbi_ecall_time.o
> +
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_RFENCE) += ecall_rfence
> +libsbi-objs-$(CONFIG_SBI_ECALL_RFENCE) += sbi_ecall_rfence.o
> +
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_IPI) += ecall_ipi
> +libsbi-objs-$(CONFIG_SBI_ECALL_IPI) += sbi_ecall_ipi.o
> +
>  carray-sbi_ecall_exts-y += ecall_base
> +libsbi-objs-y += sbi_ecall_base.o
> +
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_HSM) += ecall_hsm
> +libsbi-objs-$(CONFIG_SBI_ECALL_HSM) += sbi_ecall_hsm.o
> +
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_SRST) += ecall_srst
> +libsbi-objs-$(CONFIG_SBI_ECALL_SRST) += sbi_ecall_srst.o
> +
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_PMU) += ecall_pmu
> -carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_LEGACY) += ecall_legacy
> -carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VENDOR) += ecall_vendor
> +libsbi-objs-$(CONFIG_SBI_ECALL_PMU) += sbi_ecall_pmu.o
>
> -libsbi-objs-y += sbi_ecall_base.o
> -libsbi-objs-$(CONFIG_SBI_ECALL_HSM) += sbi_ecall_hsm.o
> +carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_LEGACY) += ecall_legacy
>  libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
> -libsbi-objs-$(CONFIG_SBI_ECALL_PMU) += sbi_ecall_pmu.o
> -libsbi-objs-y += sbi_ecall_replace.o
> +
> +carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VENDOR) += ecall_vendor
>  libsbi-objs-$(CONFIG_SBI_ECALL_VENDOR) += sbi_ecall_vendor.o
>
>  libsbi-objs-y += sbi_bitmap.o
> diff --git a/lib/sbi/sbi_ecall_ipi.c b/lib/sbi/sbi_ecall_ipi.c
> new file mode 100644
> index 0000000..f4797e1
> --- /dev/null
> +++ b/lib/sbi/sbi_ecall_ipi.c
> @@ -0,0 +1,36 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>
> + *   Atish Patra <atish.patra@wdc.com>
> + */
> +
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_trap.h>
> +#include <sbi/sbi_ipi.h>
> +
> +static int sbi_ecall_ipi_handler(unsigned long extid, unsigned long funcid,
> +                                const struct sbi_trap_regs *regs,
> +                                unsigned long *out_val,
> +                                struct sbi_trap_info *out_trap)
> +{
> +       int ret = 0;
> +
> +       if (funcid == SBI_EXT_IPI_SEND_IPI)
> +               ret = sbi_ipi_send_smode(regs->a0, regs->a1);
> +       else
> +               ret = SBI_ENOTSUPP;
> +
> +       return ret;
> +}
> +
> +struct sbi_ecall_extension ecall_ipi = {
> +       .extid_start = SBI_EXT_IPI,
> +       .extid_end = SBI_EXT_IPI,
> +       .handle = sbi_ecall_ipi_handler,
> +};
> diff --git a/lib/sbi/sbi_ecall_replace.c b/lib/sbi/sbi_ecall_rfence.c
> similarity index 50%
> rename from lib/sbi/sbi_ecall_replace.c
> rename to lib/sbi/sbi_ecall_rfence.c
> index 0ea00d6..8f0e3d7 100644
> --- a/lib/sbi/sbi_ecall_replace.c
> +++ b/lib/sbi/sbi_ecall_rfence.c
> @@ -9,44 +9,12 @@
>   */
>
>  #include <sbi/riscv_asm.h>
> +#include <sbi/sbi_error.h>
>  #include <sbi/sbi_ecall.h>
>  #include <sbi/sbi_ecall_interface.h>
> -#include <sbi/sbi_error.h>
> -#include <sbi/sbi_hart.h>
> -#include <sbi/sbi_ipi.h>
> -#include <sbi/sbi_system.h>
> -#include <sbi/sbi_timer.h>
> -#include <sbi/sbi_tlb.h>
>  #include <sbi/sbi_trap.h>
> +#include <sbi/sbi_tlb.h>
>
> -#ifdef CONFIG_SBI_ECALL_TIME
> -static int sbi_ecall_time_handler(unsigned long extid, unsigned long funcid,
> -                                 const struct sbi_trap_regs *regs,
> -                                 unsigned long *out_val,
> -                                 struct sbi_trap_info *out_trap)
> -{
> -       int ret = 0;
> -
> -       if (funcid == SBI_EXT_TIME_SET_TIMER) {
> -#if __riscv_xlen == 32
> -               sbi_timer_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
> -#else
> -               sbi_timer_event_start((u64)regs->a0);
> -#endif
> -       } else
> -               ret = SBI_ENOTSUPP;
> -
> -       return ret;
> -}
> -
> -struct sbi_ecall_extension ecall_time = {
> -       .extid_start = SBI_EXT_TIME,
> -       .extid_end = SBI_EXT_TIME,
> -       .handle = sbi_ecall_time_handler,
> -};
> -#endif
> -
> -#ifdef CONFIG_SBI_ECALL_RFENCE
>  static int sbi_ecall_rfence_handler(unsigned long extid, unsigned long funcid,
>                                     const struct sbi_trap_regs *regs,
>                                     unsigned long *out_val,
> @@ -116,89 +84,3 @@ struct sbi_ecall_extension ecall_rfence = {
>         .extid_end = SBI_EXT_RFENCE,
>         .handle = sbi_ecall_rfence_handler,
>  };
> -#endif
> -
> -#ifdef CONFIG_SBI_ECALL_IPI
> -static int sbi_ecall_ipi_handler(unsigned long extid, unsigned long funcid,
> -                                const struct sbi_trap_regs *regs,
> -                                unsigned long *out_val,
> -                                struct sbi_trap_info *out_trap)
> -{
> -       int ret = 0;
> -
> -       if (funcid == SBI_EXT_IPI_SEND_IPI)
> -               ret = sbi_ipi_send_smode(regs->a0, regs->a1);
> -       else
> -               ret = SBI_ENOTSUPP;
> -
> -       return ret;
> -}
> -
> -struct sbi_ecall_extension ecall_ipi = {
> -       .extid_start = SBI_EXT_IPI,
> -       .extid_end = SBI_EXT_IPI,
> -       .handle = sbi_ecall_ipi_handler,
> -};
> -#endif
> -
> -#ifdef CONFIG_SBI_ECALL_SRST
> -static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
> -                                 const struct sbi_trap_regs *regs,
> -                                 unsigned long *out_val,
> -                                 struct sbi_trap_info *out_trap)
> -{
> -       if (funcid == SBI_EXT_SRST_RESET) {
> -               if ((((u32)-1U) <= ((u64)regs->a0)) ||
> -                   (((u32)-1U) <= ((u64)regs->a1)))
> -                       return SBI_EINVAL;
> -
> -               switch (regs->a0) {
> -               case SBI_SRST_RESET_TYPE_SHUTDOWN:
> -               case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> -               case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> -                       break;
> -               default:
> -                       return SBI_EINVAL;
> -               }
> -
> -               switch (regs->a1) {
> -               case SBI_SRST_RESET_REASON_NONE:
> -               case SBI_SRST_RESET_REASON_SYSFAIL:
> -                       break;
> -               default:
> -                       return SBI_EINVAL;
> -               }
> -
> -               if (sbi_system_reset_supported(regs->a0, regs->a1))
> -                       sbi_system_reset(regs->a0, regs->a1);
> -       }
> -
> -       return SBI_ENOTSUPP;
> -}
> -
> -static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
> -{
> -       u32 type, count = 0;
> -
> -       /*
> -        * At least one standard reset types should be supported by
> -        * the platform for SBI SRST extension to be usable.
> -        */
> -
> -       for (type = 0; type <= SBI_SRST_RESET_TYPE_LAST; type++) {
> -               if (sbi_system_reset_supported(type,
> -                                       SBI_SRST_RESET_REASON_NONE))
> -                       count++;
> -       }
> -
> -       *out_val = (count) ? 1 : 0;
> -       return 0;
> -}
> -
> -struct sbi_ecall_extension ecall_srst = {
> -       .extid_start = SBI_EXT_SRST,
> -       .extid_end = SBI_EXT_SRST,
> -       .handle = sbi_ecall_srst_handler,
> -       .probe = sbi_ecall_srst_probe,
> -};
> -#endif
> diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
> new file mode 100644
> index 0000000..93b012c
> --- /dev/null
> +++ b/lib/sbi/sbi_ecall_srst.c
> @@ -0,0 +1,75 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>
> + *   Atish Patra <atish.patra@wdc.com>
> + */
> +
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_trap.h>
> +#include <sbi/sbi_system.h>
> +
> +static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
> +                                 const struct sbi_trap_regs *regs,
> +                                 unsigned long *out_val,
> +                                 struct sbi_trap_info *out_trap)
> +{
> +       if (funcid == SBI_EXT_SRST_RESET) {
> +               if ((((u32)-1U) <= ((u64)regs->a0)) ||
> +                   (((u32)-1U) <= ((u64)regs->a1)))
> +                       return SBI_EINVAL;
> +
> +               switch (regs->a0) {
> +               case SBI_SRST_RESET_TYPE_SHUTDOWN:
> +               case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> +               case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> +                       break;
> +               default:
> +                       return SBI_EINVAL;
> +               }
> +
> +               switch (regs->a1) {
> +               case SBI_SRST_RESET_REASON_NONE:
> +               case SBI_SRST_RESET_REASON_SYSFAIL:
> +                       break;
> +               default:
> +                       return SBI_EINVAL;
> +               }
> +
> +               if (sbi_system_reset_supported(regs->a0, regs->a1))
> +                       sbi_system_reset(regs->a0, regs->a1);
> +       }
> +
> +       return SBI_ENOTSUPP;
> +}
> +
> +static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
> +{
> +       u32 type, count = 0;
> +
> +       /*
> +        * At least one standard reset types should be supported by
> +        * the platform for SBI SRST extension to be usable.
> +        */
> +
> +       for (type = 0; type <= SBI_SRST_RESET_TYPE_LAST; type++) {
> +               if (sbi_system_reset_supported(type,
> +                                       SBI_SRST_RESET_REASON_NONE))
> +                       count++;
> +       }
> +
> +       *out_val = (count) ? 1 : 0;
> +       return 0;
> +}
> +
> +struct sbi_ecall_extension ecall_srst = {
> +       .extid_start = SBI_EXT_SRST,
> +       .extid_end = SBI_EXT_SRST,
> +       .handle = sbi_ecall_srst_handler,
> +       .probe = sbi_ecall_srst_probe,
> +};
> diff --git a/lib/sbi/sbi_ecall_time.c b/lib/sbi/sbi_ecall_time.c
> new file mode 100644
> index 0000000..668cb17
> --- /dev/null
> +++ b/lib/sbi/sbi_ecall_time.c
> @@ -0,0 +1,40 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>
> + *   Atish Patra <atish.patra@wdc.com>
> + */
> +
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_trap.h>
> +#include <sbi/sbi_timer.h>
> +
> +static int sbi_ecall_time_handler(unsigned long extid, unsigned long funcid,
> +                                 const struct sbi_trap_regs *regs,
> +                                 unsigned long *out_val,
> +                                 struct sbi_trap_info *out_trap)
> +{
> +       int ret = 0;
> +
> +       if (funcid == SBI_EXT_TIME_SET_TIMER) {
> +#if __riscv_xlen == 32
> +               sbi_timer_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
> +#else
> +               sbi_timer_event_start((u64)regs->a0);
> +#endif
> +       } else
> +               ret = SBI_ENOTSUPP;
> +
> +       return ret;
> +}
> +
> +struct sbi_ecall_extension ecall_time = {
> +       .extid_start = SBI_EXT_TIME,
> +       .extid_end = SBI_EXT_TIME,
> +       .handle = sbi_ecall_time_handler,
> +};
> --
> 2.38.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

