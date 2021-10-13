From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Oct 2021 15:48:14 +0800
Subject: Release Plans
In-Reply-To: <CAAhSdy0KtNaMvuX3KH5D0B86RRvXzNcqM-UaPDGDpgMvkotutg@mail.gmail.com>
References: <1D58DF3B-D1B1-470A-A4FF-A4AD099921A8@jrtc27.com>
 <CAAhSdy0KtNaMvuX3KH5D0B86RRvXzNcqM-UaPDGDpgMvkotutg@mail.gmail.com>
Message-ID: <CAEUhbmXiXyAmedkUPRcSjzbF4fD2FTd=jNguDbgM20QdSjE_JQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On Wed, Oct 13, 2021 at 2:03 PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Jessica,
>
> On Wed, Oct 13, 2021 at 12:56 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >
> > Hi,
> > The latest OpenSBI release is 0.9 from January. With SBI 0.3(.1) on the
> > way and Unmatched support added since then, are there plans for a new
> > release any time soon? We?d like to have a newer version in the FreeBSD
> > ports tree so we can more easily provide updated firmware to Unmatched
> > users.
>
> Next release will be OpenSBI v1.0 (having SBI v0.3 implementation) and
> we can target this sometime in Nov 2021.

If possible can we release OpenSBI v1.0 before QEMU 6.2.0 soft freeze
(Nov 02) or hard freeze (Nov 09) so that it can be integrated into
QEMU 6.2.0.

>
> We wanted to make SBI v0.3 fully stable for existing boards (particularly
> SiFive unmatched) before releasing OpenSBI hence the delay. We are
> almost there with few pending changes for SBI PMU and reset driver
> improvements.
>
> Post OpenSBI v1.0 release, we want to have more predictable release
> cycles (which we will document as well). I would like to have a release
> cycle which is realistic and agreed by most people over here.

Agree.

>
> Thoughts or Suggestions ??

I suggest we align this with QEMU release cadence for easier
integration with QEMU. +Alistair Francis

Regards,
Bin

Regards,
Bin

