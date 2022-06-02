From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 2 Jun 2022 19:52:55 +0530
Subject: [RISC-V] [tech-unixplatformspec] SBI Debug Console Extension
 Proposal (Draft v1)
In-Reply-To: <CAG5apL1PfuCoYOVChaXO2wp93RnUifuxQZq1xebpNvH=BnXxrA@mail.gmail.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
 <CAK9=C2XXu9JpdsTLFiamQkgj_P6titwAohPdgwWUCm-xN8A2kw@mail.gmail.com>
 <5091667.6fTUFtlzNn@diego> <3070891.fEcJ0Lxnt5@diego> <CAK9=C2WETO-XJxTg1_jCLWaxkMJ8ubKkpeg3xKNnUvtJicrjyA@mail.gmail.com>
 <CAG5apL1PfuCoYOVChaXO2wp93RnUifuxQZq1xebpNvH=BnXxrA@mail.gmail.com>
Message-ID: <CAK9=C2XB3wBu0agiCfKZzN57waK6-0sq1emjwb2DG5m9V634xw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 2, 2022 at 6:29 PM Ved Shanbhogue <ved@rivosinc.com> wrote:
>
> Should we keep this simple in the SBI - only have register based inputs - to send and receive 1 byte in each call?
> Keeping it a simple out_byte or in_byte - a serial port like interface seems the simplest and most secure.

The legacy SBI v0.1 putchar() and getchar() are byte-level send/receive calls.

This is very slow for virtualized world particularly KVM RISC-V because each
SBI v0.1 putchar() or getchar() will trap to KVM RISC-V and KVM RISC-V will
forward it to user-space QEMU or KVMTOOL. This means each early print
character using SBI v0.1 putchar() will go all the way to host user-space and
come back. This is horribly slow for KVM Guest. This becomes further slower
for nested virtualization.

The MMIO based early prints are further worse because we have at least two
MMIO traps for every character where each MMIO exits to host user-space.

The shared memory based SBI puts() drastically reduces the number of SBI
traps hence reducing boot time with early prints enabled.

> I worry about bugs/security issues that can be caused by M-mode firmware accessing strings in untrusted memory.

The VirtIO based para-virt devices rely heavily on shared memory so I think
it is possible to address security concerns related to shared memory.

> The API as defined does not say whether the address is a virtual address or a physical address.

It is a physical address. I will clarify this in Draft v2.

> If it is a virtual address then the SBI call will need to use a MPRV load/store to gather this data and will also need to deal with page fault, access faults, etc. that may occur on such accesses.

Yes, MPRV (or HLV/HSV) based load/store have performance issues
particularly due to page faults. These are prevalent in some of the
legacy SBI v0.1 calls. With SBI v0.2 (or higher), we have tried to
ensure that we don't use virtual addresses as parameter in newer SBI
calls.

> Based on discussion it did not seem like it needs to be much fancier than this as this is for early OS/VMM code till it has enough functionality to directly interact with a uart.

The goal of the shared memory based SBI call for early prints is to
minimize the number of traps which in-turn helps virtualization to
drastically reduce boot-time.

Regards,
Anup

