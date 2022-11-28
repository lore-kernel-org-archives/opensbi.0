From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Nov 2022 09:07:51 +0530
Subject: [PATCH v2 5/7] platform: Add Renesas RZ/Five initial support
In-Reply-To: <Y4R9+NxyafIbka8Q@APC323>
References: <20221111182105.614094-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221111182105.614094-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y4R9+NxyafIbka8Q@APC323>
Message-ID: <CAAhSdy1zqjGv=cvLOkiaFz9gGzKBWCGPHdPwP8WTP0tv1N+=0Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 6:56 AM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi Prabhakar,
>
> > > The fact that you have to compile ae350/cache.c as part of this platform
> > > shows we need to improve code re-use.
> > >
> > > Further, the platform.c added by this patch is very similar to platform.c
> > > of andes/ae350. Both platform.c files are subset of what is already there
> > > in generic/platform.c.
> > >
> > > I suggest you do the following:
> > > 1) Move andes/ae350 as a platform override under generic/platform/andes/ae350
> > > 2) Add rzfive as platform override under generic/platform/renesas/rzfive
> > > 3) The common Andes cache operations will be a library under
> > >     generic/platform/andes/ae350 which can be selected by renesas/rzfive
> > > 4) The common Andes header can be under generic/include/andes/ae350
> > > 5) Enable drivers required by andes/ae350 and renesas/rzfive platform
> > >     overrides in generic/configs/defconfig
> > >
> > - The reason for not using generic is because the FW_TEXT_START is different.
> > -  I came across the thread where because the generic FW uses FW_PIC
> > it doesn matter about the FW_TEXT_START, is this correct?
>
> We will use generic platform as Anup suggested. I'll send our patch soon.
> When FW_PIC=y (default), set CONFIG_SPL_OPENSBI_LOAD_ADDR to 0x44000000
> in U-boot should be able to run OpenSBI.

Thanks for taking this up.

Please keep in mind that OpenSBI v1.2 release will be towards the end
of Dec 2022. It will be nice to support both andes/ae350 and RZ/Five
in this upcoming release.

>
> > -  Moving forward I built rz/five as part of generic override successfully
> > - But when I try and build the u-boot with fw_dynamic.bin I get the
> > below errors:
> >   - Image 'main-section' is missing external blobs and is
> > non-functional: opensbi
> >   - Image 'main-section' has faked external blobs and is
> > non-functional: fw_dynamic.bin
> > - Ignoring the warning and still flashing the image I dont get any
> > output from opensbi.
>
> The error message looks like the fw_dynamic.bin is not copied to top
> directory of U-boot, so a dummy one is created.
> The load/entry addresses and binary of OpenSBI can be observed by using
> `dtc u-boot.itb`.
>
> > Am I missing something here?
> >
> > Cheers,
> > Prabhakar
> >
>
> Best regards,
> Peter Lin

Regards,
Anup

