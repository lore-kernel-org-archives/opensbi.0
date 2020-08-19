From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Wed, 19 Aug 2020 07:52:20 +0000
Subject: K210 device tree
References: <88fefe7f-3899-ddf6-a581-7d134b12c64a@gmx.de>
Message-ID: <CY4PR04MB375115E11727937719D17B33E75D0@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/08/19 16:42, Heinrich Schuchardt wrote:
> Hello Sean,
> 
> up to now separate device trees for the Kendryte K210 have been
> developed for OpenSBI, U-Boot, Linux.
> 
> U-Boot can be booted with a device-tree provided by OpenSBI using
> CONFIG_OF_PRIOR_STAGE=y in U-Boot.
> 
> Linux can also receive a device-tree from firmware.

Yes, but the K210 FW does not give a device tree...

> So wouldn't it make sense to move all the K210 device-tree development
> into OpenSBI?

For the Linux case, opensbi is not needed for the K210. Not to say it cannot be
used, but right now the kernel does not assume it is there, same for U-boot.
Direct boot of the kernel bin image is what's implemented for now. And for
U-boot, I think it would be the same: opensbi is not really needed at all, the
SoC flash can be updated with U-boot image which could then load the kernel from
SD card (is that working on the K210 ?).

All of the above can of course can be changed, but that would lead to some
memory waste with the K210, a rather very precious resource on that SoC :)

That said, I would be happy to see the default device trees being in sync. For
the kernel side though, that means some work would be needed with the clock
drivers and initialization. Many of the peripherals clocks are currently not
initialized at all.

> 
> Best regards
> 
> Heinrich
> 


-- 
Damien Le Moal
Western Digital Research

