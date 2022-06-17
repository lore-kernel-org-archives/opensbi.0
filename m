From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Jun 2022 12:13:28 +0530
Subject: [PATCH] lib: sbi: Fix version dependency for Sscofpmf
In-Reply-To: <ba9f1314-0988-6c90-3460-34d2f29157ab@sholland.org>
References: <20220613003838.13028-1-samuel@sholland.org> <CAAhSdy0Y49egjSeOfTC0OkSEmTf03EK1cHECi-ARjZj3oNtWaA@mail.gmail.com>
 <97c665fe-7e52-cd56-c198-84e796fa8263@sholland.org> <CAAhSdy24ukPCh0LFOZVKtDyzHdxTWw348nhueQ-mUC5JyiLYAA@mail.gmail.com>
 <ba9f1314-0988-6c90-3460-34d2f29157ab@sholland.org>
Message-ID: <CAAhSdy32h8kvY5OLVQtUS7=m1Nx7Mpvi-u5-Gz1GTh2y4vNemg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 17, 2022 at 10:49 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 6/16/22 11:56 PM, Anup Patel wrote:
> > On Fri, Jun 17, 2022 at 9:58 AM Samuel Holland <samuel@sholland.org> wrote:
> >>
> >> Hi Anup,
> >>
> >> On 6/16/22 11:12 PM, Anup Patel wrote:
> >>> On Mon, Jun 13, 2022 at 6:08 AM Samuel Holland <samuel@sholland.org> wrote:
> >>>>
> >>>> mcounteren was added in the privileged spec v1.10 and mcountinhibit was
> >>>> added in v1.11. Sscofpmf does not depend on anything in v1.12, so the
> >>>> minimum privileged spec version should have been v1.11.
> >>>>
> >>>> Fixes: d4b563c881d6 ("lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart features")
> >>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >>>
> >>> I think there is some confusion here.
> >>>
> >>> The mcounteren and mcountinhibit are not part of the Sscofpmf extension and
> >>> OpenSBI PMU implementation does support platforms without Sscofpmf.
> >>
> >> I am aware of that. I am referencing the comment on the previous line, and the
> >> code that was changed by the referenced commit. The code, as originally written,
> >> attempted to optimize out the Sscofpmf check based on the presence of those two
> >> CSRs.
> >>
> >> When the hart features were refactored, the CSR feature was replaced by the
> >> wrong version, i.e. the behavior was accidentally changed by the refactoring.
> >>
> >> This patch only attempts to restore the behavior from before the refactoring. If
> >> that behavior was wrong to start with, that is a different matter.
> >
> > I agree there is nothing in Sscofpmf which prevents a Priv v1.11 HART from
> > implementing it so this now becomes a strange choice on the OpenSBI side.
> >
> > IMO, the previous behaviour of detecting and using Sscofpmf irrespective
> > of the Priv spec version was wrong because Sscofpmf is defined assuming
> > Priv v1.12 spec. In fact, that's why Sscofpmf defines bits for filtering events
> > in VS/VU modes.
> >
> > Is there a case where we would need Sscofpmf for a Priv v1.11 HART ?
>
> I was attempting to add C906 PMU support as an errata on top of the standard
> extension, which is when I noticed this check. (C906 supports v1.11). However, I
> realized C906's custom overflow handling is different enough from Sscofpmf that
> I should implement it separately.
>
> So I do not know if a v1.11+Sscofpmf case does or should exist. Maybe the check
> is correct now, in which case the comment is a bit misleading.

Instead of setting SSCOFPMF extension flag for C906, I suggest we extend
sbi_pmu.c using "struct sbi_pmu_overflow_ops" abstraction. The sbi_pmu.c
will have two implementations of "struct sbi_pmu_overflow_ops": 1) "dummy"
implementation which will be used when there is no HW counter overflow
support 2) "sscofpmf" implementation which will be used when HW support
Sscofpmf extension.

The platform override for Allwinner D1 platform can provide its own
implementation of "struct sbi_pmu_overflow_ops".

Regards,
Anup

>
> Regards,
> Samuel
>
> >>>> ---
> >>>>
> >>>>  lib/sbi/sbi_hart.c | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> >>>> index de86fee..5bc6d52 100644
> >>>> --- a/lib/sbi/sbi_hart.c
> >>>> +++ b/lib/sbi/sbi_hart.c
> >>>> @@ -645,7 +645,7 @@ __mhpm_skip:
> >>>>                 hfeatures->priv_version = SBI_HART_PRIV_VER_1_12;
> >>>>
> >>>>         /* Counter overflow/filtering is not useful without mcounter/inhibit */
> >>>> -       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> >>>> +       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11) {
> >>>>                 /* Detect if hart supports sscofpmf */
> >>>>                 csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
> >>>>                 if (!trap.cause)
> >>>> --
> >>>> 2.35.1
> >>>>
> >>>>
> >>>> --
> >>>> opensbi mailing list
> >>>> opensbi at lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/opensbi
> >>
>

