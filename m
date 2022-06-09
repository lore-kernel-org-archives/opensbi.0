From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 9 Jun 2022 14:21:59 +0530
Subject: [PATCH 0/3] Fixes for tval/tinst when using sbi_trap_redirect()
In-Reply-To: <TYYP286MB1439F38753D033042F83C8E0C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439F38753D033042F83C8E0C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAK9=C2Uk=e4Hv=_VwWL9k0S=aNj450R=JNQUx-wbwFDwHS3heg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 9, 2022 at 12:37 PM dramforever <dramforever@live.com> wrote:
>
> I went through usages of sbi_trap_redirect() and saw some cases where
> after redirecting, stval/htinst could be set to incorrect values. I
> tried fixing what I noticed.

Overall, most fixes are in the right direction. I will review it soon.

>
> Note that these patches are *UNTESTED*.
>
> - For the htinst fixes, no current implementation (QEMU or Spike) of the
>   hypervisor extension writes mtinst/htinst to non-zero values, so the
>   code paths are unused.

Can you test this series with QEMU nested virtualization fixes which
include mtinst/htinst emulation ?
https://lore.kernel.org/all/20220609033011.752714-1-apatel at ventanamicro.com/

> - The sbi_get_insn() fix requires a rare occasion where the instruction
>   is fetched normally then unmapped from memory before OpenSBI can load
>   it again, and I have not been reproduce.

Yes, this case can happen but it is very rare and difficult to reproduce.

Regards,
Anup

>
> Please bear in mind when reviewing.
>
> dramforever (3):
>   include: sbi: Add mtinst/htinst psuedoinstructions
>   lib: sbi: Fixup tinst for exceptions in sbi_misaligned_*()
>   lib: sbi: Fix tval and tinst for sbi_get_insn()
>
>  include/sbi/riscv_encoding.h  | 20 ++++++++++++++++++++
>  lib/sbi/sbi_misaligned_ldst.c | 16 ++++++++++++++++
>  lib/sbi/sbi_unpriv.c          |  8 +++++---
>  3 files changed, 41 insertions(+), 3 deletions(-)
>
> --
> 2.36.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

