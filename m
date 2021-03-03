From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 3 Mar 2021 23:17:40 +0000
Subject: OpenSBI system reset device tree binding
In-Reply-To: <043ec927-f5d0-f328-90be-bc0b59ebdddf@gmx.de>
References: <a2837398-bee2-e2a0-3c06-3f134a26b243@gmx.de>
 <DM6PR04MB6201D48C853708356C2ACC488D989@DM6PR04MB6201.namprd04.prod.outlook.com>
 <043ec927-f5d0-f328-90be-bc0b59ebdddf@gmx.de>
Message-ID: <3D48F622-9B74-42BA-B0B8-BFEC0892669A@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3 Mar 2021, at 16:08, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> 
> On 03.03.21 10:06, Anup Patel wrote:
>> Hi Heinrich,
>> 
>>> -----Original Message-----
>>> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>> Sent: 03 March 2021 12:45
>>> To: Anup Patel <Anup.Patel@wdc.com>
>>> Cc: OpenSBI <opensbi@lists.infradead.org>
>>> Subject: OpenSBI system reset device tree binding
>>> 
>>> Hello Anup,
>>> 
>>> now that we have the system reset extension in OpenSBI the next logical
>>> step for me would be to implement a U-Boot driver using it to provide the
>>> UEFI ResetSystem() runtime service.
>> 
>> Yes, that's the right way.
>> 
>>> 
>>> Similarly a reset driver could be built into Linux.
>> 
>> I have already send-out couple of revision of Linux patches.
>> 
>> May be you can review that and take it as reference for U-Boot driver ??
> 
> Are you referring to this series:
> 
> https://patchwork.kernel.org/project/kvm/list/?series=427585 ?
> 
>> 
>>> 
>>> First thing that is needed is a device tree binding describing that we have an
>>> OpenSBI system reset available for the board. A comparable binding exists in
>>> the ARM world for PSCI. Cf.
>>> Documentation/devicetree/bindings/arm/psci.yaml in the Linux code.
>> 
>> The ARM world is bit different. The PSCI came late in ARM world so they
>> Have ARM 32bit systems which run without PSCI. Probably, that?s why PSCI
>> is detected/probed via DT node.
>> 
>>> 
>>> Has such a binding been defined for OpenSBI yet?
>> 
>> In RISC-V S-mode world, the SBI is assumed to be always there so we
>> don't need a DT node to detect SBI presence. Instead, we have SBI calls
>> to get SBI spec version and detect available SBI extensions. This also
>> simplify Guest/VM DT generation for hypervisors.
> 
> The OpenSBI project was started after RISC-V support entered U-Boot.
> Hence U-Boot can be built with and without SBI
> (qemu-riscv64_smode_defconfig vs qemu-riscv64_defconfig,
> sipeed_maix_bitm_defconfig vs sipeed_maix_smode_defconfig).
> 
> How would an operating system know if there is an SBI present if it is
> not stated in the device-tree?

If it's running in S-mode, there is an SBI implementation present. It's
that simple. It is *the* interface between S-mode and whatever's
running below it. The configs you speak of are for running in M-mode,
so SBI doesn't exist because you're not in S-mode.

> Once we know there is an SBI we can check if it has the reset extension.
> So this bit of information is not needed in the device-tree.

If you're an EFI implementation, you have S-mode and you can rely on
SBI being present. You do not need any detection.

Jess


