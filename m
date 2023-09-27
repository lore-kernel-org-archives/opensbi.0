From: Vivian Wang <uwu@dram.page>
Date: Thu, 28 Sep 2023 00:29:39 +0800
Subject: [PATCH 1/1] lib: sbi_pmu: check for index overflows
In-Reply-To: <f5a27bf6-d9be-4180-ab88-7bf9980c4dfc@canonical.com>
References: <20230927141804.51473-1-heinrich.schuchardt@canonical.com>
 <a94525a1-f7d2-40bb-a52c-36351f0205b3@dram.page>
 <f5a27bf6-d9be-4180-ab88-7bf9980c4dfc@canonical.com>
Message-ID: <7261ab80-22ab-4237-9ada-ff01ea0bb5dd@dram.page>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/28/23 00:07, Heinrich Schuchardt wrote:
> On 9/27/23 17:39, Vivian Wang wrote:
>> Good catch on the untrusted value but I think this is already checked?
>>
>> ????/* Do a basic sanity check of counter base & mask */
>> ????if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
>> ??????? return SBI_EINVAL;
>>
>> But I suppose this could overflow, in which case probably just add this?
>>
>> ????if (cidx_base >= total_ctrs || ...)
>>
>> total_ctrs is small anyway (there shouldn't a billion counters right?)
>> so this should be fine. If we do that we probably should modify the
>> checks in sbi_pmu_ctr_{start,stop} as well for consistency.
>>
>> I also checked if the IPI stuff have this problem but I'm pretty sure
>> the hart indices are range-checked individually. It's probably still a
>> good idea to add a "base and mask is sane" check there.
>>
>> Thanks,
>> Vivian aka "dram"
> 
> Thank you for reviewing.
> 
> Checking against total_ctrs is good. 

I really just meant there is already a check near the top of
sbi_pmu_ctr_cfg_match that does a check on cidx_{base,mask} already and
we should probably fix that instead. The existing code had total_ctrs so
that's what I mentioned.

> But with all the code involved in
> determining total_ctrs it is hard to say if there is any code path given
> incorrect input from the device-tree might result in
> 
> ??? total_ctrs > SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX
> 
> Even if today's code is correct a future change in the involved code
> might lead to such a situation.
> 

The previous point aside, I'm not really convinced about this.
SBI_PMU_HW_CTR_MAX is defined by the unprivileged spec in Zicntr/Zihpm
to be 32 (cycle, time, instret, and hpmcounter3 through 31). The probing
code does not read the DT and relies on CSR probing instead.

And in any case I think whatever sanity check we'd want on total_ctrs
should just go in sbi_pmu_init, the place where total_ctrs is set.

> For security reasons I would prefer to explicitly check against the
> array size before the assignment.
> 
> Nits:
> Typically inline responses to patches are preferred.
> 

Yeah sorry, just wasn't sure how to structure a reply that is not
actually about any of the code in the diff.

Vivian aka "dram"

> Best regards
> 
> Heinrich
> 
> 
> 
> 


