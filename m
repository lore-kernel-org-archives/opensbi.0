From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
Date: Thu, 6 Jul 2023 06:10:57 +0000
Subject: [PATCH] lib: sbi: Fix Priv spec version for [m|s]counter CSR
In-Reply-To: <CAAhSdy3hGXW3eD0zZ6EMR_SrFUhq0WVt3e2YS_ZxCgRMPT==vA@mail.gmail.com>
References: <20230706030350.2970803-1-leyfoon.tan@starfivetech.com>
 <CAAhSdy3hGXW3eD0zZ6EMR_SrFUhq0WVt3e2YS_ZxCgRMPT==vA@mail.gmail.com>
Message-ID: <afe6f73405384790b6573191e6360259@EXMBX061.cuchost.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel <anup@brainfault.org>
> Sent: Thursday, July 6, 2023 2:08 PM
> To: Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Cc: opensbi at lists.infradead.org; Ley Foon Tan <lftan.linux@gmail.com>
> Subject: Re: [PATCH] lib: sbi: Fix Priv spec version for [m|s]counter CSR
> 
> On Thu, Jul 6, 2023 at 8:35?AM Ley Foon Tan <leyfoon.tan@starfivetech.com>
> wrote:
> >
> > Fix Priv spec version typo in commit d4b563c881d6 ("lib: sbi: Remove
> > MCOUNTEREN and SCOUNTEREN hart features"). It should be v1.10.
> >
> > Fixes: d4b563c881d6 ("lib: sbi: Remove MCOUNTEREN and SCOUNTEREN
> hart
> > features")
> > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > ---
> >  lib/sbi/sbi_hart.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c index
> > 6e52cbd..62e7a4b 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -664,7 +664,7 @@ __mhpm_skip:
> >                 hfeatures->priv_version = SBI_HART_PRIV_VER_1_12;
> >
> >         /* Counter overflow/filtering is not useful without mcounter/inhibit */
> > -       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> > +       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_10) {
> 
> There is no mcountinhibit CSR in Priv v1.10 so this does not align with the
> comment.
> 
> The Priv version has to be at least v1.11 and nothing less.
Okay, will send v2 patch with v1.11.

Regards
Ley Foon


