From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 2 Jun 2022 14:17:58 +0530
Subject: SBI Debug Console Extension Proposal (Draft v1)
In-Reply-To: <5286636.29KlJPOoH8@diego>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
 <5286636.29KlJPOoH8@diego>
Message-ID: <CAK9=C2XXu9JpdsTLFiamQkgj_P6titwAohPdgwWUCm-xN8A2kw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 2, 2022 at 12:02 AM Heiko St?bner <heiko@sntech.de> wrote:
>
> Hi Anup,
>
> Am Mittwoch, 1. Juni 2022, 18:17:32 CEST schrieb Anup Patel:
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
>
> typo in the "div_by_2" (not 4 like below and in the function itself) ?
>
>
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
>
> This will vastly reduce the number of needed ecalls when outputting
> characters, so this will probably improve performance quite a bit :-)
>
>
> I guess I still would like to have an _additional_ single-character
> putc call. As mentioned in the other thread [0], especially on consumer
> hardware [where there is no elaborate debug infrastructure] this can
> be a very handy debugging tool even in the earliest stages of a
> booting kernel (both before relocation and even inside the startup
> assembly).
>
> I.e. just doing a
>         li a7, 1
>         li a6, 0
>         li a0, 36
>         ecall
>
> in any kernel assembly will just output a "$" character right now, without
> needing any preparation at all - same with using the current
> sbi_console_putchar() directly in c-code.
>
> This _can_ be very helpful in some cases, so I guess it would be nice
> to keep such a functionality around also in the new spec.

You can easily create multiple pre-populated strings using ".asciiz" in
assembly sources. Just set the base address of pre-populated strings
once on boot hart and print from anywhere using usual 4-5 instruction
(similar to what posted above).

>
>
> Thanks
> Heiko
>
>
> [0] http://lists.infradead.org/pipermail/opensbi/2022-June/002796.html
>
>
>

Regards,
Anup