>
> regards
> ved
>
>
>
> On Thu, Jun 2, 2022 at 7:43 AM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> On Thu, Jun 2, 2022 at 2:58 PM Heiko St?bner <heiko@sntech.de> wrote:
>> >
>> > Am Donnerstag, 2. Juni 2022, 10:50:56 CEST schrieb Heiko St?bner:
>> > > Am Donnerstag, 2. Juni 2022, 10:47:58 CEST schrieb Anup Patel:
>> > > > On Thu, Jun 2, 2022 at 12:02 AM Heiko St?bner <heiko@sntech.de> wrote:
>> > > > >
>> > > > > Hi Anup,
>> > > > >
>> > > > > Am Mittwoch, 1. Juni 2022, 18:17:32 CEST schrieb Anup Patel:
>> > > > > > Hi All,
>> > > > > >
>> > > > > > Below is the draft proposal for SBI Debug Console Extension.
>> > > > > >
>> > > > > > Please review it and provide feedback.
>> > > > > >
>> > > > > > Thanks,
>> > > > > > Anup
>> > > > > >
>> > > > > > Debug Console Extension (EID #0x4442434E "DBCN")
>> > > > > > ================================================
>> > > > > >
>> > > > > > The debug console extension defines a generic mechanism for boot-time
>> > > > > > early prints from supervisor-mode software which allows users to catch
>> > > > > > boot-time issues in supervisor-mode software.
>> > > > > >
>> > > > > > This extension replaces legacy console putchar (EID #0x01) extension
>> > > > > > and it is better in following ways:
>> > > > > > 1) It follows the new calling convention defined for SBI v1.0
>> > > > > >    (or higher).
>> > > > > > 2) It is based on a shared memory area between SBI implementation
>> > > > > >    and supervisor-mode software so multiple characters can be
>> > > > > >    printed using a single SBI call.
>> > > > > >
>> > > > > > The supervisor-mode software must set the shared memory area before
>> > > > > > printing characters on the debug console. Also, all HARTs share the
>> > > > > > same shared memory area so only one HART needs to set it at boot-time.
>> > > > > >
>> > > > > > Function: Set Console Area (FID #0)
>> > > > > > -----------------------------------
>> > > > > >
>> > > > > > struct sbiret sbi_debug_console_set_area(unsigned long addr_div_by_4,
>> > > > > >                                          unsigned long size)
>> > > > > >
>> > > > > > Set the shared memory area specified by `addr_div_by_2` and `size`
>> > > > >
>> > > > > typo in the "div_by_2" (not 4 like below and in the function itself) ?
>> > > > >
>> > > > >
>> > > > > > parameters. The `addr_div_by_4` parameter is base address of the
>> > > > > > shared memory area right shifted by 2 whereas `size` parameter is
>> > > > > > the size of shared memory area in bytes.
>> > > > > >
>> > > > > > The shared memory area should be normal cacheable memory for the
>> > > > > > supervisor-mode software. Also, the shared memory area is global
>> > > > > > across all HARTs so SBI implementation must ensure atomicity in
>> > > > > > setting the shared memory area.
>> > > > > >
>> > > > > > Errors:
>> > > > > > SBI_SUCCESS                - Shared memory area set successfully.
>> > > > > > SBI_ERR_INVALID_ADDRESS - The shared memory area pointed by
>> > > > > >                           `addr_div_by_2` and `size` parameters
>> > > > > >                           is not normal cacheable memory or not
>> > > > > >                           accessible to supervisor-mode software.
>> > > > > >
>> > > > > > Function: Console Puts (FID #1)
>> > > > > > -------------------------------
>> > > > > >
>> > > > > > struct sbiret sbi_debug_console_puts(unsigned long area_offset,
>> > > > > >                                      unsigned long num_chars)
>> > > > > >
>> > > > > > Print the string specified by `area_offset` and `num_chars` on
>> > > > > > the debug console. The `area_offset` parameter is the start of
>> > > > > > string in the shard memory area whereas `num_chars` parameter
>> > > > > > is the number of characters (or bytes) in the string.
>> > > > > >
>> > > > > > This is a blocking SBI call and will only return after printing
>> > > > > > all characters of the string.
>> > > > > >
>> > > > > > Errors:
>> > > > > > SBI_SUCCESS                - Characters printed successfully.
>> > > > > > SBI_ERR_INVALID_ADDRESS    - The start of the string (i.e.
>> > > > > >                           `area_offset`) or end of the string
>> > > > > >                           (i.e. `area_offset + num_chars`) is
>> > > > > >                           outside shared memory area.
>> > > > >
>> > > > > This will vastly reduce the number of needed ecalls when outputting
>> > > > > characters, so this will probably improve performance quite a bit :-)
>> > > > >
>> > > > >
>> > > > > I guess I still would like to have an _additional_ single-character
>> > > > > putc call. As mentioned in the other thread [0], especially on consumer
>> > > > > hardware [where there is no elaborate debug infrastructure] this can
>> > > > > be a very handy debugging tool even in the earliest stages of a
>> > > > > booting kernel (both before relocation and even inside the startup
>> > > > > assembly).
>> > > > >
>> > > > > I.e. just doing a
>> > > > >         li a7, 1
>> > > > >         li a6, 0
>> > > > >         li a0, 36
>> > > > >         ecall
>> > > > >
>> > > > > in any kernel assembly will just output a "$" character right now, without
>> > > > > needing any preparation at all - same with using the current
>> > > > > sbi_console_putchar() directly in c-code.
>> > > > >
>> > > > > This _can_ be very helpful in some cases, so I guess it would be nice
>> > > > > to keep such a functionality around also in the new spec.
>> > > >
>> > > > You can easily create multiple pre-populated strings using ".asciiz" in
>> > > > assembly sources. Just set the base address of pre-populated strings
>> > > > once on boot hart and print from anywhere using usual 4-5 instruction
>> > > > (similar to what posted above).
>> > >
>> > > ok, sounds like a plan as well :-)
>> >
>> > though, how does that relate to the time before MMU setup?
>> >
>> > I.e. in response to Heinrich's mail you talk about svpbmt, so I guess you
>> > expect virtual memory there, so what is the expected value-type before
>> > the mmu is setup in S-mode ?
>>
>> The memory type should be 0 (i.e. PMA) for the shared memory between
>> SBI implementation and supervisor software. Before MMU setup, the
>> memory type is by default 0 (i.e. PMA) so we don't have to mandate
>> any memory type for MMU disabled case.
>>
>> We only have issue on systems with Svpmbt where supervisor software
>> can potentially map the shared memory as non-cacheable or IO (memory
>> type != 0) using PTE memory type bits.
>>
>> In addition to above, a SBI implementation must ensure that the shared
>> memory address provided by supervisor software is a regular memory
>> (not MMIO device). This can be easily achieved in OpenSBI, KVM RISC-V,
>> and various hypervisors.
>>
>> Regards,
>> Anup
>>
>> >
>> >
>> > > > > [0] http://lists.infradead.org/pipermail/opensbi/2022-June/002796.html
>> > > > >
>> > > > >
>> > > > >
>> > > >
>> > > > Regards,
>> > > > Anup
>> > > >
>> > >
>> > >
>> >
>> >
>> >
>> >
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#1721): https://lists.riscv.org/g/tech-unixplatformspec/message/1721
>> Mute This Topic: https://lists.riscv.org/mt/91480122/6317211
>> Group Owner: tech-unixplatformspec+owner at lists.riscv.org
>> Unsubscribe: https://lists.riscv.org/g/tech-unixplatformspec/unsub [ved at rivosinc.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

