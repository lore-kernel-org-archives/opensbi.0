From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Nov 2024 11:55:40 +0530
Subject: [PATCH 0/9] Manage irqchip driver lifecycle from SBI core
In-Reply-To: <20241105041015.2949808-1-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1jDc-d+WgGs1=Sj-AS0n2KyP6mcPZ3bWA1KKznvvC0wg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 5, 2024 at 9:40?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> For three kinds of devices (IPI, irqchip, and timer) the platform is
> responsible for implementing extra warm init and exit lifecycle hooks.
> Since the driver lifecycle is the same regardless of platform, I think
> it makes sense to call these lifecycle functions from the SBI core, not
> the platform. This produces smaller code since we don't need to track
> the current driver in multiple places. And since it makes the FDT driver
> interface the same for all kinds of devices, it allows us to reuse the
> same FDT scan/match/init code across all of them.
>
> This series converts the irqchip drivers. This is the most complicated
> of the three conversions, because it required significant refactoring in
> the PLIC driver. Much of that refactoring is useful for other reasons
> (more generic power management flows), but I mostly limited the changes
> to what was needed for removing the driver .warm_init hook. I tested
> this series on Allwinner D1 and verified that cpuidle still works.
>
> I sent the IPI conversion here[1], and the timer conversion here[2].
>
> [1]: http://lists.infradead.org/pipermail/opensbi/2024-October/007546.html
> [2]: http://lists.infradead.org/pipermail/opensbi/2024-September/007332.html
>
>
> Samuel Holland (9):
>   lib: utils/irqchip: plic: Allow enabling IRQs by default
>   lib: utils/irqchip: plic: Move delegation to base PLIC driver
>   lib: utils/irqchip: plic: Provide a hartindex to context map
>   lib: utils/irqchip: plic: Common PM save/restore
>   lib: utils/irqchip: Move per-hart data from fdt_plic to plic
>   lib: sbi_irqchip: Register devices during cold init
>   lib: sbi_irqchip: Call driver warm_init from SBI core
>   platform: Drop irqchip warm init and exit hooks
>   lib: sbi_irqchip: Set the IRQ handler when registering a chip

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi/sbi_irqchip.h                    |  24 ++-
>  include/sbi/sbi_platform.h                   |  25 +--
>  include/sbi_utils/irqchip/fdt_irqchip.h      |  10 +-
>  include/sbi_utils/irqchip/fdt_irqchip_plic.h |  33 ---
>  include/sbi_utils/irqchip/imsic.h            |   2 -
>  include/sbi_utils/irqchip/plic.h             |  32 +--
>  lib/sbi/sbi_irqchip.c                        |  36 ++--
>  lib/utils/irqchip/aplic.c                    |   7 +
>  lib/utils/irqchip/fdt_irqchip.c              |  57 +----
>  lib/utils/irqchip/fdt_irqchip_aplic.c        |   8 -
>  lib/utils/irqchip/fdt_irqchip_imsic.c        |   1 -
>  lib/utils/irqchip/fdt_irqchip_plic.c         | 135 ++----------
>  lib/utils/irqchip/imsic.c                    |  13 +-
>  lib/utils/irqchip/plic.c                     | 209 ++++++++++++++-----
>  platform/fpga/ariane/platform.c              |  39 +---
>  platform/fpga/openpiton/platform.c           |  41 +---
>  platform/generic/allwinner/sun20i-d1.c       |  36 +---
>  platform/generic/platform.c                  |   1 -
>  platform/kendryte/k210/platform.c            |  17 +-
>  platform/nuclei/ux600/platform.c             |  17 +-
>  platform/template/platform.c                 |  21 +-
>  21 files changed, 300 insertions(+), 464 deletions(-)
>  delete mode 100644 include/sbi_utils/irqchip/fdt_irqchip_plic.h
>
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

