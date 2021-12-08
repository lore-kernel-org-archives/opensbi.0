From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Dec 2021 16:56:23 +0530
Subject: [PATCH] lib: pmu: check SSCOF before masking
In-Reply-To: <20211208111654.25872-1-nikita.shubin@maquefel.me>
References: <20211208111654.25872-1-nikita.shubin@maquefel.me>
Message-ID: <CAAhSdy23YLLCPNLzG0_Lpp_Mzsj30hQdHQPtHBCEJOyF4MoUmQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 8, 2021 at 4:47 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> We should check if SSCOF extension is present,
> before applying inhibit mask and clearing overflow,
> otherwise undesirable value can be written
> in MHPMEVENT_N CSR.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Good catch. This one slipped through our reviews.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  lib/sbi/sbi_pmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 10668a3..5b845f8 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -467,7 +467,8 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
>                 return SBI_EFAIL;
>
>         /* Always clear the OVF bit and inhibit countin of events in M-mode */
> -       mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) | MHPMEVENT_MINH;
> +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> +               mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) | MHPMEVENT_MINH;
>
>         /* Update the inhibit flags based on inhibit flags received from supervisor */
>         pmu_update_inhibit_flags(flags, &mhpmevent_val);
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

