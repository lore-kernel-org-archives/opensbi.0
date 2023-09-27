From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 27 Sep 2023 18:07:25 +0200
Subject: [PATCH 1/1] lib: sbi_pmu: check for index overflows
In-Reply-To: <a94525a1-f7d2-40bb-a52c-36351f0205b3@dram.page>
References: <20230927141804.51473-1-heinrich.schuchardt@canonical.com>
 <a94525a1-f7d2-40bb-a52c-36351f0205b3@dram.page>
Message-ID: <f5a27bf6-d9be-4180-ab88-7bf9980c4dfc@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/27/23 17:39, Vivian Wang wrote:
> Good catch on the untrusted value but I think this is already checked?
> 
> 	/* Do a basic sanity check of counter base & mask */
> 	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
> 		return SBI_EINVAL;
> 
> But I suppose this could overflow, in which case probably just add this?
> 
> 	if (cidx_base >= total_ctrs || ...)
> 
> total_ctrs is small anyway (there shouldn't a billion counters right?)
> so this should be fine. If we do that we probably should modify the
> checks in sbi_pmu_ctr_{start,stop} as well for consistency.
> 
> I also checked if the IPI stuff have this problem but I'm pretty sure
> the hart indices are range-checked individually. It's probably still a
> good idea to add a "base and mask is sane" check there.
> 
> Thanks,
> Vivian aka "dram"

Thank you for reviewing.

Checking against total_ctrs is good. But with all the code involved in 
determining total_ctrs it is hard to say if there is any code path given 
incorrect input from the device-tree might result in

     total_ctrs > SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX

Even if today's code is correct a future change in the involved code 
might lead to such a situation.

For security reasons I would prefer to explicitly check against the 
array size before the assignment.

Nits:
Typically inline responses to patches are preferred.

Best regards

Heinrich





