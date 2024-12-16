From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Dec 2024 14:27:47 +0530
Subject: [PATCH v2 00/17] RPMI and SBI MPXY support for OpenSBI
In-Reply-To: <5eecb6d2-7d66-43f0-8887-7d3dd7e52fd1@sifive.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
 <CAAhSdy36Rf4cyfhOK4Uo_=MfRgazpBc8JKO+xuoW0o3vAME4RQ@mail.gmail.com>
 <7a11f77f-d8a5-48df-be80-673399df3ba1@sifive.com> <CAAhSdy32OcL34Yvnf78C+mn0-phsXON3QoyS4Tz4Y-Dpi3NXzA@mail.gmail.com>
 <5eecb6d2-7d66-43f0-8887-7d3dd7e52fd1@sifive.com>
Message-ID: <CAAhSdy2jZ6t5SfJeqh_29HUTvQDnEk0Z3XjN+oKH24Q0ZTxvaw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 16, 2024 at 3:19?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Anup,
>
> On 2024-12-06 5:32 AM, Anup Patel wrote:
> > On Fri, Dec 6, 2024 at 10:38?AM Samuel Holland
> > <samuel.holland@sifive.com> wrote:
> >> On 2024-12-05 9:55 PM, Anup Patel wrote:
> >>> On Fri, Nov 29, 2024 at 9:21?PM Anup Patel <apatel@ventanamicro.com> wrote:
> >>>>
> >>>> This series adds RPMI and SBI MPXY support for OpenSBI. The RPMI service
> >>>> groups supported include system reset, system suspend, HSM, CPPC, and
> >>>> clock. The RPMI clock serivice group is exposed to supervisor software
> >>>> as an MPXY channel.
> >>>>
> >>>> These patches can also be found in the rpmi_mpxy_v2 branch at:
> >>>> https://github.com/avpatel/opensbi.git
> >>>>
> >>>> To test these patches, use the dev-upstream branch of the following repos:
> >>>> * https://github.com/ventanamicro/qemu.git
> >>>> * https://github.com/ventanamicro/linux.git
> >>>>
> >>>> To enable QEMU RPMI emulation (using librpmi) for virt machine, use
> >>>> "virt,rpmi=on" as the QEMU machine name.
> >>>>
> >>>> Changes since v1:
> >>>>  - Rebased on latest OpenSBI
> >>>>  - Use the recently introduced helpers for generic driver initialization
> >>>>  - Updated RPMI drivers to match the latest RPMI specification
> >>>>  - Don't support fixed number of channels in RPMI shared memory mailbox driver
> >>>>  - Added new patch9 for support RPMI HSM based FDT fixup
> >>>>  - Improved arrangment of barrier in __smq_rx() and __smq_tx()
> >>>>
> >>>> Anup Patel (8):
> >>>>   lib: utils/mailbox: Add generic mailbox library
> >>>>   lib: utils/mailbox: Add simple FDT based mailbox framework
> >>>>   lib: utils: Add simple FDT based system suspend driver framework
> >>>>   lib: utils/fdt: Allow dynamic registration of FDT fixup callbacks
> >>>>   lib: utils: Add simple FDT based HSM driver framework
> >>>>   lib: utils: Add simple FDT based CPPC driver framework
> >>>>   lib: sbi: Implement SBI MPXY extension
> >>>>   lib: utils: Add simple FDT based MPXY driver framework
> >>>>
> >>>> Rahul Pathak (5):
> >>>>   lib: Increase ROOT_REGION_MAX to accomodate more memregions
> >>>>   lib/utils: Add RPMI messaging protocol and shared memory transport
> >>>>     support
> >>>>   lib/utils: reset: Add RPMI System Reset driver
> >>>>   lib: sbi: Add SBI Message Proxy (MPXY) framework
> >>>>   lib: utils/mpxy: Add RPMI client driver for MPXY
> >>>>
> >>>> Subrahmanya Lingappa (4):
> >>>>   lib: utils/suspend: Add RPMI system suspend driver
> >>>>   lib: sbi: Add optional resume address to hart suspend
> >>>>   lib: utils/hsm: Add RPMI HSM driver
> >>>>   lib: utils/cppc: Add RPMI CPPC driver
> >>>
> >>> We plan to include the RPMI and MPXY drivers as experimental
> >>> for the upcoming OpenSBI v1.6 release at the end of this month.
> >>> There is still more work required in improving these drivers and
> >>> related frameworks but that can happen incrementally over time.
> >>
> >> I haven't taken the time to fully review this series yet because it's 5000 lines
> >> of new code and the RPMI spec isn't even frozen, but I have at least two major
> >> concerns.
> >
> > The v1 of this series is available on the OpenSBI mailing list since
> > 6th August 2024. Also, unlike kernel, OpenSBI only requires the
> > specs to be in a stable state for accepting patches as experimental.
> > This has been the policy for many years now.
>
> Alright, then this is my mistake for waiting too long to review the driver code.
> I generally assume that DT bindings will go through several iterations before
> being accepted, and binding changes will require updates to the driver code, so
> there's not much point in reviewing drivers until the bindings have stabilized.
>
> >> 1) Where is the documentation for the devicetree compatible strings added by
> >> this series? I don't see any attempt to get the bindings reviewed and accepted.
> >> https://lore.kernel.org/linux-devicetree/?q=rpmi shows nothing. This isn't
> >> something that can just be changed incrementally. It's not acceptable to break
> >> DT ABI. It's not okay to unilaterally make up a devicetree interface without
> >> documenting it and getting feedback through the appropriate process. This is
> >> especially true since OpenSBI isn't the owner of the RPMI spec.
> >
> > OpenSBI has accepted experimental drivers in the past and the
> > expectation is that people will update the bindings in OpenSBI
> > once finalized on LKML. The drivers being "experimental" means
> > users should assume that everything (including DT bindings) can
> > change.
>
> OK, if that is the policy, then we need to make it obvious which drivers are
> experimental, and which ones have stability guarantees. I sent a patch doing
> this, that I hope can be merged for v1.6:
>
> https://lists.infradead.org/pipermail/opensbi/2024-December/007830.html

