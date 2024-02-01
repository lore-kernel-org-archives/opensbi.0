From: Bo Gan <ganboing@gmail.com>
Date: Wed, 31 Jan 2024 22:05:41 -0800
Subject: [PATCH] lib: sbi_pmu: Before using we should ensure PMU init done
In-Reply-To: <20240201020126.23833-1-gaoshanliukou@163.com>
References: <20240201020126.23833-1-gaoshanliukou@163.com>
Message-ID: <2d38702a-1f96-9524-0626-0364d7754395@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/31/24 6:01 PM, yang.zhang wrote:
> From: "yang.zhang" <yang.zhang@hexintek.com>
> 
> If trap earlier before sbi_pmu_init done, some path would call
> sbi_pmu_ctr_incr_fw, then it would go wrong:
> 1. if phs_ptr_offset is zero, then it get a wrong pmu state ptr
> 2. if phs_ptr_offset is ok, but we didn't call pmu_set_hart_state_ptr
> it would be NULL POINT
> 
> Of course, the above situation will not occur at present, but i think
> it's reasonable that we should check it before we use it.
> 
> Test:
> 1. I test it on our platform, for now we only support LR/SC not AMO.
> So when call spin_lock, would trap for amo instruction then emulate
> it with LR/SC, then it goes wrong.Of course, this case is special only
> for us, but other trap earlier cases maybe also encounter this situation.

I think trap-n-emulate AMO that originated from M mode itself is a bad idea.
As you already mentioned, it can happen before sbi_pmu_ctr_incr_fw is ready
to be called by sbi_trap_handler. If we are talking about other earlier traps,
to me, that only means we have a bug in opensbi. Back to locks, if you do
the trap-n-emulating route, it can incur significant performance penalty. Thus
I would strongly prefer to use a LR/SC implementation.

We should try to make lock implementations more flexible. I've got a JH7110
(visionfive2) on hand, and its hart1-4 supports both LR/SC and AMO, but its
hart0 (S7) supports AMO not LR/SC (the opposite to yours).

Perhaps we can have one implementation that only uses LR/SC and the other that
only uses AMO. Actually we already does. spin_trylock() uses LR/SC, and
spin_lock() uses AMO. However, spin_trylock() is currently not used by anyone.
I think the easiest way is to introduce a config option that tells opensbi to
only use LR/SC and then use while(!spin_trylock()) to implement spin_lock. Or,
use another, more optimized LR/SC spin lock implementation when such config
option is in effect.

As for the JH7110 S7 hart, I'm kind of on the same boat as you, except that I'm
on the opposite side. Right now, I can't boot from S7 hart, because the HSM code
uses atomic_cmpxchg that relies on LR/SC. I'm seeing the same kind of access
fault as you did. This time, I have no choice but to use a different form of
synchronization. (No such thing as emulating LR/SC using AMO). I'll try to
send out my patches for review later.

Bo

> 2.I aslo test on qemu thead-c906, but need do some changes for simulating
> this scenario.
>    2.1 revert f067bb84cf2dd6493ff3fa49294d3ec80481ad75, the commit causes
>    we can't emulate some instructions from M mode, i think the requirement
>    may be not reasonable.
>    2.2 Then, insert a 'rdtime' instruction before pmu_get_hart_state_ptr in
>    sbi_pmu_init, then something goes wrong.
> 
> Signed-off-by: yang.zhang <yang.zhang@hexintek.com>
> ---
>   lib/sbi/sbi_pmu.c | 27 +++++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 6209ccc..4eccb82 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -74,7 +74,7 @@ struct sbi_pmu_hart_state {
>   static unsigned long phs_ptr_offset;
>   
>   #define pmu_get_hart_state_ptr(__scratch)				\
> -	sbi_scratch_read_type((__scratch), void *, phs_ptr_offset)
> +	phs_ptr_offset ? sbi_scratch_read_type((__scratch), void *, phs_ptr_offset) : NULL
>   
>   #define pmu_thishart_state_ptr()					\
>   	pmu_get_hart_state_ptr(sbi_scratch_thishart_ptr())
> @@ -207,6 +207,9 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
>   	uint32_t event_code;
>   	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
>   
> +	if (unlikely(!phs))
> +		return SBI_EINVAL;
> +
>   	event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
>   	if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
>   		return SBI_EINVAL;
> @@ -432,6 +435,10 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>   		      unsigned long flags, uint64_t ival)
>   {
>   	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
> +
> +	if (unlikely(!phs))
> +		return SBI_EINVAL;
> +
>   	int event_idx_type;
>   	uint32_t event_code;
>   	int ret = SBI_EINVAL;
> @@ -535,6 +542,10 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
>   		     unsigned long flag)
>   {
>   	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
> +
> +	if (unlikely(!phs))
> +		return SBI_EINVAL;
> +
>   	int ret = SBI_EINVAL;
>   	int event_idx_type;
>   	uint32_t event_code;
> @@ -794,6 +805,10 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>   			  uint64_t event_data)
>   {
>   	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
> +
> +	if (unlikely(!phs))
> +		return SBI_EINVAL;
> +
>   	int ret, event_type, ctr_idx = SBI_ENOTSUPP;
>   	u32 event_code;
>   
> @@ -869,6 +884,9 @@ int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id)
>   	uint64_t *fcounter = NULL;
>   	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
>   
> +	if (unlikely(!phs))
> +		return 0;
> +
>   	if (likely(!phs->fw_counters_started))
>   		return 0;
>   
> @@ -967,7 +985,12 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
>   	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
>   		csr_write(CSR_MCOUNTEREN, -1);
>   
> -	pmu_reset_event_map(pmu_get_hart_state_ptr(scratch));
> +	struct sbi_pmu_hart_state *phs = pmu_get_hart_state_ptr(scratch);
> +
> +	if (unlikely(!phs))
> +		return;
> +
> +	pmu_reset_event_map(phs);
>   }
>   
>   int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
> 


