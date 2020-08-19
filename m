From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Wed, 19 Aug 2020 11:07:08 +0000
Subject: K210 device tree
References: <88fefe7f-3899-ddf6-a581-7d134b12c64a@gmx.de>
 <CY4PR04MB375115E11727937719D17B33E75D0@CY4PR04MB3751.namprd04.prod.outlook.com>
 <0bb73955-42bd-034b-4a84-0f344d807c32@gmail.com>
Message-ID: <CY4PR04MB37513ACA754F4C6230341676E75D0@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/08/19 19:55, Sean Anderson wrote:
> On 8/19/20 3:52 AM, Damien Le Moal wrote:
>> On 2020/08/19 16:42, Heinrich Schuchardt wrote:
>>> Hello Sean,
>>>
>>> up to now separate device trees for the Kendryte K210 have been
>>> developed for OpenSBI, U-Boot, Linux.
>>>
>>> U-Boot can be booted with a device-tree provided by OpenSBI using
>>> CONFIG_OF_PRIOR_STAGE=y in U-Boot.
>>>
>>> Linux can also receive a device-tree from firmware.
>>
>> Yes, but the K210 FW does not give a device tree...
> 
> There is a device tree located at 0x8801d000. It only contains addresses
> and interrupts. Notably absent is the clock tree and pinctrl. Some of
> the properties (e.g. /cpu/timebase-frequency) are wrong. In addition,
> the memory is configured in a way which is impossible to boot with. I
> don't know if this tree is present in the firmware for non-sipeed
> boards.

Ah ! OK. I had not realized that. I have one KD233 development board from
Kendryte. Will try to see what the DT looks like there.

> 
>>
>>> So wouldn't it make sense to move all the K210 device-tree development
>>> into OpenSBI?
> 
> I have added a lot of information to the U-Boot device tree which is not
> strictly necessary for it to boot. This has been serving as a kind of
> "pseudo-documentation," because of the k210's abysmal first-party
> documentation. For example, I was able to easily find the address of the
> device tree because I documented it in the U-Boot device tree. I would
> like to keep this fleshed-out device tree in a repo I use frequently,
> which at the moment is U-Boot.
> 
>>
>> For the Linux case, opensbi is not needed for the K210. Not to say it cannot be
>> used, but right now the kernel does not assume it is there, same for U-boot.
> 
> I think Linux cannot boot with OpenSBI, since it uses the MMU if built in
> S-Mode.
> 
>> Direct boot of the kernel bin image is what's implemented for now. And for
>> U-boot, I think it would be the same: opensbi is not really needed at all, the
>> SoC flash can be updated with U-boot image which could then load the kernel from
>> SD card (is that working on the K210 ?).
> 
> Not yet :l
> 
>> All of the above can of course can be changed, but that would lead to some
>> memory waste with the K210, a rather very precious resource on that SoC :)
>>
>> That said, I would be happy to see the default device trees being in sync. For
>> the kernel side though, that means some work would be needed with the clock
>> drivers and initialization. Many of the peripherals clocks are currently not
>> initialized at all.
> 
> Definitely an area for improvement.

On my to-do list since a while ago... Storage stuff is keeping me super busy at
the moment :(


> 
> --Sean
> 


-- 
Damien Le Moal
Western Digital Research

