From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Sep 2022 16:37:44 +0530
Subject: [PATCH v2 2/2] docs: pmu: extend bindings example for Unmatched
In-Reply-To: <20220902074104.7082-2-nikita.shubin@maquefel.me>
References: <34F6D6CF-5BBC-4880-9A6F-793FC3A986B0@jrtc27.com>
 <20220902074104.7082-1-nikita.shubin@maquefel.me> <20220902074104.7082-2-nikita.shubin@maquefel.me>
Message-ID: <CAAhSdy2ciLcsEqHx_KrjjiUBA3tsmT6MOafEbrXoTYteoEWa9w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 2, 2022 at 1:11 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Extend example for Unmatched board to provide SBI PMU bindings
> for generalized and cache event's where they are applicable.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> v1->v2:
> - replaced email
> - replace codes in comments to actual U74 event names to make example more understandable
> Jessica Clarke:
>         - fix copy paste error
>         - these are SBI PMU hardware id's indeed
> ---
>  docs/pmu_support.md | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/docs/pmu_support.md b/docs/pmu_support.md
> index ca6ca25..d79b515 100644
> --- a/docs/pmu_support.md
> +++ b/docs/pmu_support.md
> @@ -90,9 +90,39 @@ pmu {
>  /*
>   * For HiFive Unmatched board. The encodings can be found here
>   * https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf
> + * This example also binds standard SBI PMU hardware id's to U74 PMU event codes, U74 uses bitfield for
> + * events encoding, so several U74 events can be bound to single perf id.
> + * See SBI PMU hardware id's in include/sbi/sbi_ecall_interface.h
>   */
>  pmu {
>         compatible                      = "riscv,pmu";
> +       riscv,event-to-mhpmevent =
> +/* SBI_PMU_HW_CACHE_REFERENCES -> Instruction cache/ITIM busy | Data cache/DTIM busy */
> +                                  <0x00003 0x00000000 0x1801>,
> +/* SBI_PMU_HW_CACHE_MISSES -> Instruction cache miss | Data cache miss or memory-mapped I/O access */
> +                                  <0x00004 0x00000000 0x0302>,
> +/* SBI_PMU_HW_BRANCH_INSTRUCTIONS -> Conditional branch retired */
> +                                  <0x00005 0x00000000 0x4000>,
> +/* SBI_PMU_HW_BRANCH_MISSES -> Branch direction misprediction | Branch/jump target misprediction */
> +                                  <0x00006 0x00000000 0x6001>,
> +/* L1D_READ_MISS -> Data cache miss or memory-mapped I/O access */
> +                                  <0x10001 0x00000000 0x0202>,
> +/* L1D_WRITE_ACCESS -> Data cache write-back */
> +                                  <0x10002 0x00000000 0x0402>,
> +/* L1I_READ_ACCESS -> Instruction cache miss */
> +                                  <0x10009 0x00000000 0x0102>,
> +/* LL_READ_MISS -> UTLB miss */
> +                                  <0x10011 0x00000000 0x2002>,
> +/* DTLB_READ_MISS -> Data TLB miss */
> +                                  <0x10019 0x00000000 0x1002>,
> +/* ITLB_READ_MISS-> Instruction TLB miss */
> +                                  <0x10021 0x00000000 0x0802>;
> +       riscv,event-to-mhpmcounters = <0x00003 0x00006 0x18>,
> +                                     <0x10001 0x10002 0x18>,
> +                                     <0x10009 0x10009 0x18>,
> +                                     <0x10011 0x10011 0x18>,
> +                                     <0x10019 0x10019 0x18>,
> +                                     <0x10021 0x10021 0x18>;
>         riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0x18>,
>                                           <0x0 0x1 0xffffffff 0xfff800ff 0x18>,
>                                           <0x0 0x2 0xffffffff 0xffffe0ff 0x18>;
> --
> 2.35.1
>

