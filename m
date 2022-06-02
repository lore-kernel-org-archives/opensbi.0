From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 2 Jun 2022 13:38:28 +0530
Subject: [RISC-V] [tech-unixplatformspec] [sig-hypervisors] SBI Debug
 Console Extension Proposal (Draft v1)
In-Reply-To: <20220601182126.xnv5w2y4yhy2s6tk@rivosinc.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
 <20220601182126.xnv5w2y4yhy2s6tk@rivosinc.com>
Message-ID: <CAK9=C2UpSB3GtRf9B-KU5m0Y=2=o7HvK6-q0kncF4X4=JRAdTw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 1, 2022 at 11:51 PM Dylan Reid <dylan@rivosinc.com> wrote:
>
> On Wed, Jun 01, 2022 at 09:47:32PM +0530, Anup Patel wrote:
> > Hi All,
> >
> > Below is the draft proposal for SBI Debug Console Extension.
> >
> > Please review it and provide feedback.
> >
> > Thanks,
> > Anup
> >
> > Debug Console Extension (EID #0x4442434E "DBCN")
> > ================================================
> >
> > The debug console extension defines a generic mechanism for boot-time
> > early prints from supervisor-mode software which allows users to catch
> > boot-time issues in supervisor-mode software.
> >
> > This extension replaces legacy console putchar (EID #0x01) extension
> > and it is better in following ways:
>
> Thanks, it will be nice to drop putchar.
>
> > 1) It follows the new calling convention defined for SBI v1.0
> >    (or higher).
> > 2) It is based on a shared memory area between SBI implementation
> >    and supervisor-mode software so multiple characters can be
> >    printed using a single SBI call.
> >
> > The supervisor-mode software must set the shared memory area before
> > printing characters on the debug console. Also, all HARTs share the
> > same shared memory area so only one HART needs to set it at boot-time.
> >
> > Function: Set Console Area (FID #0)
> > -----------------------------------
> >
> > struct sbiret sbi_debug_console_set_area(unsigned long addr_div_by_4,
> >                                          unsigned long size)
> >
> > Set the shared memory area specified by `addr_div_by_2` and `size`
> > parameters. The `addr_div_by_4` parameter is base address of the
> > shared memory area right shifted by 2 whereas `size` parameter is
> > the size of shared memory area in bytes.
> >
> > The shared memory area should be normal cacheable memory for the
> > supervisor-mode software. Also, the shared memory area is global
> > across all HARTs so SBI implementation must ensure atomicity in
> > setting the shared memory area.
> >
> > Errors:
> > SBI_SUCCESS                - Shared memory area set successfully.
> > SBI_ERR_INVALID_ADDRESS - The shared memory area pointed by
> >                           `addr_div_by_2` and `size` parameters
> >                           is not normal cacheable memory or not
> >                           accessible to supervisor-mode software.
> >
> > Function: Console Puts (FID #1)
> > -------------------------------
> >
> > struct sbiret sbi_debug_console_puts(unsigned long area_offset,
> >                                      unsigned long num_chars)
>
> What is the motivation for `area_offset`? Will the supervisor use
> different offsets for different harts?

There are variety of ways in which supervisor software can use
tarea_offset:
1) Use lock to serialize access to shared memory and always
use fixed offset (maybe zero) from all HARTs
2) No lock to protect shared memory and instead each HART
will use separate offsets to print

In addition to above, bare-metal test code (or assembly sources)
can have pre-populated strings (i.e. "PASS", "FAIL", "ERROR", etc)
in shared memory and simply use different offsets to print different
strings.

>
> What are the advantages and disadvantages of the offset vs. using a ring
> buffer for example?

Mandating a ring on shared memory will make things complicated
for bare metal test code (or assembly sources). Also, there is no
scheduler in M-mode firmware to have worker thread for consuming
bytes from a ring.

The "area_offset" is relatively more flexible in this case because it
allows sophisticated supervisor software to create ring on shared
memory without the SBI implementation knowing about it where:
1) The head & tail will be maintained by supervisor software
2) supervisor software will have a consumer thread to consume
bytes from ring and print using puts()

>
> >
> > Print the string specified by `area_offset` and `num_chars` on
> > the debug console. The `area_offset` parameter is the start of
> > string in the shard memory area whereas `num_chars` parameter
> > is the number of characters (or bytes) in the string.
> >
> > This is a blocking SBI call and will only return after printing
> > all characters of the string.
> >
> > Errors:
> > SBI_SUCCESS                - Characters printed successfully.
> > SBI_ERR_INVALID_ADDRESS    - The start of the string (i.e.
> >                           `area_offset`) or end of the string
> >                           (i.e. `area_offset + num_chars`) is
> >                           outside shared memory area.
> >
> >
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1709): https://lists.riscv.org/g/tech-unixplatformspec/message/1709
> Mute This Topic: https://lists.riscv.org/mt/91482999/1774265
> Group Owner: tech-unixplatformspec+owner at lists.riscv.org
> Unsubscribe: https://lists.riscv.org/g/tech-unixplatformspec/unsub [apatel at ventanamicro.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

Regards,
Anup

