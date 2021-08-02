From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 2 Aug 2021 12:44:48 -0700
Subject: [PATCH 3/5] lib: utils/fdt: Extend fdt_parse_aclint_node()
 function
In-Reply-To: <20210724122503.2486624-4-anup.patel@wdc.com>
References: <20210724122503.2486624-1-anup.patel@wdc.com>
 <20210724122503.2486624-4-anup.patel@wdc.com>
Message-ID: <CAOnJCU+wmGBOsTjoKS8mpBX9mznMg+g5rze8L2=KBkPgqwZPfw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 24, 2021 at 5:25 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The fdt_parse_aclint_node() is used to parse DT node for SiFive
> CLINT, ACLINT MTIMER, and ACLINT MSWI devices.
>
> The ACLINT MTIMER has undergone following changes:
> 1) MTIMER DT node now requires separate addresses in for MTIME
>    register and MTIMECMPx registers in the reg DT property.
> 2) MTIMER DT node might have no interrupts-extended DT property
>    when the MTIMER device has no associated HARTs (i.e. the
>    MTIMER device has no MTIMECMPx registers)
>
> This patch extends fdt_parse_aclint_node() to handle above
> mentioned changes in ACLINT MTIMER DT bindings.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi_utils/fdt/fdt_helper.h |  3 +-
>  lib/utils/fdt/fdt_helper.c         | 50 ++++++++++++++++++------------
>  lib/utils/ipi/fdt_ipi_mswi.c       |  3 +-
>  lib/utils/timer/fdt_timer_mtimer.c | 23 +++++++++-----
>  4 files changed, 49 insertions(+), 30 deletions(-)
>
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 0445e36..d49b123 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -73,7 +73,8 @@ int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic);
>  int fdt_parse_plic(void *fdt, struct plic_data *plic, const char *compat);
>
>  int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
> -                         unsigned long *out_addr, unsigned long *out_size,
> +                         unsigned long *out_addr1, unsigned long *out_size1,
> +                         unsigned long *out_addr2, unsigned long *out_size2,
>                           u32 *out_first_hartid, u32 *out_hart_count);
>
>  int fdt_parse_compat_addr(void *fdt, unsigned long *addr,
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index a992911..12e694c 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -482,38 +482,50 @@ int fdt_parse_plic(void *fdt, struct plic_data *plic, const char *compat)
>  }
>
>  int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
> -                         unsigned long *out_addr, unsigned long *out_size,
> +                         unsigned long *out_addr1, unsigned long *out_size1,
> +                         unsigned long *out_addr2, unsigned long *out_size2,
>                           u32 *out_first_hartid, u32 *out_hart_count)
>  {
>         const fdt32_t *val;
>         unsigned long reg_addr, reg_size;
>         int i, rc, count, cpu_offset, cpu_intc_offset;
> -       u32 phandle, hwirq, hartid, first_hartid, last_hartid;
> +       u32 phandle, hwirq, hartid, first_hartid, last_hartid, hart_count;
>         u32 match_hwirq = (for_timer) ? IRQ_M_TIMER : IRQ_M_SOFT;
>
>         if (nodeoffset < 0 || !fdt ||
> -           !out_addr || !out_size ||
> +           !out_addr1 || !out_size1 ||
>             !out_first_hartid || !out_hart_count)
>                 return SBI_EINVAL;
>
>         rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
>                                     &reg_addr, &reg_size);
> -       if (rc < 0 || !reg_addr || !reg_size)
> +       if (rc < 0 || !reg_size)
>                 return SBI_ENODEV;
> -       *out_addr = reg_addr;
> -       *out_size = reg_size;
> +       *out_addr1 = reg_addr;
> +       *out_size1 = reg_size;
> +
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 1,
> +                                   &reg_addr, &reg_size);
> +       if (rc < 0 || !reg_size)
> +               reg_addr = reg_size = 0;
> +       if (out_addr2)
> +               *out_addr2 = reg_addr;
> +       if (out_size2)
> +               *out_size2 = reg_size;
> +
> +       *out_first_hartid = 0;
> +       *out_hart_count = 0;
>
>         val = fdt_getprop(fdt, nodeoffset, "interrupts-extended", &count);
>         if (!val || count < sizeof(fdt32_t))
> -               return SBI_ENODEV;
> +               return 0;
>         count = count / sizeof(fdt32_t);
>
>         first_hartid = -1U;
> -       last_hartid = 0;
> -       *out_hart_count = 0;
> -       for (i = 0; i < count; i += 2) {
> -               phandle = fdt32_to_cpu(val[i]);
> -               hwirq = fdt32_to_cpu(val[i + 1]);
> +       hart_count = last_hartid = 0;
> +       for (i = 0; i < (count / 2); i++) {
> +               phandle = fdt32_to_cpu(val[2 * i]);
> +               hwirq = fdt32_to_cpu(val[(2 * i) + 1]);
>
>                 cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
>                 if (cpu_intc_offset < 0)
> @@ -535,17 +547,15 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
>                                 first_hartid = hartid;
>                         if (hartid > last_hartid)
>                                 last_hartid = hartid;
> -                       (*out_hart_count)++;
> +                       hart_count++;
>                 }
>         }
>
> -       if ((last_hartid < first_hartid) || first_hartid == -1U)
> -               return SBI_ENODEV;
> -
> -       *out_first_hartid = first_hartid;
> -       count = last_hartid - first_hartid + 1;
> -       if (*out_hart_count < count)
> -               *out_hart_count = count;
> +       if ((last_hartid >= first_hartid) && first_hartid != -1U) {
> +               *out_first_hartid = first_hartid;
> +               count = last_hartid - first_hartid + 1;
> +               *out_hart_count = (hart_count < count) ? hart_count : count;
> +       }
>
>         return 0;
>  }
> diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
> index f119f9c..1f0fda7 100644
> --- a/lib/utils/ipi/fdt_ipi_mswi.c
> +++ b/lib/utils/ipi/fdt_ipi_mswi.c
> @@ -28,7 +28,8 @@ static int ipi_mswi_cold_init(void *fdt, int nodeoff,
>                 return SBI_ENOSPC;
>         ms = &mswi[mswi_count];
>
> -       rc = fdt_parse_aclint_node(fdt, nodeoff, false, &ms->addr, &ms->size,
> +       rc = fdt_parse_aclint_node(fdt, nodeoff, false,
> +                                  &ms->addr, &ms->size, NULL, NULL,
>                                    &ms->first_hartid, &ms->hart_count);
>         if (rc)
>                 return rc;
> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> index 3f830ad..b08ed38 100644
> --- a/lib/utils/timer/fdt_timer_mtimer.c
> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> @@ -22,7 +22,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>                                   const struct fdt_match *match)
>  {
>         int rc;
> -       unsigned long offset, addr, size;
> +       unsigned long offset, addr[2], size[2];
>         struct aclint_mtimer_data *mt, *mtmaster = NULL;
>
>         if (MTIMER_MAX_NR <= mtimer_count)
> @@ -31,18 +31,19 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>         if (0 < mtimer_count)
>                 mtmaster = &mtimer[0];
>
> -       rc = fdt_parse_aclint_node(fdt, nodeoff, true, &addr, &size,
> +       rc = fdt_parse_aclint_node(fdt, nodeoff, true,
> +                                  &addr[0], &size[0], &addr[1], &size[1],
>                                    &mt->first_hartid, &mt->hart_count);
>         if (rc)
>                 return rc;
>         mt->has_64bit_mmio = true;
>
> -       mt->mtimecmp_addr = addr + ACLINT_DEFAULT_MTIMECMP_OFFSET;
> -       mt->mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE;
> -       mt->mtime_addr = addr + ACLINT_DEFAULT_MTIME_OFFSET;
> -       mt->mtime_size = size - mt->mtimecmp_size;
> -
> -       if (match->data) {
> +       if (match->data) { /* SiFive CLINT */
> +               /* Set CLINT addresses */
> +               mt->mtimecmp_addr = addr[0] + ACLINT_DEFAULT_MTIMECMP_OFFSET;
> +               mt->mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE;
> +               mt->mtime_addr = addr[0] + ACLINT_DEFAULT_MTIME_OFFSET;
> +               mt->mtime_size = size[0] - mt->mtimecmp_size;
>                 /* Adjust MTIMER address and size for CLINT device */
>                 offset = *((unsigned long *)match->data);
>                 mt->mtime_addr += offset;
> @@ -51,6 +52,12 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>                 /* Parse additional CLINT properties */
>                 if (fdt_getprop(fdt, nodeoff, "clint,has-no-64bit-mmio", &rc))
>                         mt->has_64bit_mmio = false;
> +       } else { /* RISC-V ACLINT MTIMER */
> +               /* Set ACLINT MTIMER addresses */
> +               mt->mtime_addr = addr[0];
> +               mt->mtime_size = size[0];
> +               mt->mtimecmp_addr = addr[1];
> +               mt->mtimecmp_size = size[1];
>         }
>
>         rc = aclint_mtimer_cold_init(mt, mtmaster);
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

