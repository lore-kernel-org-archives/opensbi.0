From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Aug 2020 16:32:35 +0530
Subject: K210 device tree
In-Reply-To: <88fefe7f-3899-ddf6-a581-7d134b12c64a@gmx.de>
References: <88fefe7f-3899-ddf6-a581-7d134b12c64a@gmx.de>
Message-ID: <CAAhSdy3SGwCjrbiffNj6si=fGx5QpJU1aUKcA2K=paRtNXpiyA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 19, 2020 at 1:17 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> Hello Sean,
>
> up to now separate device trees for the Kendryte K210 have been
> developed for OpenSBI, U-Boot, Linux.
>
> U-Boot can be booted with a device-tree provided by OpenSBI using
> CONFIG_OF_PRIOR_STAGE=y in U-Boot.

I suggest we should have two defconfigs in U-Boot for Kendryte. One
for U-Boot M-mode and another for U-Boot S-mode.

Even if we can't boot Linux S-mode on Kendryte, still user can use
U-Boot S-mode to run standalone /baremetal applications in S-mode
using U-Boot.

Regards,
Anup

>
> Linux can also receive a device-tree from firmware.
>
> So wouldn't it make sense to move all the K210 device-tree development
> into OpenSBI?
>
> Best regards
>
> Heinrich
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

