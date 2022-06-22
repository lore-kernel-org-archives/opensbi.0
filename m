From: Adnan Chowdhury <adnan.chowdhury@sifive.com>
Date: Wed, 22 Jun 2022 10:36:48 +0100
Subject: FDT based DesignWare I3C driver for the generic platform
Message-ID: <CAAsT5XoYO1=mvDydx_XB8SS6-SAUi2=RqC4veV57TwN0LGdohw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Team,

This is my first email to the list so please accept my apology if I'm
not clear about anything.

I've been working for an announced SoC. This piece of hardware comes
with a DesignWare I3C block. We'll be using OpenSBI in our software
stack for the SoC. The plan is to use OpenSBI's generic platform for
the project. I've written an FDT based I3C driver so that the
DesignWare I3C can be used. I've implemented it in two parts:

- fdt_i3c.c/h: A generic FDT I3C module that parses the FDT for the
presence of I3C controllers.
- dwc_i3c.c/h: This module has all the necessary functions that can be
used in our project (namely I2C private read/write), and is expandable
for adding more functionalities in the future. It uses fdt_i3c.c/h.

I need your feedback on whether it's a good idea to add these modules
to OpenSBI. If you think it's appropriate then I will send out the
patches. If you think it should be implemented differently, please
suggest that too.

Thank you for your time and any valuable feedback on this.

Best Regards,
Adnan Rahman Chowdhury

