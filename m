From: Anup Patel <anup@brainfault.org>
Date: Tue, 19 Mar 2024 11:36:52 +0530
Subject: [PATCH v3 00/10] Improve trap handling for nested traps
In-Reply-To: <20240317130231.1705888-1-apatel@ventanamicro.com>
References: <20240317130231.1705888-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy2Lch_=24QOn39ygWqh90RgmOLd6dbH+SDzzP2BVpQrcQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Mar 17, 2024 at 6:32?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Nested traps will be a common when dealing with RAS error traps so
> this series improves trap handling for nested traps by introducing
> a linked-list based trap context chain.
>
> These patches can also be found the trap_handling_imp_v3 branch at
> https://github.com/avpatel/opensbi.git
>
> Changes since v2:
>  - Addressed comments in PATCH4, PATCH6, PATCH7, PATCH8, and PATCH10.
>
> Changes since v1:
>  - Include samuel's patch in the series
>  - Embed sbi_trap_regs and sbi_trap_info in the new
>    struct sbi_trap_context
>  - Drop the mcause parameter of sbi_trap_aia_irq()
>
> Anup Patel (9):
>   lib: sbi: Remove sbi_trap_exit() and related code
>   include: sbi: Add trap_context pointer in struct sbi_scratch
>   lib: sbi: Introduce trap context
>   lib: sbi: Simplify parameters of misaligned and access fault handlers
>   lib: sbi: Simplify parameters of sbi_illegal_insn_handler()
>   lib: sbi: Remove regs paramter of sbi_irqchip_process()
>   lib: sbi: Remove regs parameter from trap irq handling functions
>   lib: sbi: Pass trap context pointer to sbi_ecall_handler()
>   lib: sbi: Extend sbi_trap_error() to dump state in a nested trap
>
> Samuel Holland (1):
>   lib: sbi: Remove epc from struct sbi_trap_info

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  firmware/fw_base.S             |  76 +++++++++----
>  include/sbi/riscv_encoding.h   |   2 +
>  include/sbi/sbi_ecall.h        |   4 +-
>  include/sbi/sbi_illegal_insn.h |   4 +-
>  include/sbi/sbi_irqchip.h      |   5 +-
>  include/sbi/sbi_scratch.h      |  14 +--
>  include/sbi/sbi_trap.h         |  45 ++++++--
>  include/sbi/sbi_trap_ldst.h    |  12 +-
>  lib/sbi/sbi_ecall.c            |   3 +-
>  lib/sbi/sbi_ecall_legacy.c     |   4 -
>  lib/sbi/sbi_expected_trap.S    |   4 -
>  lib/sbi/sbi_illegal_insn.c     |   9 +-
>  lib/sbi/sbi_irqchip.c          |  10 +-
>  lib/sbi/sbi_trap.c             | 196 +++++++++++++++------------------
>  lib/sbi/sbi_trap_ldst.c        |  71 ++++++------
>  lib/utils/irqchip/imsic.c      |   2 +-
>  16 files changed, 239 insertions(+), 222 deletions(-)
>
> --
> 2.34.1
>

