From: Vivian Wang <uwu@dram.page>
Date: Wed, 27 Sep 2023 23:39:13 +0800
Subject: [PATCH 1/1] lib: sbi_pmu: check for index overflows
In-Reply-To: <20230927141804.51473-1-heinrich.schuchardt@canonical.com>
References: <20230927141804.51473-1-heinrich.schuchardt@canonical.com>
Message-ID: <a94525a1-f7d2-40bb-a52c-36351f0205b3@dram.page>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Good catch on the untrusted value but I think this is already checked?

	/* Do a basic sanity check of counter base & mask */
	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
		return SBI_EINVAL;

But I suppose this could overflow, in which case probably just add this?

	if (cidx_base >= total_ctrs || ...)

total_ctrs is small anyway (there shouldn't a billion counters right?)
so this should be fine. If we do that we probably should modify the
checks in sbi_pmu_ctr_{start,stop} as well for consistency.

I also checked if the IPI stuff have this problem but I'm pretty sure
the hart indices are range-checked individually. It's probably still a
good idea to add a "base and mask is sane" check there.

Thanks,
Vivian aka "dram"

