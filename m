From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Dec 2022 17:17:50 +0530
Subject: [PATCH] lib: sbi: Add option to select boot hart
In-Reply-To: <CAEUhbmUF0V=jKkwPyQXe4VOtyL=x6fyGOh1U14Tk49ATG1rVhw@mail.gmail.com>
References: <20221129052119.379830-1-weiliang.lim@starfivetech.com>
 <CFE42EEB-E5DC-4D16-B895-0D9C14661494@jrtc27.com> <89f182fb3eac45bda58e75a6d3a64a46@EXMBX163.cuchost.com>
 <CAEUhbmUF0V=jKkwPyQXe4VOtyL=x6fyGOh1U14Tk49ATG1rVhw@mail.gmail.com>
Message-ID: <CAAhSdy00esijuPZCMt=pQBn=pMxgY5wcJqxsL20-UAc+KPThxA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 30, 2022 at 9:18 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Nov 30, 2022 at 11:35 AM WeiLiang Lim
> <weiliang.lim@starfivetech.com> wrote:
> >
> > > -----Original Message-----
> > > From: Jessica Clarke <jrtc27@jrtc27.com>
> > > Sent: Wednesday, November 30, 2022 12:18 AM
> > > To: WeiLiang Lim <weiliang.lim@starfivetech.com>
> > > Cc: opensbi at lists.infradead.org; Cheehong Ang
> > > <cheehong.ang@starfivetech.com>; JunLiang Tan
> > > <junliang.tan@starfivetech.com>
> > > Subject: Re: [PATCH] lib: sbi: Add option to select boot hart
> > >
> > > On 29 Nov 2022, at 05:21, Wei Liang Lim <weiliang.lim@starfivetech.com>
> > > wrote:
> > > >
> > > > In certain scenario, user needs to select a particular hart ID as the boot hart.
> > > This option provide the flexibility for user to select the preferred boot hart.
> > >
> > > Why? What?s wrong with the others?
> > >
> > > Jess
> > >
> > We need this patch for 2 scenarios below:
> > 1) On our architecture, there are some harts supporting MMU sv39/sv48 and some harts only supporting sv39. When those harts with sv48 support is picked as boot hart, the OS automatically assumes all the other non-boot harts support sv48 as well. Therefore, we need to select the harts with sv39 supports only as the boot hart to avoid the incorrect page table issues in non-boot harts.
>
> For such a case, you probably need to add a CONFIG option in the Linux
> kernel to force an MMU type instead of auto probing the highest MMU
> type on the boot hart.

Another option is to add a RISC-V specific kernel parameter and parse this
parameter very early in setup_vm().

Regards,
Anup

>
> >
> > 2) We have use case which requires the same boot hart to save OS context before going into 'hibernation' mode and to restore the OS context after resuming from 'hibernation' mode.
> >
> > > > Signed-off-by: Wei Liang Lim <weiliang.lim@starfivetech.com>
> > > > Reviewed-by: Chee Hong Ang <cheehong.ang@starfivetech.com>
> > > > Reviewed-by: Jun Liang Tan <junliang.tan@starfivetech.com>
> > > > ---
> > > > firmware/objects.mk | 4 ++++
> > > > lib/sbi/sbi_init.c  | 9 ++++++++-
> > > > 2 files changed, 12 insertions(+), 1 deletion(-)
> > > >
>
> Regards,
> Bin
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

