From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Sat, 29 Oct 2022 10:01:38 +0000
Subject: [PATCH v4 00/14] Add Andes AE350 fdt driver support
In-Reply-To: <CAAhSdy0G27=AZXbEa3ZwNpqvAYzU+hrBi+g5a-w=thMT749Oig@mail.gmail.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
 <CAAhSdy2XvAA_1Qi9-b_d3H5st69ZbJbMdoho2X2fGHnzCY6A7g@mail.gmail.com>
 <Y1aq+LQ/GyvhCHDB@APC323>
 <CAAhSdy3tOUkMajYoMLP=KO=oPc2WHSTUDP_YHcDNhx6YTiiMiA@mail.gmail.com>
 <Y1roTqSu+6d8zT7M@APC323>
 <CAK9=C2Xuu3E+oSf=3SDjUcOS-o9O7FhB7Hms8NhST5wD8uRL-w@mail.gmail.com>
 <Y1uWQ0vYftMV+vZN@APC323>
 <CAAhSdy0G27=AZXbEa3ZwNpqvAYzU+hrBi+g5a-w=thMT749Oig@mail.gmail.com>
Message-ID: <Y1z6AlkY1N6ioX0Q@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 28, 2022 at 10:08:21PM +0530, Anup Patel wrote:
> On Fri, Oct 28, 2022 at 6:16 AM Yu-Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > On Thu, Oct 27, 2022 at 06:13:48PM +0530, Anup Patel wrote:
> > > On Thu, Oct 27, 2022 at 5:54 PM Yu-Chien Peter Lin
> > > <peterlin@andestech.com> wrote:
> > > >
> > > > > > > Applied this series to the riscv/opensbi repo.
> > > > > > >
> > > > > > > Any thoughts on using the generic platform ?
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Anup
> > > > > >
> > > > > > Hi Anup,
> > > > > >
> > > > > > The FW_TEXT_START on AE350 is different from generic platform.
> > > > > > Will it become a configuration?
> > > > >
> > > > > The generic platform has FW_PIC enabled so you can load and
> > > > > run generic firmwares from any address.
> > > > >
> > > > > > I think we would keep the platform specific files in andes/ae350
> > > > > > until we have to refactor the duplicate code.
> > > > >
> > > > > You can add platform specific overrides to generic platforms which
> > > > > are selected based on compatible string in the root DT node.
> > > > >
> > > > > Regards,
> > > > > Anup
> > > >
> > > > Hi Anup,
> > > >
> > > > We're considering using generic platform, but I don't find any
> > > > vendor_ext_provider is implemented as a platform_override hook,
> > > > does it mean we need to drop it if we move to generic platform?
> > >
> > > vendor_ext_provider() is available in platform_override of generic
> > > platform.
> > >
> > > Please check the latest OpenSBI sources.
> > >
> > > Regards,
> > > Anup
> > >
> >
> > Hi Anup,
> >
> > Sorry, I know there is vendor_ext_provider in platform_override,
> > except AE350, no other platforms actually have such hook in their
> > platform specific files, so I was wondering if the current acceptance
> > policy won't let us keep that function even in platform/andes/ae350.
> 
> We generally encourage platform vendors to prefer standard
> SBI extensions over custom SBI extensions but it might not
> be always possible to have a standard extension for everything
> out there.
> 
> In other words, we do expect a few platform_override to have
> vendor_ext_provider() for platform specific quirks and currently
> we are OKAY with it but platform vendor will have to maintain
> their vendor_ext_provider() implementation.
> 
> Regards,
> Anup

Hi Anup,

Thanks for your clarification!

Best regards,
Peter Lin

