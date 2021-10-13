From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 13 Oct 2021 14:35:16 -0700
Subject: Release Plans
In-Reply-To: <8f2c510a-3eb8-e06e-a7b4-f2cc6a329396@ghiti.fr>
References: <1D58DF3B-D1B1-470A-A4FF-A4AD099921A8@jrtc27.com>
 <CAAhSdy0KtNaMvuX3KH5D0B86RRvXzNcqM-UaPDGDpgMvkotutg@mail.gmail.com>
 <CAEUhbmXiXyAmedkUPRcSjzbF4fD2FTd=jNguDbgM20QdSjE_JQ@mail.gmail.com>
 <8f2c510a-3eb8-e06e-a7b4-f2cc6a329396@ghiti.fr>
Message-ID: <CAOnJCUJMdzbcyvoGZzexcZFMr2T-3E3YYDATRN3MP6OMmuAP=A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 13, 2021 at 5:41 AM Alexandre ghiti <alex@ghiti.fr> wrote:
>
> Hi Anup, Bin,
>
> On 10/13/21 9:48 AM, Bin Meng wrote:
> > Hi Anup,
> >
> > On Wed, Oct 13, 2021 at 2:03 PM Anup Patel <anup@brainfault.org> wrote:
> >> Hi Jessica,
> >>
> >> On Wed, Oct 13, 2021 at 12:56 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>> Hi,
> >>> The latest OpenSBI release is 0.9 from January. With SBI 0.3(.1) on the
> >>> way and Unmatched support added since then, are there plans for a new
> >>> release any time soon? We?d like to have a newer version in the FreeBSD
> >>> ports tree so we can more easily provide updated firmware to Unmatched
> >>> users.
> >> Next release will be OpenSBI v1.0 (having SBI v0.3 implementation) and
> >> we can target this sometime in Nov 2021.
> > If possible can we release OpenSBI v1.0 before QEMU 6.2.0 soft freeze
> > (Nov 02) or hard freeze (Nov 09) so that it can be integrated into
> > QEMU 6.2.0.
> >
> >> We wanted to make SBI v0.3 fully stable for existing boards (particularly
> >> SiFive unmatched) before releasing OpenSBI hence the delay. We are
> >> almost there with few pending changes for SBI PMU and reset driver
> >> improvements.
> >>
> >> Post OpenSBI v1.0 release, we want to have more predictable release
> >> cycles (which we will document as well). I would like to have a release
> >> cycle which is realistic and agreed by most people over here.
> > Agree.
> >
> >> Thoughts or Suggestions ??
> > I suggest we align this with QEMU release cadence for easier
> > integration with QEMU. +Alistair Francis
>
>
> I think lots of bigger projects depend on openSBI (ex: QEMU 4-month,
> Ubuntu 6-month, Fedora 6-month) and to accommodate them all, taking a
> rather quick release cycle could be interesting: 2-3 months :)

It all depends on how many features we add to OpenSBI in 2-3 months.
We definitely added
enough features to warrant a release. We are just waiting for SBI
specification to be called frozen
as per the oficial process[1] which was defined recently.

[1] https://docs.google.com/document/d/1A4gZlXXFT_a9QGzlc9g2RHg853e6ZDB59coANEYN3Aw/edit
>
> Alex
>
>
> >
> > Regards,
> > Bin
> >
> > Regards,
> > Bin
> >
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

