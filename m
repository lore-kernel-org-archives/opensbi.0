From: Adnan Chowdhury <adnan.chowdhury@sifive.com>
Date: Wed, 22 Jun 2022 16:06:42 +0100
Subject: FDT based DesignWare I3C driver for the generic platform
In-Reply-To: <CAK9=C2X-7Rt3bKSNRxPGzOU2azK0A2xSio2wAi_Cv2sn+QNHiA@mail.gmail.com>
References: <CAAsT5XoYO1=mvDydx_XB8SS6-SAUi2=RqC4veV57TwN0LGdohw@mail.gmail.com>
 <CAK9=C2X-7Rt3bKSNRxPGzOU2azK0A2xSio2wAi_Cv2sn+QNHiA@mail.gmail.com>
Message-ID: <CAAsT5Xo8fGYG9VR6+aikq3DmOPb42uw0yJEGhDtAEBmZ6Ab2Hg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 22, 2022 at 12:52 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Wed, Jun 22, 2022 at 3:07 PM Adnan Chowdhury
> <adnan.chowdhury@sifive.com> wrote:
> >
> > Hello Team,
> >
> > This is my first email to the list so please accept my apology if I'm
> > not clear about anything.
>
> No need to be apologetic for asking questions.
>
> >
> > I've been working for an announced SoC. This piece of hardware comes
> > with a DesignWare I3C block. We'll be using OpenSBI in our software
> > stack for the SoC. The plan is to use OpenSBI's generic platform for
> > the project. I've written an FDT based I3C driver so that the
>
> That's really nice.
>
> I assume you need i3c for system reset or something else ?

The OpenSBI will access a power management IC which uses I2C protocol.
The SoC only has DesignWare I3C block so the driver needs to support that.
However, there are other I3C devices connected to the SoC, but OpenSBI won't
be using them, at least no plan as of current project requirement.

>
> > DesignWare I3C can be used. I've implemented it in two parts:
> >
> > - fdt_i3c.c/h: A generic FDT I3C module that parses the FDT for the
> > presence of I3C controllers.
> > - dwc_i3c.c/h: This module has all the necessary functions that can be
> > used in our project (namely I2C private read/write), and is expandable
> > for adding more functionalities in the future. It uses fdt_i3c.c/h.
>
> I think the i3c support can be similar to the OpenSBI i2c support:
>
> 1) Simple i3c bus library (manage and find i3c buses)
> lib/utils/i3c/i3c.c
> include/sbi_utils/i3c/i3c.h

At this moment, we only have a development board available, not the final
SoC. On the development board no I2C or I3C devices are present. There is a
Keterex I2C adapter plugged into the DW I3C port. This is how I've developed
and tested the driver.

Because on the final SoC OpenSBI won't be accessing any I3C devices, I
thought of not writing i3c.c/h module. At this moment I don't have any way
to test the API specific to I3C.

>
> 2) FDT based i3c bus (find and initialize i3c buses from FDT)
> lib/utils/i3c/fdt_i3c.c
> include/sbi_utils/i3c/fdt_i3c.h
>
> The i3c bus instance is analogous to the i2c adapter instance but the
> major difference between i2c and i3c will be the APIs or operations
> supported for devices.
>
> Also, for every i3c bus instance the i3c.c will also register a corresponding
> i2c adapter instance so that various i2c devices can be accessed via i3c
> bus instance.

I knew that DW I3C will only be used for I2C communication. However, I wasn't
sure how to use the existing fdt_i2c.c/h module and i2c_adapter. They don't
seem appropriate as I'm dealing with I3C controllers. So I went ahead and
written my own fdt_i3c.c/h. Now it looks very different than fdt_i2c.c/h
because I've implemented only necessary functions to be used only in my project
that I can test.

Also I wanted a more generic fdt_i3c module that can be used to initialize
I3C controllers from FDT. Unlike fdt_i2c module which initializes the
i2c_adapter_drivers, fdt_i3c has no knowledge about the drivers. Given a
fdt_match, fdt_i3c only parses the FDT to look for relevant controllers and
make them ready to be used by the drivers (dw_i3c in my case).

Is this approach appropriate?

>
> The i3c.c/h and fdt_i3c.c/h should only add APIs or functions which are
> needed to keep the i3c support simple and minimalistic.

Agreed. I tried to do that. However, there is no i3c.c/h in my changes.

>
> >
> > I need your feedback on whether it's a good idea to add these modules
> > to OpenSBI. If you think it's appropriate then I will send out the
> > patches. If you think it should be implemented differently, please
> > suggest that too.
>
> Sure, please send your patches to this list (using git send-email).

Will do as soon as I complete my final testing and documentation.

>
> >
> > Thank you for your time and any valuable feedback on this.
> >
> > Best Regards,
> > Adnan Rahman Chowdhury
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
> Regards,
> Anup

