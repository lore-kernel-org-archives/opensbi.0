From: Sean Anderson <seanga2@gmail.com>
Date: Wed, 19 Aug 2020 07:48:49 -0400
Subject: K210 device tree
In-Reply-To: <CY4PR04MB37513ACA754F4C6230341676E75D0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <88fefe7f-3899-ddf6-a581-7d134b12c64a@gmx.de>
 <CY4PR04MB375115E11727937719D17B33E75D0@CY4PR04MB3751.namprd04.prod.outlook.com>
 <0bb73955-42bd-034b-4a84-0f344d807c32@gmail.com>
 <CY4PR04MB37513ACA754F4C6230341676E75D0@CY4PR04MB3751.namprd04.prod.outlook.com>
Message-ID: <42f8bde2-b47c-ccbe-f785-bff6809f7b75@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 8/19/20 7:07 AM, Damien Le Moal wrote:
> On 2020/08/19 19:55, Sean Anderson wrote:
>> On 8/19/20 3:52 AM, Damien Le Moal wrote:
>>> On 2020/08/19 16:42, Heinrich Schuchardt wrote:
>>>> Hello Sean,
>>>>
>>>> up to now separate device trees for the Kendryte K210 have been
>>>> developed for OpenSBI, U-Boot, Linux.
>>>>
>>>> U-Boot can be booted with a device-tree provided by OpenSBI using
>>>> CONFIG_OF_PRIOR_STAGE=y in U-Boot.
>>>>
>>>> Linux can also receive a device-tree from firmware.
>>>
>>> Yes, but the K210 FW does not give a device tree...
>>
>> There is a device tree located at 0x8801d000. It only contains addresses
>> and interrupts. Notably absent is the clock tree and pinctrl. Some of
>> the properties (e.g. /cpu/timebase-frequency) are wrong. In addition,
>> the memory is configured in a way which is impossible to boot with. I
>> don't know if this tree is present in the firmware for non-sipeed
>> boards.
> 
> Ah ! OK. I had not realized that. I have one KD233 development board from
> Kendryte. Will try to see what the DT looks like there.

I've attached what's on my board.

> 
>>
>>>
>>>> So wouldn't it make sense to move all the K210 device-tree development
>>>> into OpenSBI?
>>
>> I have added a lot of information to the U-Boot device tree which is not
>> strictly necessary for it to boot. This has been serving as a kind of
>> "pseudo-documentation," because of the k210's abysmal first-party
>> documentation. For example, I was able to easily find the address of the
>> device tree because I documented it in the U-Boot device tree. I would
>> like to keep this fleshed-out device tree in a repo I use frequently,
>> which at the moment is U-Boot.
>>
>>>
>>> For the Linux case, opensbi is not needed for the K210. Not to say it cannot be
>>> used, but right now the kernel does not assume it is there, same for U-boot.
>>
>> I think Linux cannot boot with OpenSBI, since it uses the MMU if built in
>> S-Mode.
>>
>>> Direct boot of the kernel bin image is what's implemented for now. And for
>>> U-boot, I think it would be the same: opensbi is not really needed at all, the
>>> SoC flash can be updated with U-boot image which could then load the kernel from
>>> SD card (is that working on the K210 ?).
>>
>> Not yet :l
>>
>>> All of the above can of course can be changed, but that would lead to some
>>> memory waste with the K210, a rather very precious resource on that SoC :)
>>>
>>> That said, I would be happy to see the default device trees being in sync. For
>>> the kernel side though, that means some work would be needed with the clock
>>> drivers and initialization. Many of the peripherals clocks are currently not
>>> initialized at all.
>>
>> Definitely an area for improvement.
> 
> On my to-do list since a while ago... Storage stuff is keeping me super busy a> the moment :(

When you get around to it, here's the binding I've been using [1], along
with the clock ids [2]. Note that the clock ids are completely
arbitrary, as there's no "natural" mapping of clocks to their registers.
Some ids are for logical clocks which don't have a corresponding
physical clock.  In particular, I have a patch [3] to add another clock
id, but I don't think any more will be necessary after that one. Let me
know if you see any issues with this setup; it will be easier to fix
things now when eveything is in one project.

--Sean

[1] https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/mfd/kendryte,k210-sysctl.txt
[2] https://gitlab.denx.de/u-boot/u-boot/-/blob/master/include/dt-bindings/clock/k210-sysctl.h
[3] https://patchwork.ozlabs.org/project/uboot/patch/20200729095636.1077054-6-seanga2 at gmail.com/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: maix.dts
Type: audio/vnd.dts
Size: 7591 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20200819/633eb268/attachment.dts>
