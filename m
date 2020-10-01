From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 1 Oct 2020 11:05:57 -0700
Subject: OpenSBI: Boot HART ISA display
In-Reply-To: <af787708-1b31-2e67-fd45-9e30f2863dda@gmx.de>
References: <3e977253-0836-e76f-964b-49b7f2541fde@gmx.de>
 <CAOnJCULFvSArogZzzHLN-QW+2D7nPWh7JcxSUcxMOprnJVK-zQ@mail.gmail.com>
 <46daebe0-4099-c2a6-54ab-0010a0317b3e@gmx.de>
 <CAOnJCUKnY0fLZr6OjD5SWF8Fbk8vCQtWgniJanJrGZtPZW3NnQ@mail.gmail.com>
 <01c4c704e0672a755483ca7124ca691047ffc7b7.camel@wdc.com>
 <915a8ca70d5d0ab737d22d6199a9c8ce1b4dd75b.camel@wdc.com>
 <19cc6098-2816-59d6-20b1-c9c19b43354a@gmx.de>
 <07f615f0-7f2e-a04c-36d8-ff5395b03194@gmx.de>
 <CAOnJCU+aTdARckrmGkmPSeayvT4Wo=Wkznh7LYX63RnpHykTtg@mail.gmail.com>
 <af787708-1b31-2e67-fd45-9e30f2863dda@gmx.de>
Message-ID: <CAOnJCUKf38UTb-q5+cHMB_bMri8StXHZ9M+OCNhiLKtT_1_cDw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 30, 2020 at 4:27 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 9/30/20 9:12 PM, Atish Patra wrote:
> > On Wed, Sep 30, 2020 at 4:12 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>
> >> On 30.09.20 10:45, Heinrich Schuchardt wrote:
> >>> On 30.09.20 10:22, Damien Le Moal wrote:
> >>>> On Wed, 2020-09-30 at 14:08 +0900, Damien Le Moal wrote:
> >>>>> On Tue, 2020-09-29 at 13:38 -0700, Atish Patra wrote:
> >>>>>> On Tue, Sep 29, 2020 at 12:38 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>>>>>> On 9/29/20 9:05 PM, Atish Patra wrote:
> >>>>>>>> On Mon, Sep 28, 2020 at 3:18 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>>>>>>>> Hello Atish,
> >>>>>>>>>
> >>>>>>>>> on the Kendryte 210 MaixDuino the OpenSBI output line
> >>>>>>>>>
> >>>>>>>>> Boot HART ISA       : rv64cicacsidcacsi
> >>>>>>>>>
> >>>>>>>>> looks a bit strange to me (see full output at the end of the mail).
> >>>>>>>>
> >>>>>>>> Yeah. It doesn't make any sense.
> >>>>>>>>
> >>>>>>>>> Assuming that the characters after rv64 are related to extensions I
> >>>>>>>>> would expect every letter appearing only once.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> That's correct. See 3.1.1. Machine ISA Register misa in priv spec.
> >>>>>>>>
> >>>>>>>>> I tried to add sbi_printf() statements to lib/sbi/riscv_asm.c but they
> >>>>>>>>> do not print out correctly.
> >>>>>>>>>
> >>
> >> <snip />
> >>
> >> In build/platform/kendryte/k210/firmware/fw_payload.bin the string for
> >> the extensions
> >>
> >> valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg"
> >>
> >> directly follows the embedded device tree:
> >>
> >> .......................n........................
> >> ....#address-cells.#size-cells.compatible.bootar
> >> gs.device_type.clock-frequency.i-cache-size.d-ca
> >> che-size.mmu-type.reg.riscv,isa.status.#interrup
> >> cells.interrupt-controller.linux,phandle.inter
> >> rupts-extended......iemafdqclbjtpvnsuhkorwxyzg..
> >> .*..z*..t*..n*..h*..b*..\*..V*..P*..J*..D*..>*..
> >>
> >> When running fixups the device-tree becomes longer.
> >>
> >> Whenever we do device-tree fixups we have to copy the device tree to a
> >> different memory location with enough space for the fixups or we need
> >> the linker script to leave enough space.
> >>
> > Thanks for getting to the bottom of this issue. But does this issue
> > solve the test payload issue Damien was facing ?
> >
> > Looking at the fw_payload.bin, DT ends at 0x10d10 and payload starts
> > at 0x14000. The .rodata sections of the payload
> > starts at 0x15000. This is where the string in the payload resides. We
> > expand the DT by 1056 bytes. The payload section
> > is almost after 3KiB.
> >
> > Do we still have another issue that corrupts data/bass sections of
> > payload running in S-mode?
> >
> >> If OpenSBI is run from a NOR flash anyway we first have to copy the
> >> device-tree to RAM before we can do any fixup.
> >>
> >> Which way should we go:
> >> - allocate space for a copy of the fdt with sbi_scratch_alloc_offset, or
> >> - change the linker script to leave 1 KiB free space after the dtb
> >>
> >
> > Currently, we expand the DT by 1024 + 32. So it has to be more than 1KB.
>
> Atish, thanks for that hint. Yes 1024 fdt_reserved_memory_fixup() and 32
> in fdt_cpu_fixup(). Aren't those fdt_open_into() calls bound to fail
> because fdt == buf and bufsize < 2 * fdtsize?
>

In the current cases, it just fdt_move gets called before this.
Even if it reaches this check, it will not fail as bufsize > newsize.

> /* First attempt to build converted tree at beginning of buffer */
> tmp = buf;
> /* But if that overlaps with the old tree... */
> if (((tmp + newsize) > fdtstart) && (tmp < fdtend)) {
>         /* Try right after the old tree instead */
>         tmp = (char *)(uintptr_t)fdtend;
>         if ((tmp + newsize) > ((char *)buf + bufsize))
>                return -FDT_ERR_NOSPACE;  <<<<<<<<<<<<<<<<<<<<<<<<<<<<
> }
>
> My questions was if we should make a full copy or if we should try to
> reserve memory inside the OpenSBI binary. What is your preference?
>

I see you have already sent that patch. I prefer the binary approach as well.

> Best regards
>
> Heinrich
>
> >
> >> Best regards
> >>
> >> Heinrich
> >
> >
> >
>


-- 
Regards,
Atish

