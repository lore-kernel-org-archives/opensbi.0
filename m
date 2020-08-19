From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Aug 2020 17:04:31 +0530
Subject: K210 device tree
In-Reply-To: <97a5755a-d09e-c0a3-0d53-5c08e4ed5fc7@gmx.de>
References: <88fefe7f-3899-ddf6-a581-7d134b12c64a@gmx.de>
 <CAAhSdy3SGwCjrbiffNj6si=fGx5QpJU1aUKcA2K=paRtNXpiyA@mail.gmail.com>
 <97a5755a-d09e-c0a3-0d53-5c08e4ed5fc7@gmx.de>
Message-ID: <CAAhSdy1Jg+uRNMh6+MQH-ETyrhS9JsOJgMau2Eh8Rkw4fU0-Yw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 19, 2020 at 4:40 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 19.08.20 13:02, Anup Patel wrote:
> > On Wed, Aug 19, 2020 at 1:17 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>
> >> Hello Sean,
> >>
> >> up to now separate device trees for the Kendryte K210 have been
> >> developed for OpenSBI, U-Boot, Linux.
> >>
> >> U-Boot can be booted with a device-tree provided by OpenSBI using
> >> CONFIG_OF_PRIOR_STAGE=y in U-Boot.
> >
> > I suggest we should have two defconfigs in U-Boot for Kendryte. One
> > for U-Boot M-mode and another for U-Boot S-mode.
>
> See:
> [PATCH 1/1] configs: defconfig for Sipeed Maix in S-mode
> https://lists.denx.de/pipermail/u-boot/2020-August/423470.html

Ahh, thanks. I did not realize you already sent patches.

>
> Here I have not enabled CONFIG_OF_PRIOR_STAGE yet because of the missing
> elements in the OpenSBI device tree.

Cool, I will be merging your OpenSBI DT patch tomorrow.

Regards,
Anup

