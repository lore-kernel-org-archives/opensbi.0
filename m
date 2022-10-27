From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 27 Oct 2022 20:21:34 +0000
Subject: [PATCH v4 00/14] Add Andes AE350 fdt driver support
In-Reply-To: <CAAhSdy3tOUkMajYoMLP=KO=oPc2WHSTUDP_YHcDNhx6YTiiMiA@mail.gmail.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
 <CAAhSdy2XvAA_1Qi9-b_d3H5st69ZbJbMdoho2X2fGHnzCY6A7g@mail.gmail.com>
 <Y1aq+LQ/GyvhCHDB@APC323>
 <CAAhSdy3tOUkMajYoMLP=KO=oPc2WHSTUDP_YHcDNhx6YTiiMiA@mail.gmail.com>
Message-ID: <Y1roTqSu+6d8zT7M@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > > Applied this series to the riscv/opensbi repo.
> > >
> > > Any thoughts on using the generic platform ?
> > >
> > > Thanks,
> > > Anup
> >
> > Hi Anup,
> >
> > The FW_TEXT_START on AE350 is different from generic platform.
> > Will it become a configuration?
> 
> The generic platform has FW_PIC enabled so you can load and
> run generic firmwares from any address.
> 
> > I think we would keep the platform specific files in andes/ae350
> > until we have to refactor the duplicate code.
> 
> You can add platform specific overrides to generic platforms which
> are selected based on compatible string in the root DT node.
> 
> Regards,
> Anup

Hi Anup,

We're considering using generic platform, but I don't find any
vendor_ext_provider is implemented as a platform_override hook,
does it mean we need to drop it if we move to generic platform?

Best regards,
Peter Lin

