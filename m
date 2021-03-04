From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Mar 2021 08:50:38 +0530
Subject: OpenSBI system reset device tree binding
In-Reply-To: <043ec927-f5d0-f328-90be-bc0b59ebdddf@gmx.de>
References: <a2837398-bee2-e2a0-3c06-3f134a26b243@gmx.de>
 <DM6PR04MB6201D48C853708356C2ACC488D989@DM6PR04MB6201.namprd04.prod.outlook.com>
 <043ec927-f5d0-f328-90be-bc0b59ebdddf@gmx.de>
Message-ID: <CAAhSdy1Zj7RqVL0-WYyOo9Kvyg9qarA7699Qrao+xVckmy+eUQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 4, 2021 at 4:38 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 03.03.21 10:06, Anup Patel wrote:
> > Hi Heinrich,
> >
> >> -----Original Message-----
> >> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >> Sent: 03 March 2021 12:45
> >> To: Anup Patel <Anup.Patel@wdc.com>
> >> Cc: OpenSBI <opensbi@lists.infradead.org>
> >> Subject: OpenSBI system reset device tree binding
> >>
> >> Hello Anup,
> >>
> >> now that we have the system reset extension in OpenSBI the next logical
> >> step for me would be to implement a U-Boot driver using it to provide the
> >> UEFI ResetSystem() runtime service.
> >
> > Yes, that's the right way.
> >
> >>
> >> Similarly a reset driver could be built into Linux.
> >
> > I have already send-out couple of revision of Linux patches.
> >
> > May be you can review that and take it as reference for U-Boot driver ??
>
> Are you referring to this series:
>
> https://patchwork.kernel.org/project/kvm/list/?series=427585 ?

This particular series is about implementing SBI v0.2 specification for the
KVM RISC-V hypervisor.

I am referring to this patch:
https://patchwork.kernel.org/project/linux-riscv/patch/20210301115833.382364-1-anup.patel at wdc.com/

>
> >
> >>
> >> First thing that is needed is a device tree binding describing that we have an
> >> OpenSBI system reset available for the board. A comparable binding exists in
> >> the ARM world for PSCI. Cf.
> >> Documentation/devicetree/bindings/arm/psci.yaml in the Linux code.
> >
> > The ARM world is bit different. The PSCI came late in ARM world so they
> > Have ARM 32bit systems which run without PSCI. Probably, that?s why PSCI
> > is detected/probed via DT node.
> >
> >>
> >> Has such a binding been defined for OpenSBI yet?
> >
> > In RISC-V S-mode world, the SBI is assumed to be always there so we
> > don't need a DT node to detect SBI presence. Instead, we have SBI calls
> > to get SBI spec version and detect available SBI extensions. This also
> > simplify Guest/VM DT generation for hypervisors.
>
> The OpenSBI project was started after RISC-V support entered U-Boot.
> Hence U-Boot can be built with and without SBI
> (qemu-riscv64_smode_defconfig vs qemu-riscv64_defconfig,
> sipeed_maix_bitm_defconfig vs sipeed_maix_smode_defconfig).

The SBI specification is independent of the OpenSBI project. The oldest
SBI implementation is BBL (https://github.com/riscv/riscv-pk) which is
still at SBI v0.1 specification. The OpenSBI project is a SBI implementation
from scratch and designed for using with various bootloaders (such as
U-Boot, EDK2, or standalone).

The OpenSBI project is not only for U-Boot. In fact, even EDK2 project
uses OpenSBI. There are lot of FPGA platforms which have no boot-loader
and use OpenSBI to boot kernel directly without boot-loaders.

The U-Boot M-mode and U-Boot SPL does not have SBI because both
are running directly in M-mode but U-Boot S-mode always has some
M-mode firmware (OpenSBI) running in background so U-Boot S-mode
always has SBI calls.

The EFI implementation of U-Boot S-mode and EDK2 both run in
S-mode so these EFI implementations can always use SBI calls.

>
> How would an operating system know if there is an SBI present if it is
> not stated in the device-tree?

All S-mode operating systems (Linux, FreeBSD, and other BSD variants,
etc) and HS-mode hypervisors (Xvisor, KVM, Bao, etc).

>
> Once we know there is an SBI we can check if it has the reset extension.
> So this bit of information is not needed in the device-tree.

Linux kernel does this as follows:
1) SBI is always there so try to read SBI spec version
2) If SBI spec version is v0.1 then we have only legacy SBI calls
    so no SBI extensions available
3) If SBI spec version is v0.2 or higher then we can check for
    any SBI extension.

Regards,
Anup

