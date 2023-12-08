From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Dec 2023 22:59:54 +0530
Subject: [v2 1/2] lib: sbi_pmu: Add PMU snapshot definitions
In-Reply-To: <20231207222351.1874852-2-atishp@rivosinc.com>
References: <20231207222351.1874852-1-atishp@rivosinc.com> <20231207222351.1874852-2-atishp@rivosinc.com>
Message-ID: <CAAhSdy3kQ6AdKYYDEjKsr+ktpgWPA-mNvMLSZpM+HENJCpFqvA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 8, 2023 at 3:54?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> OpenSBI doesn't support SBI PMU snapshot yet as there is not much benefit
> unless the multiple counters overflow at the same time.
>
> Just add the definition and return not supported error at this moment. The
> default returned error is also not supported. Thus, no functional change
> intended.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_ecall_interface.h | 6 +++++-
>  include/sbi/sbi_error.h           | 1 +
>  lib/sbi/sbi_ecall_pmu.c           | 2 ++
>  lib/sbi/sbi_pmu.c                 | 6 ++++++
>  4 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index 1fe469e37078..d8c646d7b073 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -103,6 +103,7 @@
>  #define SBI_EXT_PMU_COUNTER_STOP       0x4
>  #define SBI_EXT_PMU_COUNTER_FW_READ    0x5
>  #define SBI_EXT_PMU_COUNTER_FW_READ_HI 0x6
> +#define SBI_EXT_PMU_SNAPSHOT_SET_SHMEM 0x7
>
>  /** General pmu event codes specified in SBI PMU extension */
>  enum sbi_pmu_hw_generic_events_t {
> @@ -241,9 +242,11 @@ enum sbi_pmu_ctr_type {
>
>  /* Flags defined for counter start function */
>  #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
> +#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT (1 << 1)
>
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> +#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT (1 << 1)
>
>  /* SBI function IDs for DBCN extension */
>  #define SBI_EXT_DBCN_CONSOLE_WRITE             0x0
> @@ -309,8 +312,9 @@ enum sbi_cppc_reg_id {
>  #define SBI_ERR_ALREADY_AVAILABLE              -6
>  #define SBI_ERR_ALREADY_STARTED                        -7
>  #define SBI_ERR_ALREADY_STOPPED                        -8
> +#define SBI_ERR_NO_SHMEM                       -9
>
> -#define SBI_LAST_ERR                           SBI_ERR_ALREADY_STOPPED
> +#define SBI_LAST_ERR                           SBI_ERR_NO_SHMEM
>
>  /* clang-format on */
>
> diff --git a/include/sbi/sbi_error.h b/include/sbi/sbi_error.h
> index dd65e14b6fcd..7f97506d8bd5 100644
> --- a/include/sbi/sbi_error.h
> +++ b/include/sbi/sbi_error.h
> @@ -23,6 +23,7 @@
>  #define SBI_EALREADY           SBI_ERR_ALREADY_AVAILABLE
>  #define SBI_EALREADY_STARTED   SBI_ERR_ALREADY_STARTED
>  #define SBI_EALREADY_STOPPED   SBI_ERR_ALREADY_STOPPED
> +#define SBI_ENO_SHMEM          SBI_ERR_NO_SHMEM
>
>  #define SBI_ENODEV             -1000
>  #define SBI_ENOSYS             -1001
> diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
> index 1d5d512eeed7..c58591106d09 100644
> --- a/lib/sbi/sbi_ecall_pmu.c
> +++ b/lib/sbi/sbi_ecall_pmu.c
> @@ -74,6 +74,8 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
>         case SBI_EXT_PMU_COUNTER_STOP:
>                 ret = sbi_pmu_ctr_stop(regs->a0, regs->a1, regs->a2);
>                 break;
> +       case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
> +               /* fallthrough as OpenSBI doesn't support snapshot yet */
>         default:
>                 ret = SBI_ENOTSUPP;
>         }
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 185068bb1f43..1ac8562a9c99 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -442,6 +442,9 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>         if ((cbase + sbi_fls(cmask)) >= total_ctrs)
>                 return ret;
>
> +       if (flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
> +               return SBI_ENO_SHMEM;
> +
>         if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
>                 bUpdate = true;
>
> @@ -540,6 +543,9 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
>         if ((cbase + sbi_fls(cmask)) >= total_ctrs)
>                 return SBI_EINVAL;
>
> +       if (flag & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
> +               return SBI_ENO_SHMEM;
> +
>         for_each_set_bit(i, &cmask, BITS_PER_LONG) {
>                 cidx = i + cbase;
>                 event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
> --
> 2.34.1
>

