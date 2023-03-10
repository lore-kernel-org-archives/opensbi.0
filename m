From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Mar 2023 14:25:14 +0530
Subject: [PATCH v4 2/8] lib: sbi_pmu: Implement sbi_pmu_counter_fw_read_hi
In-Reply-To: <20230309131358.2259923-3-mchitale@ventanamicro.com>
References: <20230309131358.2259923-1-mchitale@ventanamicro.com> <20230309131358.2259923-3-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy1QyY4n=FKp2sYU0NjfZf7PCSoA76DJ+oSOzUCueGPoMA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 9, 2023 at 6:44?PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> To support 64 bit firmware counters on RV32 systems, we implement
> sbi_pmu_counter_fw_read_hi() which returns the upper 32 bits of
> the firmware counter value. On RV64 (or higher) systems, this
> function will always return zero.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_ecall_interface.h | 1 +
>  lib/sbi/sbi_ecall_pmu.c           | 8 ++++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index 4c378c3..d448212 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -101,6 +101,7 @@
>  #define SBI_EXT_PMU_COUNTER_START      0x3
>  #define SBI_EXT_PMU_COUNTER_STOP       0x4
>  #define SBI_EXT_PMU_COUNTER_FW_READ    0x5
> +#define SBI_EXT_PMU_COUNTER_FW_READ_HI 0x6
>
>  /** General pmu event codes specified in SBI PMU extension */
>  enum sbi_pmu_hw_generic_events_t {
> diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
> index 826c8a8..2d1e669 100644
> --- a/lib/sbi/sbi_ecall_pmu.c
> +++ b/lib/sbi/sbi_ecall_pmu.c
> @@ -54,6 +54,14 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
>                 ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
>                 *out_val = temp;
>                 break;
> +       case SBI_EXT_PMU_COUNTER_FW_READ_HI:
> +#if __riscv_xlen == 32
> +               ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
> +               *out_val = temp >> 32
> +#else
> +               *out_val = 0;
> +#endif
> +               break;
>         case SBI_EXT_PMU_COUNTER_START:
>
>  #if __riscv_xlen == 32
> --
> 2.34.1
>

