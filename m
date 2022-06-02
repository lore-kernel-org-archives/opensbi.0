From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 2 Jun 2022 11:55:12 -0700
Subject: [RISC-V][tech-os-a-see] [RISC-V] [tech-unixplatformspec] SBI
 Debug Console Extension Proposal (Draft v1)
In-Reply-To: <CAK9=C2UV4WT-wK0TQh2c1EUYMmSHm0rAgFFz7mtN75ZPQkjb-A@mail.gmail.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
 <CAK9=C2XXu9JpdsTLFiamQkgj_P6titwAohPdgwWUCm-xN8A2kw@mail.gmail.com>
 <5091667.6fTUFtlzNn@diego> <3070891.fEcJ0Lxnt5@diego> <CAK9=C2WETO-XJxTg1_jCLWaxkMJ8ubKkpeg3xKNnUvtJicrjyA@mail.gmail.com>
 <CAG5apL1PfuCoYOVChaXO2wp93RnUifuxQZq1xebpNvH=BnXxrA@mail.gmail.com>
 <CAK9=C2XB3wBu0agiCfKZzN57waK6-0sq1emjwb2DG5m9V634xw@mail.gmail.com>
 <YpjQkMhoKuoCj/Do@ved-XPS-8940> <CAK9=C2UV4WT-wK0TQh2c1EUYMmSHm0rAgFFz7mtN75ZPQkjb-A@mail.gmail.com>
Message-ID: <CAHBxVyEQOGOLM=cCDWvVfidS+4SoecVM2T6gbF48VuRCiirExQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 2, 2022 at 8:18 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Thu, Jun 2, 2022 at 8:30 PM Ved Shanbhogue <ved@rivosinc.com> wrote:
> >
> > On Thu, Jun 02, 2022 at 07:52:55PM +0530, Anup Patel wrote:
> > >On Thu, Jun 2, 2022 at 6:29 PM Ved Shanbhogue <ved@rivosinc.com> wrote:
> > >This is very slow for virtualized world particularly KVM RISC-V because each
> > >SBI v0.1 putchar() or getchar() will trap to KVM RISC-V and KVM RISC-V will
> > >forward it to user-space QEMU or KVMTOOL. This means each early print
> > >character using SBI v0.1 putchar() will go all the way to host user-space and
> > >come back. This is horribly slow for KVM Guest. This becomes further slower
> > >for nested virtualization.
> > >
> > Since this is for debug and really early phase debug till enough of the guest
> > boots up to use a VFIO based char driver provided by the VMM, I am not sure
> > that the slowness matters.
> > Even this SBI call I expected the VMM to intercept and if the VMM has all
> > emulation in the user space VMM - e.g. the console tty is open by the user
> > space VMM, I am not sure this would avoid that trip to user space.
> > If the motivation is primarily VM debug then perhaps a standardized set of
> > hypercalls implemented by KVM makes more sense than SBI calls that would
> > need to be built into the M-mode firmware?
>
> We have a requirement in the OS-A platform spec to mandate a particular type
> of UART for early prints but there were objections on selecting one type of UART
> over another.
>
> This SBI debug console extension is also a way to avoid standardizing a
> particular type of UART in OS-A platform spec.
>
> >
> > >
> > >> I worry about bugs/security issues that can be caused by M-mode firmware accessing strings in untrusted memory.
> > >
> > >The VirtIO based para-virt devices rely heavily on shared memory so I think
> > >it is possible to address security concerns related to shared memory.
> >
> > Yes, and now that I understand the motivation better why dont we define this
> > as a hypercall/pv-ops interface to a VMM than a SBI call to the M-mode
> > firmware and needing to build a virt-io like framework in firmware.
>
> The VirtIO framework has rings in shared memory but over here it is just
> shared memory without any formatted data structure.
>
> >
> > >
> > >> The API as defined does not say whether the address is a virtual address or a physical address.
> > >
> > >It is a physical address. I will clarify this in Draft v2.
> > >
> > Thanks. I was not sure since we had all the discussion about Svpbmt.
> >
> > >
> > >> Based on discussion it did not seem like it needs to be much fancier than this as this is for early OS/VMM code till it has enough functionality to directly interact with a uart.
> > >
> > >The goal of the shared memory based SBI call for early prints is to
> > >minimize the number of traps which in-turn helps virtualization to
> > >drastically reduce boot-time.
> > >
> >
> > Understand that better now. But if that is the main motivation then
> > I am not understanding why we would want to push all of this into
> > M-mode firmware vs. defining a set of standardized pv-ops to be used
> > by guest OSes.
>
> The SBI debug console also provides a standard way of early prints for
> supervisor software running natively (directly under M-mode) irrespective
> of the type of UART/Console available on the console so it's not just
> for a virtualized world. Although, the virtualized world has an added
> performance advantage due to reduced traps.
>

It's also helpful in early board bringup and early debugging as
pointed out by Heiko as well.
To address some of the concerns raised above, how about putting some
restrictions on sbi_debug_console_set_area ?

1. Instead of any size, restrict the shared memory region to a fixed
size (256 byte should be enough for early prints) ?
It is still a common area across all harts. Thus, atomicity needs to
be ensured by the M-mode or HS mode.
We may explore setting up a per-heart area to avoid synchronization
issues but platforms with large hart counts may have to
share multiple pages depending on the page size.

2. The shared memory region should be set up only once during a boot
cycle. Any further invocation of sbi_debug_console_set_area
should return appropriate errors.

If the per heart shared memory region approach is preferred, the above
restriction applies once per hart.

> Regards,
> Anup
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#31): https://lists.riscv.org/g/tech-os-a-see/message/31
> Mute This Topic: https://lists.riscv.org/mt/91498450/1774178
> Group Owner: tech-os-a-see+owner at lists.riscv.org
> Unsubscribe: https://lists.riscv.org/g/tech-os-a-see/leave/11230180/1774178/2121601819/xyzzy [atishp at rivosinc.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

