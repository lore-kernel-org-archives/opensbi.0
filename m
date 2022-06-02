From: Xiang W <wxjstz@126.com>
Date: Thu, 02 Jun 2022 11:43:43 +0800
Subject: SBI Debug Console Extension Proposal (Draft v1)
In-Reply-To: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
Message-ID: <d40d2aafa18951be1021f7385d9e17614848d5a6.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-06-01???? 21:47 +0530?Anup Patel???
> Hi All,
> 
> Below is the draft proposal for SBI Debug Console Extension.
> 
> Please review it and provide feedback.
> 
> Thanks,
> Anup
The use of these two APIs is too complicated, and the supervisor-mode
software needs to create a data structure to manage the Console Area.
I recommend using the simpler interface:

struct sbiret sbi_debug_console_puts(unsigned long addr,
                                     unsigned long num_chars)

Regards,
Xiang W
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
> 1) It follows the new calling convention defined for SBI v1.0
> ?? (or higher).
> 2) It is based on a shared memory area between SBI implementation
> ?? and supervisor-mode software so multiple characters can be
> ?? printed using a single SBI call.
> 
> The supervisor-mode software must set the shared memory area before
> printing characters on the debug console. Also, all HARTs share the
> same shared memory area so only one HART needs to set it at boot-time.
> 
> Function: Set Console Area (FID #0)
> -----------------------------------
> 
> struct sbiret sbi_debug_console_set_area(unsigned long addr_div_by_4,
> ???????????????????????????????????????? unsigned long size)
> 
> Set the shared memory area specified by `addr_div_by_2` and `size`
> parameters. The `addr_div_by_4` parameter is base address of the
> shared memory area right shifted by 2 whereas `size` parameter is
> the size of shared memory area in bytes.
> 
> The shared memory area should be normal cacheable memory for the
> supervisor-mode software. Also, the shared memory area is global
> across all HARTs so SBI implementation must ensure atomicity in
> setting the shared memory area.
> 
> Errors:
> SBI_SUCCESS??????????????? - Shared memory area set successfully.
> SBI_ERR_INVALID_ADDRESS - The shared memory area pointed by
> ????????????????????????? `addr_div_by_2` and `size` parameters
> ????????????????????????? is not normal cacheable memory or not
> ????????????????????????? accessible to supervisor-mode software.
> 
> Function: Console Puts (FID #1)
> -------------------------------
> 
> struct sbiret sbi_debug_console_puts(unsigned long area_offset,
> ???????????????????????????????????? unsigned long num_chars)
> 
> Print the string specified by `area_offset` and `num_chars` on
> the debug console. The `area_offset` parameter is the start of
> string in the shard memory area whereas `num_chars` parameter
> is the number of characters (or bytes) in the string.
> 
> This is a blocking SBI call and will only return after printing
> all characters of the string.
> 
> Errors:
> SBI_SUCCESS??????????????? - Characters printed successfully.
> SBI_ERR_INVALID_ADDRESS??? - The start of the string (i.e.
> ????????????????????????? `area_offset`) or end of the string
> ????????????????????????? (i.e. `area_offset + num_chars`) is
> ????????????????????????? outside shared memory area.
> 



