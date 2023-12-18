From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Dec 2023 11:15:48 +0530
Subject: [PATCH v4 00/15] Add Andes PMU extension support
In-Reply-To: <CAAhSdy0sDZk9xTmVhHyGuc-X_B5U6UhE7-igQWQa+NP0cBUCpw@mail.gmail.com>
References: <20231130124213.2590640-1-peterlin@andestech.com> <CAAhSdy0sDZk9xTmVhHyGuc-X_B5U6UhE7-igQWQa+NP0cBUCpw@mail.gmail.com>
Message-ID: <CAK9=C2XS-s5z4ZfDXpAXE=pi70hTfjWfct5UqMUDhSYJf1fNZw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Wed, Dec 6, 2023 at 7:54?PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Nov 30, 2023 at 6:12?PM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > This patch series enables perf tool to utilize Andes PMU
> > extension via PMU SBI calls, provides PMU device callbacks
> > to achieve event sampling and mode filtering.
> >
> > The last patch provides a PMU node example used on AX45MP cores.
> >
> > The OpenSBI and Linux patches can be found on Andes Technology GitHub
> > - https://github.com/andestech/opensbi/commits/andes-pmu-support-v4
> > - https://github.com/andestech/linux/commits/andes-pmu-support-v4
> >
> > For more details about Andes PMU extension, see Counter Related
> > Registers in the AX45MP datasheet:
> > http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >
> > Leo Yu-Chi Liang (1):
> >   lib: ipi: Adjust Andes PLICSW to single-bit-per-hart scheme
> >
> > Yu Chien Peter Lin (14):
> >   sbi: sbi_pmu: Improve sbi_pmu_init() error handling
> >   lib: sbi: Add XAndesPMU in hart extensions
> >   sbi: sbi_pmu: Add hw_counter_filter_mode() to pmu device
> >   platform: include: andes45: Add PMU related CSR defines
> >   platform: generic: Introduce pmu_init() platform override
> >   platform: andes: Add Andes custom PMU support
> >   platform: andes: Enable Andes PMU for AE350
> >   platform: rzfive: Enable Andes PMU for RZ/Five
> >   lib: utils: fdt_fixup: Allow preserving PMU properties
> >   platform: andes: Factor out is_andes() helper
> >   lib: utils: fdt_pmu: Make the fdt_pmu_evt_select table global variable
> >   lib: utils: fdt_pmu: Do not iterate over the fdt_pmu_evt_select table
> >   platform: andes: Add Andes default PMU mapping support
> >   docs: pmu: Add Andes PMU node example
>
> Applied all patches to the riscv/opensbi repo except PATCH14 which
> has pending comment from Atish.

Can you address comments on PATCH14 and send it this week ?

Next week, we will be releasing OpenSBI v1.4

Regards,
Anup

>
> Thanks,
> Anup
>
> >
> >  docs/pmu_support.md                          |  82 ++++
> >  include/sbi/sbi_ecall_interface.h            |   5 +
> >  include/sbi/sbi_hart.h                       |   2 +
> >  include/sbi/sbi_pmu.h                        |   6 +
> >  include/sbi_utils/fdt/fdt_helper.h           |  17 +
> >  include/sbi_utils/fdt/fdt_pmu.h              |   6 +
> >  include/sbi_utils/ipi/andes_plicsw.h         |  23 +-
> >  lib/sbi/sbi_hart.c                           |   3 +
> >  lib/sbi/sbi_pmu.c                            |  26 +-
> >  lib/utils/fdt/Kconfig                        |   7 +
> >  lib/utils/fdt/fdt_fixup.c                    |   3 +
> >  lib/utils/fdt/fdt_pmu.c                      |  17 +-
> >  lib/utils/ipi/andes_plicsw.c                 | 104 ++---
> >  platform/generic/Kconfig                     |   4 +
> >  platform/generic/andes/Kconfig               |  15 +
> >  platform/generic/andes/ae350.c               |  19 +-
> >  platform/generic/andes/andes_hpm.c           | 405 +++++++++++++++++++
> >  platform/generic/andes/andes_pmu.c           | 105 +++++
> >  platform/generic/andes/objects.mk            |   2 +
> >  platform/generic/include/andes/andes45.h     |  32 ++
> >  platform/generic/include/andes/andes_hpm.h   |  81 ++++
> >  platform/generic/include/andes/andes_pmu.h   |  34 ++
> >  platform/generic/include/platform_override.h |   1 +
> >  platform/generic/platform.c                  |  14 +-
> >  platform/generic/renesas/rzfive/rzfive.c     |   5 +-
> >  25 files changed, 908 insertions(+), 110 deletions(-)
> >  create mode 100644 platform/generic/andes/andes_hpm.c
> >  create mode 100644 platform/generic/andes/andes_pmu.c
> >  create mode 100644 platform/generic/include/andes/andes_hpm.h
> >  create mode 100644 platform/generic/include/andes/andes_pmu.h
> >
> > --
> > 2.34.1
> >
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

