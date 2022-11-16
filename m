From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Wed, 16 Nov 2022 15:53:56 +0000
Subject: [PATCH v2 5/7] platform: Add Renesas RZ/Five initial support
In-Reply-To: <CAAhSdy3eJ4YJrFZA0zN_4aMFMM=W_MBJmi_7-ngMSw7y85XCWg@mail.gmail.com>
References: <20221111182105.614094-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221111182105.614094-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAAhSdy3eJ4YJrFZA0zN_4aMFMM=W_MBJmi_7-ngMSw7y85XCWg@mail.gmail.com>
Message-ID: <CA+V-a8voWQyHaT5K4HQM5s_+a=6ObQCYrnBQGsjgNWFJ8wuPfQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

Thank you for the review.

On Tue, Nov 15, 2022 at 11:44 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Nov 11, 2022 at 11:51 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > This commit provides basic support for the Renesas RZ/Five
> > (R9A07G043F) SoC.
> >
> > The RZ/Five microprocessor includes a single RISC-V CPU Core (Andes AX45MP)
> > 1.0 GHz, 16-bit DDR3L/DDR4 interface. Supported interfaces include:
> > - Gigabit Ethernet 2ch
> > - CAN interface (CAN-FD) 2ch
> > - USB 2.0 interface 2ch
> > - SD interface 2ch
> > - AD converter 2ch
> >
> > Useful links:
> > -------------
> > [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
> > [1] http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v2
> > * Updated commit description
> > ---
> >  platform/renesas/rzfive/Kconfig           |  32 +++++
> >  platform/renesas/rzfive/configs/defconfig |   0
> >  platform/renesas/rzfive/objects.mk        |  18 +++
> >  platform/renesas/rzfive/platform.c        | 161 ++++++++++++++++++++++
> >  platform/renesas/rzfive/platform.h        |  24 ++++
> >  5 files changed, 235 insertions(+)
> >  create mode 100644 platform/renesas/rzfive/Kconfig
> >  create mode 100644 platform/renesas/rzfive/configs/defconfig
> >  create mode 100644 platform/renesas/rzfive/objects.mk
> >  create mode 100644 platform/renesas/rzfive/platform.c
> >  create mode 100644 platform/renesas/rzfive/platform.h
> >
> > diff --git a/platform/renesas/rzfive/Kconfig b/platform/renesas/rzfive/Kconfig
> > new file mode 100644
> > index 0000000..c5e8a19
> > --- /dev/null
> > +++ b/platform/renesas/rzfive/Kconfig
> > @@ -0,0 +1,32 @@
> > +# SPDX-License-Identifier: BSD-2-Clause
> > +
> > +config PLATFORM_RENESAS_RZFIVE
> > +       bool
> > +       select FDT
> > +       select FDT_SERIAL
> > +       select FDT_SERIAL_RENESAS_SCIF
> > +       select FDT_TIMER
> > +       select FDT_TIMER_PLMT
> > +       select FDT_IRQCHIP
> > +       select FDT_IRQCHIP_PLIC
> > +       select FDT_IPI
> > +       select FDT_IPI_PLICSW
> > +       default y
> > +
> > +if PLATFORM_RENESAS_RZFIVE
> > +
> > +config PLATFORM_RENESAS_RZFIVE_NAME
> > +       string "Platform default name"
> > +       default "Renesas RZ/Five"
> > +
> > +config PLATFORM_RENESAS_RZFIVE_MAJOR_VER
> > +       int "Platform major version"
> > +       range 0 65535
> > +       default 0
> > +
> > +config PLATFORM_RENESAS_RZFIVE_MINOR_VER
> > +       int "Platform minor version"
> > +       range 0 65535
> > +       default 1
> > +
> > +endif
> > diff --git a/platform/renesas/rzfive/configs/defconfig b/platform/renesas/rzfive/configs/defconfig
> > new file mode 100644
> > index 0000000..e69de29
> > diff --git a/platform/renesas/rzfive/objects.mk b/platform/renesas/rzfive/objects.mk
> > new file mode 100644
> > index 0000000..302b3d6
> > --- /dev/null
> > +++ b/platform/renesas/rzfive/objects.mk
> > @@ -0,0 +1,18 @@
> > +#
> > +# SPDX-License-Identifier: BSD-2-Clause
> > +#
> > +# Copyright (C) 2022 Renesas Electronics Corp.
> > +#
> > +
> > +# Compiler flags
> > +platform-cppflags-y =
> > +platform-cflags-y =
> > +platform-asflags-y =
> > +platform-ldflags-y =
> > +
> > +# Objects to build
> > +platform-objs-y += ../../andes/ae350/cache.o platform.o
>
> The fact that you have to compile ae350/cache.c as part of this platform
> shows we need to improve code re-use.
>
> Further, the platform.c added by this patch is very similar to platform.c
> of andes/ae350. Both platform.c files are subset of what is already there
> in generic/platform.c.
>
> I suggest you do the following:
> 1) Move andes/ae350 as a platform override under generic/platform/andes/ae350
> 2) Add rzfive as platform override under generic/platform/renesas/rzfive
> 3) The common Andes cache operations will be a library under
>     generic/platform/andes/ae350 which can be selected by renesas/rzfive
> 4) The common Andes header can be under generic/include/andes/ae350
> 5) Enable drivers required by andes/ae350 and renesas/rzfive platform
>     overrides in generic/configs/defconfig
>
- The reason for not using generic is because the FW_TEXT_START is different.
-  I came across the thread where because the generic FW uses FW_PIC
it doesn matter about the FW_TEXT_START, is this correct?
-  Moving forward I built rz/five as part of generic override successfully
- But when I try and build the u-boot with fw_dynamic.bin I get the
below errors:
  - Image 'main-section' is missing external blobs and is
non-functional: opensbi
  - Image 'main-section' has faked external blobs and is
non-functional: fw_dynamic.bin
- Ignoring the warning and still flashing the image I dont get any
output from opensbi.

Am I missing something here?

Cheers,
Prabhakar

