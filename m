From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 Aug 2024 11:31:18 +0530
Subject: [PATCH 0/3] Add support for tor type pmp
In-Reply-To: <20240626174816.2837278-1-wxjstz@126.com>
References: <20240626174816.2837278-1-wxjstz@126.com>
Message-ID: <CAAhSdy2CHMcTpPi6=SjnD5QnACG1EOvmn8ByZ-hXzrRVYSWjjQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 26, 2024 at 11:19?PM Xiang W <wxjstz@126.com> wrote:
>
> Using tor type pmp can save pmp configuration registers in the following
> scenarios
>
> sbi_domain_root_add_memrange(addr, 4M, PAGE_SIZE...
> sbi_domain_root_add_memrange(addr + 4M, 512K, PAGE_SIZE...
> sbi_domain_root_add_memrange(addr + 4M + 512K, 32K, PAGE_SIZE...

This is not true in all cases. For example, if we selectively carve-out a
memregion from a DRAM memregion then above approach will result in
3 separate memregions whereas with current overlapping power-of-2
memregions we only need 2 memregions.

Allowing arbitrary size of memregions opens a new set of issues. The
biggest issues will be dealing which partially overlap (i.e. A overlaps B
but A is not inside B and B is not inside A). Currently, we don't have partially
overlapping memregions because memregions are power-of-2 size.

>
> The previous configuration requires 3 sets of pmp configuration registers.
> After applying the patch, only 2 sets of pmp configuration registers are
> needed.
>
> Xiang W (3):
>   lib: sbi: Add tor type PMP support

TOR type PMP requires a strict ordering based on addresses so we
can't freely re-order memregions. Also, real world RISC-V platforms
have implementation specific PMP granularity which will further create
problems for TOR type PMP.

>   lib: sbi: Introduce size to sbi_domain_memregion
>   lib: sbi: Improve memory region merging
>
>  include/sbi/riscv_asm.h  |   6 +-
>  include/sbi/sbi_domain.h |  37 +++++
>  lib/sbi/riscv_asm.c      | 190 +++++++++++++---------
>  lib/sbi/sbi_domain.c     | 336 +++++++++++++++++++++++++--------------
>  lib/sbi/sbi_hart.c       |  30 ++--
>  5 files changed, 382 insertions(+), 217 deletions(-)
>
> --
> 2.43.0
>

Minimizing the PMP regions is a good thing to have but this can be
easily achieved by OpenSBI platform support registering large root
memregions at early boot time so that small root memregions
registered by drivers will simply get merged into the larger root
memregions already registered by platform support.

In other words, OpenSBI platform support can minimize PMP
regions by pre-registering large memregions.

Regards,
Anup

