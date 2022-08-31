From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 31 Aug 2022 14:05:23 +0100
Subject: [PATCH 2/2] docs: pmu: extend bindings example for Unmatched
In-Reply-To: <20220831070714.7540-2-nikita.shubin@maquefel.me>
References: <20220831070714.7540-1-nikita.shubin@maquefel.me>
 <20220831070714.7540-2-nikita.shubin@maquefel.me>
Message-ID: <34F6D6CF-5BBC-4880-9A6F-793FC3A986B0@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 31 Aug 2022, at 08:07, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> 
> Extend example for Unmatched board to provide linux perf bindings
> for generalized and cache event's where they are applicable.

These aren?t Linux perf event codes, these are SBI event codes, because
OpenSBI is not Linux and is not exclusively for Linux.

> Link: https://forums.sifive.com/t/perf-list-to-fu740-hpm-bindings-question/5509
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
> docs/pmu_support.md | 30 +++++++++++++++++++++++++++++-
> 1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/pmu_support.md b/docs/pmu_support.md
> index ca6ca25..57483da 100644
> --- a/docs/pmu_support.md
> +++ b/docs/pmu_support.md
> @@ -90,9 +90,37 @@ pmu {
> /*
>  * For HiFive Unmatched board. The encodings can be found here
>  * https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf
> + * This example also binds standard perf hardware id's to U74 PMU event codes, U74 uses bitfield for
> + * events encoding, so several U74 events can be bound to single perf id.
>  */
> pmu {
> -	compatible 			= "riscv,pmu";
> +	compatible			= "riscv,pmu";
> +	riscv,event-to-mhpmevent = /* PERF_COUNT_HW_BRANCH_INSTRUCTIONS -> 0x4000 */

Copy paste error.

Jess

> +				   <0x00003 0x00000000 0x1801>,
> +				   /* PERF_COUNT_HW_CACHE_MISSES -> 0x0102 | 0x0202 */
> +				   <0x00004 0x00000000 0x0302>,
> +				   /* PERF_COUNT_HW_BRANCH_INSTRUCTIONS -> 0x4000 */
> +				   <0x00005 0x00000000 0x4000>,
> +				   /* PERF_COUNT_HW_BRANCH_MISSES -> 0x2001 | 0x4001 */
> +				   <0x00006 0x00000000 0x6001>,
> +				   /* L1D_READ_MISS -> 0x0202 */
> +				   <0x10001 0x00000000 0x0202>,
> +				   /* L1D_WRITE_ACCESS -> 0x0402 */
> +				   <0x10002 0x00000000 0x0402>,
> +				   /* L1I_READ_ACCESS -> 0x0102 */
> +				   <0x10009 0x00000000 0x0102>,
> +				   /* LL_READ_MISS -> 0x2002 */
> +				   <0x10011 0x00000000 0x2002>,
> +				   /* DTLB_READ_MISS -> 0x1002 */
> +				   <0x10019 0x00000000 0x1002>,
> +				   /* ITLB_READ_MISS-> 0x0802 */
> +				   <0x10021 0x00000000 0x0802>;
> +	riscv,event-to-mhpmcounters = <0x00003 0x00006 0x18>,
> +				      <0x10001 0x10002 0x18>,
> +				      <0x10009 0x10009 0x18>,
> +				      <0x10011 0x10011 0x18>,
> +				      <0x10019 0x10019 0x18>,
> +				      <0x10021 0x10021 0x18>;
> 	riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0x18>,
> 					  <0x0 0x1 0xffffffff 0xfff800ff 0x18>,
> 					  <0x0 0x2 0xffffffff 0xffffe0ff 0x18>;
> -- 
> 2.35.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


