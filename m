From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 Jan 2024 16:42:28 +0530
Subject: [RFC PATCH v2 4/4] lib: sbi: add SBI_EXT_PMU_IRQ_CLEAR
In-Reply-To: <20240109104500.2080121-5-cleger@rivosinc.com>
References: <20240109104500.2080121-1-cleger@rivosinc.com> <20240109104500.2080121-5-cleger@rivosinc.com>
Message-ID: <CAAhSdy3fm_3rsGhk=-UFFNxGwdz++fkfbRfMBCeoG37-Dc6BmQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 9, 2024 at 4:15?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> Now that we have sse support for such interrupt, the IRQ can only be
> cleared by the SBI. In some cases in S-mode OS, it might be needed to
> clear the pending IRQ. Add SBI_EXT_PMU_IRQ_CLEAR ecall to clear such
> IRQ.
>
> NOTE: this is temporary until the counter delegation support from Atish
> lands in Linux/OpenSBI.

Why not clear the PMU IRQ when supervisor software completes the
PMU SSE event ?

Regards,
Anup

>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  include/sbi/sbi_ecall_interface.h | 1 +
>  include/sbi/sbi_pmu.h             | 2 ++
>  lib/sbi/sbi_ecall_pmu.c           | 3 +++
>  3 files changed, 6 insertions(+)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index a5f3edf..3815b42 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -105,6 +105,7 @@
>  #define SBI_EXT_PMU_COUNTER_FW_READ    0x5
>  #define SBI_EXT_PMU_COUNTER_FW_READ_HI 0x6
>  #define SBI_EXT_PMU_SNAPSHOT_SET_SHMEM 0x7
> +#define SBI_EXT_PMU_IRQ_CLEAR          0x8
>
>  /** General pmu event codes specified in SBI PMU extension */
>  enum sbi_pmu_hw_generic_events_t {
> diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> index c5b4e51..6bed6c9 100644
> --- a/include/sbi/sbi_pmu.h
> +++ b/include/sbi/sbi_pmu.h
> @@ -153,4 +153,6 @@ int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id);
>
>  void sbi_pmu_ovf_irq(struct sbi_trap_regs *regs);
>
> +void sbi_pmu_irq_clear(void);
> +
>  #endif
> diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
> index 40a63a6..5b55eb5 100644
> --- a/lib/sbi/sbi_ecall_pmu.c
> +++ b/lib/sbi/sbi_ecall_pmu.c
> @@ -73,6 +73,9 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
>         case SBI_EXT_PMU_COUNTER_STOP:
>                 ret = sbi_pmu_ctr_stop(regs->a0, regs->a1, regs->a2);
>                 break;
> +       case SBI_EXT_PMU_IRQ_CLEAR:
> +               sbi_pmu_irq_clear();
> +               break;
>         case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
>                 /* fallthrough as OpenSBI doesn't support snapshot yet */
>         default:
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

