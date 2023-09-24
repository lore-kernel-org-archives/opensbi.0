From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 Sep 2023 18:24:09 +0530
Subject: [PATCH v1 0/7] Smepmp fixes and improvements
In-Reply-To: <20230907114947.1705425-1-mchitale@ventanamicro.com>
References: <20230907114947.1705425-1-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy3ckMgkFPu5EHgP61jWfqFnCVdum4L=q93odhK+bnN4_w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 7, 2023 at 5:19?PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> This series fixes issues found when testing smepmp on Qemu and other
> Ventana platforms. We need to add PMP rules for those device regions
> (e.g UART, syscon registers) that are accessed in both M and S/U modes.
> Also the sequence of programming the PMP rules needs to be changed such
> that the M-only rules are programmed before enabling the mseccfg.MML bit.
>
> Anup Patel (5):
>   lib: sbi: Factor-out Smepmp configuration as separate function
>   lib: sbi: Don't clear mseccfg.MML bit in sbi_hart_smepmp_configure()
>   lib: sbi: Fix pmp_flags for Smepmp read-only shared region
>   lib: sbi: Populate M-only Smepmp entries before setting mseccfg.MML
>   lib: utils/regmap: Mark syscon region as shared read-write

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
> Mayuresh Chitale (2):
>   include: sbi_domain: Fix permission test macros
>   lib: utils/serial: Add shared regions for serial drivers
>
>  include/sbi/sbi_domain.h             |  34 ++--
>  lib/sbi/sbi_hart.c                   | 225 ++++++++++++++++++---------
>  lib/utils/regmap/fdt_regmap_syscon.c |   7 +
>  lib/utils/serial/cadence-uart.c      |   6 +-
>  lib/utils/serial/fdt_serial_htif.c   |  10 ++
>  lib/utils/serial/uart8250.c          |   7 +-
>  6 files changed, 197 insertions(+), 92 deletions(-)
>
> --
> 2.34.1
>