Sure, I will look at this patch today.

>
> > We do have kernel RFC series in-development for getting early
> > feedback on device tree bindings and kernel drivers. I plan to
> > send it out this week or early next week.
>
> Thanks! That will be helpful. I don't think I've seen this series yet. Did I
> miss it?

My bad. I got derailed by the Linux IMSIC driver improvements. I have
send-out RFC series to LKML

>
> >> 2) OpenSBI absolutely must not claim to implement MPXY MSG_PROT_ID 0 (RPMI)
> >> version 1.0. That specification does not exist. RPMI is not frozen and is still
> >> actively undergoing changes. If this is an experimental MPXY protocol, it should
> >>  use an experimental message protocol ID.
> >
> > The whole SBI MPXY extension is experimental until the SBI v3.0
> > spec is frozen so RPMI v1.0 being accessed via SBI MPXY channel
> > is also experimental.
>
> OK, I can accept that the RPMI protocol version number is currently hidden
> behind other experimental functionality (SBI v3.0).
>
> >> I have no problem with merging experimental code and iterating on it, but such
> >> code must not create ABI surface that has stability guarantees.
> >
> > Historically, we have always accepted new SBI extensions as
> > experimental ABI once the corresponding SBI spec is stable
> > enough. We only change the advertised SBI spec version in
> > OpenSBI only after the SBI spec is frozen.
>
> Right, though now there is another dependency: because of the protocol version
> issue above, we must also wait until the RPMI spec is frozen and the
> implementation is no longer experimental before stabilizing SBI v3.0.

You are correct. Due to this reason, we have aligned the ratification
plan milestone dates for both SBI v3.0 and RPMI v1.0. Both these
specifications are currently under ARC review and hopefully both
will be frozen in the same time frame. We had done such alignment
in the past for SBI v2.0 and RISC-V ACPI FFH.

Regards,
Anup

