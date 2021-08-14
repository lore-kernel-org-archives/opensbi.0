From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Aug 2021 09:14:17 +0530
Subject: [PATCH v2 1/5] lib: utils/timer: Allow separate base addresses
 for MTIME and MTIMECMP
In-Reply-To: <20210807133322.545675-2-anup.patel@wdc.com>
References: <20210807133322.545675-1-anup.patel@wdc.com>
 <20210807133322.545675-2-anup.patel@wdc.com>
Message-ID: <CAAhSdy1M65Q=jXEYiZz3Mf4bSJ1q+FrpdrnwN5YzwmvAeZi0SQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 7, 2021 at 7:04 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We extend the ACLINT library to support separate base addresses
> for MTIME and MTIMECMP registers.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  include/sbi_utils/timer/aclint_mtimer.h | 16 +++--
>  lib/utils/timer/aclint_mtimer.c         | 78 +++++++++++++++++++------
>  lib/utils/timer/fdt_timer_mtimer.c      | 16 +++--
>  platform/fpga/ariane/platform.c         |  8 ++-
>  platform/fpga/openpiton/platform.c      | 13 ++++-
>  platform/kendryte/k210/platform.c       |  8 ++-
>  platform/nuclei/ux600/platform.c        |  8 ++-
>  platform/template/platform.c            |  8 ++-
>  8 files changed, 114 insertions(+), 41 deletions(-)
>
> diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
> index 62aa086..fdc46cd 100644
> --- a/include/sbi_utils/timer/aclint_mtimer.h
> +++ b/include/sbi_utils/timer/aclint_mtimer.h
> @@ -12,16 +12,22 @@
>
>  #include <sbi/sbi_types.h>
>
> -#define ACLINT_MTIMER_ALIGN            0x1000
> -#define ACLINT_MTIMER_SIZE             0x8000
> -#define ACLINT_MTIMER_MAX_HARTS        4095
> +#define ACLINT_MTIMER_ALIGN            0x8
> +#define ACLINT_MTIMER_MAX_HARTS                4095
> +
> +#define ACLINT_DEFAULT_MTIME_OFFSET    0x7ff8
> +#define ACLINT_DEFAULT_MTIME_SIZE      0x8
> +#define ACLINT_DEFAULT_MTIMECMP_OFFSET 0x0000
> +#define ACLINT_DEFAULT_MTIMECMP_SIZE   0x7ff8
>
>  #define CLINT_MTIMER_OFFSET            0x4000
>
>  struct aclint_mtimer_data {
>         /* Public details */
> -       unsigned long addr;
> -       unsigned long size;
> +       unsigned long mtime_addr;
> +       unsigned long mtime_size;
> +       unsigned long mtimecmp_addr;
> +       unsigned long mtimecmp_size;
>         u32 first_hartid;
>         u32 hart_count;
>         bool has_64bit_mmio;
> diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> index 41b0290..0e4e846 100644
> --- a/lib/utils/timer/aclint_mtimer.c
> +++ b/lib/utils/timer/aclint_mtimer.c
> @@ -10,6 +10,7 @@
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_atomic.h>
>  #include <sbi/riscv_io.h>
> +#include <sbi/sbi_bitops.h>
>  #include <sbi/sbi_domain.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hartmask.h>
> @@ -17,9 +18,6 @@
>  #include <sbi/sbi_timer.h>
>  #include <sbi_utils/timer/aclint_mtimer.h>
>
> -#define MTIMER_CMP_OFF         0x0000
> -#define MTIMER_VAL_OFF         0x7ff8
> -
>  static struct aclint_mtimer_data *mtimer_hartid2data[SBI_HARTMASK_MAX_BITS];
>
>  #if __riscv_xlen != 32
> @@ -56,7 +54,7 @@ static void mtimer_time_wr32(bool timecmp, u64 value, volatile u64 *addr)
>  static u64 mtimer_value(void)
>  {
>         struct aclint_mtimer_data *mt = mtimer_hartid2data[current_hartid()];
> -       u64 *time_val = ((void *)mt->addr) + MTIMER_VAL_OFF;
> +       u64 *time_val = (void *)mt->mtime_addr;
>
>         /* Read MTIMER Time Value */
>         return mt->time_rd(time_val) + mt->time_delta;
> @@ -66,7 +64,7 @@ static void mtimer_event_stop(void)
>  {
>         u32 target_hart = current_hartid();
>         struct aclint_mtimer_data *mt = mtimer_hartid2data[target_hart];
> -       u64 *time_cmp = (void *)mt->addr + MTIMER_CMP_OFF;
> +       u64 *time_cmp = (void *)mt->mtimecmp_addr;
>
>         /* Clear MTIMER Time Compare */
>         mt->time_wr(true, -1ULL, &time_cmp[target_hart - mt->first_hartid]);
> @@ -76,7 +74,7 @@ static void mtimer_event_start(u64 next_event)
>  {
>         u32 target_hart = current_hartid();
>         struct aclint_mtimer_data *mt = mtimer_hartid2data[target_hart];
> -       u64 *time_cmp = (void *)mt->addr + MTIMER_CMP_OFF;
> +       u64 *time_cmp = (void *)mt->mtimecmp_addr;
>
>         /* Program MTIMER Time Compare */
>         mt->time_wr(true, next_event - mt->time_delta,
> @@ -111,8 +109,8 @@ int aclint_mtimer_warm_init(void)
>          */
>         if (mt->time_delta_reference) {
>                 reference = mt->time_delta_reference;
> -               mt_time_val = (void *)mt->addr + MTIMER_VAL_OFF;
> -               ref_time_val = (void *)reference->addr + MTIMER_VAL_OFF;
> +               mt_time_val = (void *)mt->mtime_addr;
> +               ref_time_val = (void *)reference->mtime_addr;
>                 if (!atomic_raw_xchg_ulong(&mt->time_delta_computed, 1)) {
>                         v1 = mt->time_rd(mt_time_val);
>                         mv = reference->time_rd(ref_time_val);
> @@ -122,24 +120,54 @@ int aclint_mtimer_warm_init(void)
>         }
>
>         /* Clear Time Compare */
> -       mt_time_cmp = (void *)mt->addr + MTIMER_CMP_OFF;
> +       mt_time_cmp = (void *)mt->mtimecmp_addr;
>         mt->time_wr(true, -1ULL,
>                     &mt_time_cmp[target_hart - mt->first_hartid]);
>
>         return 0;
>  }
>
> +static int aclint_mtimer_add_regions(unsigned long addr, unsigned long size)
> +{
> +#define MTIMER_ADD_REGION_ALIGN                0x1000
> +       int rc;
> +       unsigned long pos, end, rsize;
> +       struct sbi_domain_memregion reg;
> +
> +       pos = addr;
> +       end = addr + size;
> +       while (pos < end) {
> +               rsize = pos & (MTIMER_ADD_REGION_ALIGN - 1);
> +               if (rsize)
> +                       rsize = 1UL << __ffs(pos);
> +               else
> +                       rsize = ((end - pos) < MTIMER_ADD_REGION_ALIGN) ?
> +                               (end - pos) : MTIMER_ADD_REGION_ALIGN;
> +
> +               sbi_domain_memregion_init(pos, rsize,
> +                                         SBI_DOMAIN_MEMREGION_MMIO, &reg);
> +               rc = sbi_domain_root_add_memregion(&reg);
> +               if (rc)
> +                       return rc;
> +               pos += rsize;
> +       }
> +
> +       return 0;
> +}
> +
>  int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
>                             struct aclint_mtimer_data *reference)
>  {
>         u32 i;
>         int rc;
> -       unsigned long pos, region_size;
> -       struct sbi_domain_memregion reg;
>
>         /* Sanity checks */
> -       if (!mt || (mt->addr & (ACLINT_MTIMER_ALIGN - 1)) ||
> -           (mt->size < ACLINT_MTIMER_SIZE) ||
> +       if (!mt || !mt->mtime_size ||
> +           (mt->hart_count && !mt->mtimecmp_size) ||
> +           (mt->mtime_addr & (ACLINT_MTIMER_ALIGN - 1)) ||
> +           (mt->mtime_size & (ACLINT_MTIMER_ALIGN - 1)) ||
> +           (mt->mtimecmp_addr & (ACLINT_MTIMER_ALIGN - 1)) ||
> +           (mt->mtimecmp_size & (ACLINT_MTIMER_ALIGN - 1)) ||
>             (mt->first_hartid >= SBI_HARTMASK_MAX_BITS) ||
>             (mt->hart_count > ACLINT_MTIMER_MAX_HARTS))
>                 return SBI_EINVAL;
> @@ -164,12 +192,24 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
>                 mtimer_hartid2data[mt->first_hartid + i] = mt;
>
>         /* Add MTIMER regions to the root domain */
> -       for (pos = 0; pos < mt->size; pos += ACLINT_MTIMER_ALIGN) {
> -               region_size = ((mt->size - pos) < ACLINT_MTIMER_ALIGN) ?
> -                             (mt->size - pos) : ACLINT_MTIMER_ALIGN;
> -               sbi_domain_memregion_init(mt->addr + pos, region_size,
> -                                         SBI_DOMAIN_MEMREGION_MMIO, &reg);
> -               rc = sbi_domain_root_add_memregion(&reg);
> +       if (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
> +               rc = aclint_mtimer_add_regions(mt->mtimecmp_addr,
> +                                       mt->mtime_size + mt->mtimecmp_size);
> +               if (rc)
> +                       return rc;
> +       } else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
> +               rc = aclint_mtimer_add_regions(mt->mtime_addr,
> +                                       mt->mtime_size + mt->mtimecmp_size);
> +               if (rc)
> +                       return rc;
> +       } else {
> +               rc = aclint_mtimer_add_regions(mt->mtime_addr,
> +                                               mt->mtime_size);
> +               if (rc)
> +                       return rc;
> +
> +               rc = aclint_mtimer_add_regions(mt->mtimecmp_addr,
> +                                               mt->mtimecmp_size);
>                 if (rc)
>                         return rc;
>         }
> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> index 4907428..3f830ad 100644
> --- a/lib/utils/timer/fdt_timer_mtimer.c
> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> @@ -22,7 +22,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>                                   const struct fdt_match *match)
>  {
>         int rc;
> -       unsigned long offset;
> +       unsigned long offset, addr, size;
>         struct aclint_mtimer_data *mt, *mtmaster = NULL;
>
>         if (MTIMER_MAX_NR <= mtimer_count)
> @@ -31,19 +31,23 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>         if (0 < mtimer_count)
>                 mtmaster = &mtimer[0];
>
> -       rc = fdt_parse_aclint_node(fdt, nodeoff, true, &mt->addr, &mt->size,
> +       rc = fdt_parse_aclint_node(fdt, nodeoff, true, &addr, &size,
>                                    &mt->first_hartid, &mt->hart_count);
>         if (rc)
>                 return rc;
>         mt->has_64bit_mmio = true;
>
> +       mt->mtimecmp_addr = addr + ACLINT_DEFAULT_MTIMECMP_OFFSET;
> +       mt->mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE;
> +       mt->mtime_addr = addr + ACLINT_DEFAULT_MTIME_OFFSET;
> +       mt->mtime_size = size - mt->mtimecmp_size;
> +
>         if (match->data) {
>                 /* Adjust MTIMER address and size for CLINT device */
>                 offset = *((unsigned long *)match->data);
> -               mt->addr += offset;
> -               if ((mt->size - offset) < ACLINT_MTIMER_SIZE)
> -                       return SBI_EINVAL;
> -               mt->size -= offset;
> +               mt->mtime_addr += offset;
> +               mt->mtimecmp_addr += offset;
> +               mt->mtime_size -= offset;
>                 /* Parse additional CLINT properties */
>                 if (fdt_getprop(fdt, nodeoff, "clint,has-no-64bit-mmio", &rc))
>                         mt->has_64bit_mmio = false;
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index 0b47aa0..58a46c0 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -44,8 +44,12 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> -       .addr = ARIANE_ACLINT_MTIMER_ADDR,
> -       .size = ACLINT_MTIMER_SIZE,
> +       .mtime_addr = ARIANE_ACLINT_MTIMER_ADDR +
> +                     ACLINT_DEFAULT_MTIME_OFFSET,
> +       .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> +       .mtimecmp_addr = ARIANE_ACLINT_MTIMER_ADDR +
> +                        ACLINT_DEFAULT_MTIMECMP_OFFSET,
> +       .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
>         .first_hartid = 0,
>         .hart_count = ARIANE_HART_COUNT,
>         .has_64bit_mmio = TRUE,
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index 6939b57..a9bfa99 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -49,8 +49,12 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> -       .addr = OPENPITON_DEFAULT_ACLINT_MTIMER_ADDR,
> -       .size = ACLINT_MTIMER_SIZE,
> +       .mtime_addr = OPENPITON_DEFAULT_ACLINT_MTIMER_ADDR +
> +                     ACLINT_DEFAULT_MTIME_OFFSET,
> +       .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> +       .mtimecmp_addr = OPENPITON_DEFAULT_ACLINT_MTIMER_ADDR +
> +                        ACLINT_DEFAULT_MTIMECMP_OFFSET,
> +       .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
>         .first_hartid = 0,
>         .hart_count = OPENPITON_DEFAULT_HART_COUNT,
>         .has_64bit_mmio = TRUE,
> @@ -82,7 +86,10 @@ static int openpiton_early_init(bool cold_boot)
>         rc = fdt_parse_compat_addr(fdt, &clint_addr, "riscv,clint0");
>         if (!rc) {
>                 mswi.addr = clint_addr;
> -               mtimer.addr = clint_addr + CLINT_MTIMER_OFFSET;
> +               mtimer.mtime_addr = clint_addr + CLINT_MTIMER_OFFSET +
> +                                   ACLINT_DEFAULT_MTIME_OFFSET;
> +               mtimer.mtimecmp_addr = clint_addr + CLINT_MTIMER_OFFSET +
> +                                   ACLINT_DEFAULT_MTIMECMP_OFFSET;
>         }
>
>         return 0;
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index 55c4b1e..ee4c223 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -42,8 +42,12 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> -       .addr = K210_ACLINT_MTIMER_ADDR,
> -       .size = ACLINT_MTIMER_SIZE,
> +       .mtime_addr = K210_ACLINT_MTIMER_ADDR +
> +                     ACLINT_DEFAULT_MTIME_OFFSET,
> +       .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> +       .mtimecmp_addr = K210_ACLINT_MTIMER_ADDR +
> +                        ACLINT_DEFAULT_MTIMECMP_OFFSET,
> +       .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
>         .first_hartid = 0,
>         .hart_count = K210_HART_COUNT,
>         .has_64bit_mmio = TRUE,
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index 22ca4c9..ab0becc 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -74,8 +74,12 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> -       .addr = UX600_ACLINT_MTIMER_ADDR,
> -       .size = ACLINT_MTIMER_SIZE,
> +       .mtime_addr = UX600_ACLINT_MTIMER_ADDR +
> +                     ACLINT_DEFAULT_MTIME_OFFSET,
> +       .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> +       .mtimecmp_addr = UX600_ACLINT_MTIMER_ADDR +
> +                        ACLINT_DEFAULT_MTIMECMP_OFFSET,
> +       .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
>         .first_hartid = 0,
>         .hart_count = UX600_HART_COUNT,
>         .has_64bit_mmio = TRUE,
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index 3f09d98..4528822 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -43,8 +43,12 @@ static struct aclint_mswi_data mswi = {
>  };
>
>  static struct aclint_mtimer_data mtimer = {
> -       .addr = PLATFORM_ACLINT_MTIMER_ADDR,
> -       .size = ACLINT_MTIMER_SIZE,
> +       .mtime_addr = PLATFORM_ACLINT_MTIMER_ADDR +
> +                     ACLINT_DEFAULT_MTIME_OFFSET,
> +       .mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> +       .mtimecmp_addr = PLATFORM_ACLINT_MTIMER_ADDR +
> +                        ACLINT_DEFAULT_MTIMECMP_OFFSET,
> +       .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
>         .first_hartid = 0,
>         .hart_count = PLATFORM_HART_COUNT,
>         .has_64bit_mmio = TRUE,
> --
> 2.25.1
>

