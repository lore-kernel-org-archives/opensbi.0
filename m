From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 27 Jun 2022 14:16:49 +0530
Subject: SBI Debug Console Extension Proposal (Draft v2)
Message-ID: <CAK9=C2V2WNMcV9Yb7ZbtcWokzDj1uKh3gf7dNZA091QHb2fB6A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

Based on feedback, below is the updated draft proposal of the
SBI Debug Console Extension ...

The motivations behind this proposal is as follows:
1) There is no new SBI extension replacing the legacy SBI v0.1
putchar() and getchar() calls. These legacy SBI v0.1 calls are
now disabled by default in Linux and will be eventually deprecated.
We need a replacement at least for the SBI v0.1 putchar() which
is widely used for early prints in various OSes and Bootloaders.
2) The OS-A Platforms (or SEE) specification need to mandate
a particular type of UART (8250, ns16550, or SiFive) as a standard
way for boot-time early prints in supervisor-mode software. Using
SBI debug console extension, the OS-A Platforms (or SEE)
specifications don't need to mandate any type of UART.
3) The legacy SBI v0.1 putchar() only supports printing one
character at a time. For some of the hypervisors (particularly KVM),
SBI based early prints (i.e. earlycon=sbi) is slow because each
SBI v0.1 putchar() trap will be forwarded to the KVM user-space
(KVMTOOL or QEMU).

In short, the SBI debug console extension defines a standard way
for boot-time early prints in supervisor-mode software.

Please review it and provide your feedback.

Regards,
Anup

SBI Debug Console Extension (EID #0x4442434E "DBCN")
====================================================

The debug console extension defines a generic mechanism for boot-time
early prints from supervisor-mode software which allows users to catch
boot-time issues in supervisor-mode software.

This extension replaces legacy console putchar (EID #0x01) extension
and it is better in following ways:
1) It follows the new calling convention defined for SBI v1.0
   (or higher).
2) It allows supervisor software to print multiple characters
   in a single SBI call.

If the underlying physical console has extra bits for error checking
(or correction) then these extra bits should be handled by the
SBI implementation.

Function: Console Puts (FID #0)
-------------------------------

struct sbiret sbi_debug_console_puts(unsigned long addr_div_by_4,
                                     unsigned long num_chars)

Print the string specified by the `addr_div_by_4` and `num_chars`
parameters on the debug console. The `addr_div_by_4` parameter is
the physical base address of the string right shifted by 2 whereas
the `num_chars` parameter is the number of characters (or bytes) in
the string.

The memory pointed the `addr_div_by_4` and `num_chars` parameters
must be:
1) Accessible to supervisor-mode
2) Cacheable and writable memory

This is a blocking SBI call and will only return after printing
all characters of the string.

Errors:
SBI_SUCCESS                - Characters printed successfully.
SBI_ERR_INVALID_ADDRESS    - The string pointed by `addr_div_by_4`
                          and `num_chars` parameters is either not
                          accessible to supervisor-mode or does not
                          point to cacheable and writable memory.
SBI_ERR_FAILED          - Failed to print characters due to
                          I/O errors.

