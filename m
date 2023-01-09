From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Jan 2023 18:04:50 +0530
Subject: [PATCH v2 0/9] Split region permissions into M-mode and SU-mode
In-Reply-To: <20230109052043.55473-1-hchauhan@ventanamicro.com>
References: <20230109052043.55473-1-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy1ZxzkheJMpZM60KR_zch0tPbVaPG199hKAq1uqPFL0dA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 9, 2023 at 10:51 AM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> This is first series in the series of forthcoming patches that would add
> support for different access permission for different sections of
> OpenSBI (RO, RX, RW). Eventually, this would lead to support of smepmp
> extension.
>
> This patch series splits the current R/W/X permissions to M-mode R/W/X
> and SU-mode R/W/X. The split is in such a way that current permission
> semantics are not broken
>
> Changes in v2:
> 1. Fixed the grammatical mistakes in the commit log.
> 2. Removed the white space new line from sbi_domain.h
> 3. Added enforce permission bit[6] details to documentation
>
> Himanshu Chauhan (9):
>   include: sbi: Fine grain the permissions for M and SU modes
>   lib: sbi: Use finer permission semantics for address validation
>   lib: sbi: Add permissions for the firmware start till end
>   lib: sbi: Use finer permission sematics to decide on PMP bits
>   lib: sbi: Modify the boot time region flag prints
>   lib: utils: Use SU-{R/W/X} flags for region permissions during parsing
>   lib: utils: Disallow non-root domains from adding M-mode regions
>   lib: utils: Add M-mode {R/W} flags to the MMIO regions
>   docs: Update domain's region permissions and requirements

I have tested this series with two domains (trusted and untrusted)
on QEMU sifive_u machine.

Tested-by: Anup Patel <anup@brainfault.org>

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  docs/domain_support.md          | 12 +++++++--
>  include/sbi/sbi_domain.h        | 44 +++++++++++++++++++++++++++----
>  lib/sbi/sbi_domain.c            | 46 +++++++++++++++++++++++----------
>  lib/sbi/sbi_hart.c              | 16 ++++++++----
>  lib/utils/fdt/fdt_domain.c      | 20 +++++++++++---
>  lib/utils/ipi/aclint_mswi.c     |  4 ++-
>  lib/utils/irqchip/aplic.c       |  4 ++-
>  lib/utils/irqchip/imsic.c       |  4 ++-
>  lib/utils/timer/aclint_mtimer.c | 16 +++++++++---
>  9 files changed, 131 insertions(+), 35 deletions(-)
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

