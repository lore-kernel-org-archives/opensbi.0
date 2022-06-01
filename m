From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 1 Jun 2022 20:29:47 +0200
Subject: [RISC-V] [tech-unixplatformspec] SBI Debug Console Extension
 Proposal (Draft v1)
In-Reply-To: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
Message-ID: <72af98ee-6bb4-542f-021d-66e9dd946226@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/1/22 18:17, Anup Patel wrote:
> Hi All,
> 
> Below is the draft proposal for SBI Debug Console Extension.
> 
> Please review it and provide feedback.
> 
> Thanks,
> Anup
> 
> Debug Console Extension (EID #0x4442434E "DBCN")
> ================================================
> 
> The debug console extension defines a generic mechanism for boot-time
> early prints from supervisor-mode software which allows users to catch
> boot-time issues in supervisor-mode software.
> 
> This extension replaces legacy console putchar (EID #0x01) extension
> and it is better in following ways:

Thanks for starting to close this gap.

> 1) It follows the new calling convention defined for SBI v1.0
>     (or higher).
> 2) It is based on a shared memory area between SBI implementation
>     and supervisor-mode software so multiple characters can be
>     printed using a single SBI call.

I miss a discussion of the conflicts that can arise if the configuration 
of the serial console is changed by the caller.

Do we need an ecall that closes the SBI console to further access?

> 
> The supervisor-mode software must set the shared memory area before
> printing characters on the debug console. Also, all HARTs share the
> same shared memory area so only one HART needs to set it at boot-time.

Isn't it M-mode software that has to program the MMU to allow all harts 
in M-mode and S-mode access to the memory area? What is the S-mode 
software to do about the memory area prior to calling 
sbi_debug_console_set_area()?

> 
> Function: Set Console Area (FID #0)
> -----------------------------------
> 
> struct sbiret sbi_debug_console_set_area(unsigned long addr_div_by_4,
>                                           unsigned long size)

The console output is needed on the very start of the S-mode software, 
before setting up anything.

Can we avoid this extra function?

Can we simply assume that the caller of sbi_debug_console_puts() 
provides a physical address pointer to a memory area that is suitable?

> 
> Set the shared memory area specified by `addr_div_by_2` and `size`

%s/addr_div_by_2/addr_div_by_4/

> parameters. The `addr_div_by_4` parameter is base address of the

%s/is base/is the base/

> shared memory area right shifted by 2 whereas `size` parameter is
> the size of shared memory area in bytes.

Why shifting the address? I would prefer to keep it simple for the 
caller. If the alignment is not suitable, return an error.

But why is an alignment needed here at all? And why 4 aligned?

> 
> The shared memory area should be normal cacheable memory for the
> supervisor-mode software. Also, the shared memory area is global
> across all HARTs so SBI implementation must ensure atomicity in
> setting the shared memory area.
> 
> Errors:
> SBI_SUCCESS                - Shared memory area set successfully.
> SBI_ERR_INVALID_ADDRESS - The shared memory area pointed by
>                            `addr_div_by_2` and `size` parameters
>                            is not normal cacheable memory or not
>                            accessible to supervisor-mode software.
> 
> Function: Console Puts (FID #1)
> -------------------------------
> 
> struct sbiret sbi_debug_console_puts(unsigned long area_offset,
>                                       unsigned long num_chars)

I would prefer to simply pass a physical address pointer here with no 
requirements on alignment. And no prior SBI call.

Do we need num_chars? Are we expecting to provide binary output? Using 
0x00 as terminator would be adequate in most cases.

What is the requirement on the console? Does it have to support 8bit 
output to allow for UTF-8?

Do we make any assumptions about encoding?

How would we handle a console set up to 7bit + parity if a character > 
0x7f is sent?

> 
> Print the string specified by `area_offset` and `num_chars` on
> the debug console. The `area_offset` parameter is the start of
> string in the shard memory area whereas `num_chars` parameter

%s/shard/shared/

> is the number of characters (or bytes) in the string.
> 
> This is a blocking SBI call and will only return after printing
> all characters of the string.
> 
> Errors:
> SBI_SUCCESS                - Characters printed successfully.
> SBI_ERR_INVALID_ADDRESS    - The start of the string (i.e.
>                            `area_offset`) or end of the string
>                            (i.e. `area_offset + num_chars`) is
>                            outside shared memory area.

There could be other reasons of failures:

* set up of the UART failed in OpenSBI
* no UART defined in the device-tree
* ...

So let us add SBI_ERR_FAILED to the list.

Best regards

Heinrich

