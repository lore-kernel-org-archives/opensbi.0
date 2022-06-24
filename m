From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 24 Jun 2022 09:45:12 -0700
Subject: [PATCH v3 1/1] lib: pmu: allow to use the highest available counter
In-Reply-To: <20220624110330.452640-1-geomatsi@gmail.com>
References: <20220624110330.452640-1-geomatsi@gmail.com>
Message-ID: <CAOnJCUKYZc1T8AOd-KzSU92bqGE3+RDHzrk6K8d3-bedUrJojw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 24, 2022 at 4:04 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> OpenSBI explicitly assumes that there is no pmu hardware counter with
> index 1: hardware uses that bit for TM control. So OpenSBI filters
> out that index in sanity checks. However OpenSBI also excludes that
> counter when reports total amount of hardware counters to Linux. As
> a result, Linux uses incomplete counters mask excluding the highest
> available counter.
>
> Return accurate number of counters, update the firmware counter
> starting index, fix range checks that include num_hw_ctrs.
>
> The simple test is to make sure that there is no counter multiplexing
> in the following command:
>
> $ perf stat -e \
>         r8000000000000000,r8000000000000001,r8000000000000002,r8000000000000003, \
>         r8000000000000004,r8000000000000005,r8000000000000006,r8000000000000007, \
>         r8000000000000008,r8000000000000009,r800000000000000a,r800000000000000b, \
>         r800000000000000c,r800000000000000d,r800000000000000e,r800000000000000f  \
>         ls
>
> Note that 16 firmware events with 16 counters won't require multiplexing.
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>
> Hi all,
>
> Tested on QEMU with and without OpenSBI firmware counters enabled.
>
> v2 -> v3:
> - Fix range checks that include num_hw_ctrs
> - Update commit message
>
> v1 -> v2:
> - Rework: report accurate number of hardware counters to OS instead of
>   handling timer counter in a special way. Special handling should be
>   done in sbi_pmu_ctr_cfg_match
>
> Regards,
> Sergey
>
>  lib/sbi/sbi_pmu.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 3ecf536..3f5fd10 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -297,7 +297,7 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
>         unsigned long mctr_inhbt;
>
>         /* Make sure the counter index lies within the range and is not TM bit */
> -       if (cidx > num_hw_ctrs || cidx == 1)
> +       if (cidx >= num_hw_ctrs || cidx == 1)
>                 return SBI_EINVAL;
>
>         if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
> @@ -378,7 +378,7 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
>         mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
>
>         /* Make sure the counter index lies within the range and is not TM bit */
> -       if (cidx > num_hw_ctrs || cidx == 1)
> +       if (cidx >= num_hw_ctrs || cidx == 1)
>                 return SBI_EINVAL;
>
>         if (!__test_bit(cidx, &mctr_inhbt)) {
> @@ -516,7 +516,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>         u32 hartid = current_hartid();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
> -       if (cbase > num_hw_ctrs)
> +       if (cbase >= num_hw_ctrs)
>                 return SBI_EINVAL;
>
>         /**
> @@ -593,8 +593,8 @@ static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask, u32 hartid)
>         int fw_base;
>         unsigned long ctr_mask = cmask << cbase;
>
> -       if (cbase <= num_hw_ctrs)
> -               fw_base = num_hw_ctrs + 1;
> +       if (cbase < num_hw_ctrs)
> +               fw_base = num_hw_ctrs;
>         else
>                 fw_base = cbase;
>
> @@ -694,7 +694,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
>                 return SBI_EINVAL;
>
>         /* We have 31 HW counters with 31 being the last index(MHPMCOUNTER31) */
> -       if (cidx <= num_hw_ctrs) {
> +       if (cidx < num_hw_ctrs) {
>                 cinfo.type = SBI_PMU_CTR_TYPE_HW;
>                 cinfo.csr = CSR_CYCLE + cidx;
>                 /* mcycle & minstret are always 64 bit */
> @@ -749,7 +749,7 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>                 sbi_platform_pmu_init(plat);
>
>                 /* mcycle & minstret is available always */
> -               num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 2;
> +               num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 3;
>                 total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
>         }
>
> --
> 2.36.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Thanks for fixing the issue. LGTM.

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

