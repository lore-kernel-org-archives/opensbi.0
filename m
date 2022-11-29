From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Tue, 29 Nov 2022 12:13:21 +0000
Subject: [PATCH v2 1/7] lib: utils: serial: Add Renesas SCIF driver
In-Reply-To: <CAEUhbmV=vg4iap1h9h1Q0Ejvad4e2ZwVETjLqOarc-ajZYjTag@mail.gmail.com>
References: <20221111182105.614094-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221111182105.614094-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAEUhbmX82_EhkF62GbvYyAsztK1XpJ4XcG+XwzWrQ1gBV2P7QA@mail.gmail.com>
 <CA+V-a8urvQf+53sjSR3kLsyLTZjhhKYJYLshA98Js3PnkDH9uA@mail.gmail.com>
 <CAEUhbmVAtQ+MScY4V6UpjZD+nURCvC7T-2fLC1diz_5GVURsZQ@mail.gmail.com>
 <CA+V-a8sJFTQE4xErgjKhZ_7-U9xMqApei1sR6r5GgtzPKK4Mkw@mail.gmail.com> <CAEUhbmV=vg4iap1h9h1Q0Ejvad4e2ZwVETjLqOarc-ajZYjTag@mail.gmail.com>
Message-ID: <CA+V-a8sjE_pnFncA4o2Fc7B6vEhNbUhFXGzqYxLWeL3wxf=T5A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Bin,

On Sun, Nov 20, 2022 at 11:59 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Nov 18, 2022 at 9:08 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Bin,
> >
> > On Thu, Nov 17, 2022 at 7:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > On Wed, Nov 16, 2022 at 1:34 AM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > >
> > > > Hi Bin,
<snip>
> > > > > > +static void renesas_scif_putc(char ch)
> > > > > > +{
> > > > > > +       uint16_t reg;
> > > > > > +
> > > > > > +       while (!(SCIF_FSR_TXD_CHK & get_reg(SCIF_REG_FSR)))
> > > > > > +               ;
> > > > > > +
> > > > > > +       set_reg(SCIF_REG_FTDR, ch);
> > > > > > +       reg = get_reg(SCIF_REG_FSR);
> > > > > > +       reg &= ~SCIF_FSR_TXD_CHK;
> > > > > > +       set_reg(SCIF_REG_FSR, reg);
> > > > >
> > > > > The FSR Tx status bits clear should happen before writing a new char
> > > > > to the Tx fifo, no?
> > > > >
> > > > No, this has to be cleared only after char write.
> > >
> > > Based on my read of the user manual, after the while () check, we can
> > > clear the status bits. After you write a new char to the FIFO, the
> > > status bits might be triggered by the new char write, instead of the
> > > previous one. Hence clearing status bits after writing char will cause
> > > the status bits check next time fail.
> > >
> > From the HW manual..
> > [Clearing conditions]
> > ? TDFE is cleared to 0 when 0 is written in the TDFE bit after reading TDFE = 1.
> > ? When transmit data is written to the FTDR register
> > ^^ hence its cleared after the write here.
>
> These 2 conditions are OR, not AND, right?
>
> So when the while loop breaks, it satisfies the first condition, and
> we can clear the TDFE bit by writing zero to FSR.
>
> But if you write the tx data to the FTDR register, after you do
>
> set_reg(SCIF_REG_FTDR, ch);
>
> There is a possibility that the TDFE bit is generated before before you do
>
> reg = get_reg(SCIF_REG_FSR);
> reg &= ~SCIF_FSR_TXD_CHK;
> set_reg(SCIF_REG_FSR, reg);
>
> then the TDFE bit gets cleared unexpectedly.
>
> Next time when you want to write another char to the serial port the
> while loop will never break.
>
I altered the code sequence as per your suggestion and haven't seen
any issue with some limited testing.

Here are references [0]/[1] for why the sequence should be as in the
current patch. Looking at [1] I'm not seeing the issue mentioned there
if I re-order the code sequence.
(I am awaiting a response from the HW team yet.)

As the current code sequence has been there in Linux/u-boot ([2]/[3]
and our flashwriter code too) for many years and haven't seen an issue
of infinite looping I would like to stick with the current code
sequence. And if in future if we see any issue we can provide a patch
to fix this.

I hope this is OK with you.

[0] https://pasteboard.co/fXHV51yQD8zU.png
[1] https://patchwork.kernel.org/project/linux-sh/patch/4.2.0.58.J.20090601123439.00b52740 at router.itonet.co.jp/#63581
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/sh-sci.c?h=v6.1-rc7#n698
[3] https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/serial/serial_sh.c#L83

Cheers,
Prabhakar

