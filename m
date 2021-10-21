From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 21 Oct 2021 06:40:54 +0200
Subject: [PATCH v2 5/5] lib: utils/reset: Add generic da9063 reset driver
In-Reply-To: <20211020120046.066ac625@redslave.neermore.group>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <20211015131925.22585-6-nikita.shubin@maquefel.me>
 <CA+zEjCvAaecMmN-HDUVw7Sqb89tRtC-3vFQQYb1xSboCJnkRww@mail.gmail.com>
 <20211020100016.350f1379@redslave.neermore.group>
 <CA+zEjCsszR-AW8Cbm=Pu2qLE85QfrtrFk-D-TO=8F9T3EDxA9Q@mail.gmail.com>
 <20211020120046.066ac625@redslave.neermore.group>
Message-ID: <CA+zEjCveNdzJX50MgSewCpO5dfKF_8vSYQj-_VH3cSUxOa+i=Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 20, 2021 at 11:00 AM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:
>
> On Wed, 20 Oct 2021 10:33:26 +0200
> Alexandre Ghiti <alexandre.ghiti@canonical.com> wrote:
>
> > On Wed, Oct 20, 2021 at 9:00 AM Nikita Shubin
> > <nikita.shubin@maquefel.me> wrote:
> > >
> > > Hello Alexandre!
> > >
> > > On Tue, 19 Oct 2021 14:39:16 +0200
> > > Alexandre Ghiti <alexandre.ghiti@canonical.com> wrote:
> > >
> > > > > +
> > > > > +static const struct fdt_match da9063_reset_match[] = {
> > > > > +       { .compatible = "da9063-reset", .data = (void *)TRUE },
> > > > > +       { },
> > > > > +};
> > > >
> > > > Agree with Jessica here, as per Adam, the reset as we implement it
> > > > here should remain a board specific thing, so we should not rely
> > > > on this device tree node. I was hoping to make something that
> > > > would work in general for da9063 users, but no luck.
> > > >
> > > > And finally I think we should listen to Adam and go for a full
> > > > reset using the RTC, instead of the partial reset we implemented
> > > > here. We sacrifice the RTC but anyway, it was not even exposed in
> > > > the device tree, we should add a comment there so that people
> > > > don't get surprised if they enable it. I will post the right
> > > > sequence adapted to your sources soon.
> > >
> > > Well the RTC is much more valuable than reset actually and used for
> > > many tests.
> > >
> > > Indeed da9063 reset can be moved totally to "platform" code, but do
> > > you think that leaving users with hard-coded reset cutting them off
> > > from RTC and no other possibility, other than fixing OpenSBI code
> > > in-place is really a good option ?
> > >
> > > With DTS approuch it can be as simple as removing the da9063-reset
> > > from DTS file.
> > >
> >
> > Arf, I change my mind every two days regarding this...I'm just trying
> > to have a reliable reset, and to quote Adam below, the reset as
> > implemented here is only partial:
> >
> > "With the sequence you provided this is only a partial reset whereby
> > all of the output rails are sequenced down then up again and restored
> > to OTP voltages. However the remainder of the chip settings aren't
> > reset as this isn't a true reset of the device going through full
> > reload from OTP, so for example settings of regulator mode GPIO
> > states, or IRQ mask bits would persist on the restart, which could
> > have implications on system operation."
>
> Actually i don't think battling over a board which isn't supposed to be
> more than a development board and won't be massed used makes any sense.
>
> It's more like QoL for those who are currently porting software or
> experimenting with RISC-V.
>
> Before this we used openocd reset, which can be greatly automated with
> expect.
>
> >
> > I imagine the partial reset could have side-effects on the RTC
> > configuration too. So we might end up with a partial reset and a
> > broken RTC...
> >
>
> Well we should really investigate this.
>
> As well as i don't quite understand this "sacrifice RTC" thing.

To use the RTC for the reset, the cleanest solution is to set a
one-shot alarm which could have been already programmed by the user.
There is also the periodic tick which may or not clobber
user-specified registers and is way simpler to implement.

I gave you all the input I had from Dialog, the choice is up to you
now, we spent enough time on this already.

Thanks,

Alex

>
> > and again from Adam:
> >
> > "Personally, if it was possible I think the RTC approach would be
> > best as it's a full reset and to me is far safer with regards to
> > potential side effects"
> >
> >
> > > >
> > > > Thanks,
> > > >
> > > > Alex
> > > >
> > > >
> > > > > +
> > > > > +struct fdt_reset fdt_reset_da9063 = {
> > > > > +       .match_table = da9063_reset_match,
> > > > > +       .init = da9063_reset_init,
> > > > > +};
> > > > > diff --git a/lib/utils/reset/objects.mk
> > > > > b/lib/utils/reset/objects.mk index 6c95db3..cfe4c09 100644
> > > > > --- a/lib/utils/reset/objects.mk
> > > > > +++ b/lib/utils/reset/objects.mk
> > > > > @@ -14,3 +14,4 @@ libsbiutils-objs-y +=
> > > > > reset/fdt_reset_sifive_test.o libsbiutils-objs-y +=
> > > > > reset/fdt_reset_sunxi_wdt.o libsbiutils-objs-y +=
> > > > > reset/fdt_reset_thead.o libsbiutils-objs-y +=
> > > > > reset/fdt_reset_thead_asm.o +libsbiutils-objs-y +=
> > > > > reset/fdt_reset_da9063.o --
> > > > > 2.31.1
> > > > >
> > > > >
> > > > > --
> > > > > opensbi mailing list
> > > > > opensbi at lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > >
>

