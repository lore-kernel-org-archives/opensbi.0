From: Xiang W <wxjstz@126.com>
Date: Wed, 08 Dec 2021 19:51:03 +0800
Subject: [PATCH] lib: pmu: check SSCOF before masking
In-Reply-To: <20211208111654.25872-1-nikita.shubin@maquefel.me>
References: <20211208111654.25872-1-nikita.shubin@maquefel.me>
Message-ID: <27220b7d8a555806f9cf1b66f7e507dfadf73916.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-12-08???? 14:16 +0300?Nikita Shubin???
> From: Nikita Shubin <n.shubin@yadro.com>
> 
> We should check if SSCOF extension is present,
> before applying inhibit mask and clearing overflow,
> otherwise undesirable value can be written
> in MHPMEVENT_N CSR.
> 
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/sbi/sbi_pmu.c | 3 ++-
> ?1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 10668a3..5b845f8 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -467,7 +467,8 @@ static int pmu_update_hw_mhpmevent(struct
> sbi_pmu_hw_event *hw_evt, int ctr_idx,
> ????????????????return SBI_EFAIL;
> ?
> ????????/* Always clear the OVF bit and inhibit countin of events in
> M-mode */
> -???????mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) |
> MHPMEVENT_MINH;
> +???????if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> +???????????????mhpmevent_val = (mhpmevent_val &
> ~MHPMEVENT_SSCOF_MASK) | MHPMEVENT_MINH;
> ?
> ????????/* Update the inhibit flags based on inhibit flags received
> from supervisor */
> ????????pmu_update_inhibit_flags(flags, &mhpmevent_val);
> -- 
> 2.31.1
> 
> 



