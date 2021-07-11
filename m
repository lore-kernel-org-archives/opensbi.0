From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 10:58:55 +0530
Subject: [PATCH v5 12/15] lib: sbi: Implement SBI PMU extension
In-Reply-To: <20210710161816.632364-13-atish.patra@wdc.com>
References: <20210710161816.632364-1-atish.patra@wdc.com>
 <20210710161816.632364-13-atish.patra@wdc.com>
Message-ID: <CAAhSdy3-_TneRU27h54OZC3b4d_9LwnnASNJFLSGYuDVQm8F+Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 9:48 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> RISC-V SBI specfication 0.3 defines a PMU extension that allows supervisor
> mode to start/stop/configure pmu related events. This patch implements
> all of the functionality defined in the specification.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_ecall.h |  1 +
>  lib/sbi/objects.mk      |  1 +
>  lib/sbi/sbi_ecall.c     |  3 ++
>  lib/sbi/sbi_ecall_pmu.c | 93 +++++++++++++++++++++++++++++++++++++++++
>  lib/sbi/sbi_pmu.c       |  2 +-
>  5 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100644 lib/sbi/sbi_ecall_pmu.c
>
> diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
> index 63ef866ba2d4..9500d0430429 100644
> --- a/include/sbi/sbi_ecall.h
> +++ b/include/sbi/sbi_ecall.h
> @@ -39,6 +39,7 @@ extern struct sbi_ecall_extension ecall_ipi;
>  extern struct sbi_ecall_extension ecall_vendor;
>  extern struct sbi_ecall_extension ecall_hsm;
>  extern struct sbi_ecall_extension ecall_srst;
> +extern struct sbi_ecall_extension ecall_pmu;
>
>  u16 sbi_ecall_version_major(void);
>
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index d9068b707854..7096f245ae0c 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -20,6 +20,7 @@ libsbi-objs-y += sbi_ecall.o
>  libsbi-objs-y += sbi_ecall_base.o
>  libsbi-objs-y += sbi_ecall_hsm.o
>  libsbi-objs-y += sbi_ecall_legacy.o
> +libsbi-objs-y += sbi_ecall_pmu.o
>  libsbi-objs-y += sbi_ecall_replace.o
>  libsbi-objs-y += sbi_ecall_vendor.o
>  libsbi-objs-y += sbi_emulate_csr.o
> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> index e92a53930460..ce021eba7d91 100644
> --- a/lib/sbi/sbi_ecall.c
> +++ b/lib/sbi/sbi_ecall.c
> @@ -162,6 +162,9 @@ int sbi_ecall_init(void)
>         if (ret)
>                 return ret;
>         ret = sbi_ecall_register_extension(&ecall_srst);
> +       if (ret)
> +               return ret;
> +       ret = sbi_ecall_register_extension(&ecall_pmu);
>         if (ret)
>                 return ret;
>         ret = sbi_ecall_register_extension(&ecall_legacy);
> diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
> new file mode 100644
> index 000000000000..39d3857680c1
> --- /dev/null
> +++ b/lib/sbi/sbi_ecall_pmu.c
> @@ -0,0 +1,93 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Atish Patra <atish.patra@wdc.com>
> + */
> +
> +#include <sbi/sbi_ecall.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_hart.h>
> +#include <sbi/sbi_trap.h>
> +#include <sbi/sbi_version.h>
> +#include <sbi/sbi_pmu.h>
> +#include <sbi/sbi_scratch.h>
> +#include <sbi/riscv_asm.h>
> +
> +static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
> +                                const struct sbi_trap_regs *regs,
> +                                unsigned long *out_val,
> +                                struct sbi_trap_info *out_trap)
> +{
> +       int ret = 0;
> +       uint64_t temp;
> +
> +       switch (funcid) {
> +       case SBI_EXT_PMU_NUM_COUNTERS:
> +               ret = sbi_pmu_num_ctr();
> +               if (ret >= 0) {
> +                       *out_val = ret;
> +                       ret = 0;
> +               }
> +               break;
> +       case SBI_EXT_PMU_COUNTER_GET_INFO:
> +               ret = sbi_pmu_ctr_get_info(regs->a0, out_val);
> +               break;
> +       case SBI_EXT_PMU_COUNTER_CFG_MATCH:
> +#if __riscv_xlen == 32
> +               temp = ((uint64_t)regs->a5 << 32) | regs->a4;
> +#else
> +               temp = regs->a4;
> +#endif
> +               ret = sbi_pmu_ctr_cfg_match(regs->a0, regs->a1, regs->a2,
> +                                           regs->a3, temp);
> +               if (ret >= 0) {
> +                       *out_val = ret;
> +                       ret = 0;
> +               }
> +
> +               break;
> +       case SBI_EXT_PMU_COUNTER_FW_READ:
> +               ret = sbi_pmu_ctr_read(regs->a0, out_val);
> +               break;
> +       case SBI_EXT_PMU_COUNTER_START:
> +
> +#if __riscv_xlen == 32
> +               temp = ((uint64_t)regs->a4 << 32) | regs->a3;
> +#else
> +               temp = regs->a3;
> +#endif
> +               ret = sbi_pmu_ctr_start(regs->a0, regs->a1, regs->a2, temp);
> +               break;
> +       case SBI_EXT_PMU_COUNTER_STOP:
> +               ret = sbi_pmu_ctr_stop(regs->a0, regs->a1, regs->a2);
> +               break;
> +       default:
> +               ret = SBI_ENOTSUPP;
> +       };
> +
> +       return ret;
> +}
> +
> +static int sbi_ecall_pmu_probe(unsigned long extid, unsigned long *out_val)
> +{
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
> +       /* SBI PMU extension is useless without mcount inhibit features */
> +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
> +               *out_val = 1;
> +       else
> +               *out_val = 0;
> +
> +       return 0;
> +}
> +
> +struct sbi_ecall_extension ecall_pmu = {
> +       .extid_start = SBI_EXT_PMU,
> +       .extid_end = SBI_EXT_PMU,
> +       .handle = sbi_ecall_pmu_handler,
> +       .probe = sbi_ecall_pmu_probe,
> +};
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index d01e248fb47a..4092e6fa00cf 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -375,7 +375,7 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
>         if (!mhpmevent_val || ctr_idx < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX)
>                 return SBI_EFAIL;
>
> -       /* TODO: The upper 8 bits of mhpmevent is reserved by sscofpmf extension.
> +       /* TODO: The upper 16 bits of mhpmevent is reserved by sscofpmf extension.
>          * Update those bits based on the flags received from supervisor.
>          * The OVF bit also should be cleared here in case it was not cleared
>          * during event stop.
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

