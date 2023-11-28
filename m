From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Tue, 28 Nov 2023 13:23:05 +0800
Subject: [PATCH v3 00/15] Add Andes PMU extension support
In-Reply-To: <CAOnJCULdLyFugMFuY4JLL2+M2D8J85iU_A91ZFBLxVbhzLGASg@mail.gmail.com>
References: <20231122073617.379441-1-peterlin@andestech.com>
 <CAOnJCU+qacoXRrs3MDTyskEnJWJ-vUds57m8rKDq7UedkOhqVA@mail.gmail.com>
 <CAOnJCULdLyFugMFuY4JLL2+M2D8J85iU_A91ZFBLxVbhzLGASg@mail.gmail.com>
Message-ID: <ZWV5Oe_9T8mzUjtg@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Atish,

On Wed, Nov 22, 2023 at 04:27:02PM -0800, Atish Patra wrote:
> On Wed, Nov 22, 2023 at 4:07?PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Tue, Nov 21, 2023 at 11:39?PM Yu Chien Peter Lin
> > <peterlin@andestech.com> wrote:
> > >
> > > This patch series enables perf tool to utilize Andes PMU
> > > extension via PMU SBI calls, provides PMU device callbacks
> > > to achieve event sampling and mode filtering.
> > >
> > > This version mainly fixes single-core freeze when quitting
> > > 'perf top', adds andes_pmu_setup() to provide default event
> > > mappings when fdt_pmu_setup() can't find PMU node. And add
> > > Xandespmu to hart extension list so that the inhibit bits
> > > can be updated in a similar way to how Smcntrpmf does.
> > >
> > > The last patch provides a PMU node example used on AX45MP cores.
> > >
> >
> > Do you have a publicly available spec that describes what XAndesPMU does ?
> 
> Never mind. I found it in the last patch. It would be good to include
> it in the cover letter as well.
> http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf

Sure, will add the link in the v4 cover letter.

Thanks,
Peter Lin

> 
> >
> > > The OpenSBI and Linux patches can be found on Andes Technology GitHub
> > > - https://github.com/andestech/opensbi/commits/andes-pmu-support-v3
> > > - https://github.com/andestech/linux/commits/andes-pmu-support-v4
> > >
> > > Leo Yu-Chi Liang (1):
> > >   lib: ipi: Adjust Andes PLICSW to single-bit-per-hart scheme
> > >
> > > Yu Chien Peter Lin (14):
> > >   sbi: sbi_pmu: Improve sbi_pmu_init() error handling
> > >   lib: sbi: Add Xandespmu in hart extensions
> > >   sbi: sbi_pmu: Add hw_counter_filter_mode() to pmu device
> > >   platform: include: andes45: Add PMU related CSR defines
> > >   platform: generic: Introduce pmu_init() platform override
> > >   platform: andes: Add Andes custom PMU support
> > >   platform: andes: Enable Andes PMU for AE350
> > >   platform: rzfive: Enable Andes PMU for RZ/Five
> > >   lib: utils: fdt_fixup: Allow preserving PMU properties
> > >   platform: andes: Factor out is_andes() helper
> > >   lib: utils: fdt_pmu: Make the fdt_pmu_evt_select table global variable
> > >   lib: utils: fdt_pmu: Do not iterate over the fdt_pmu_evt_select table
> > >   platform: andes: Add Andes default PMU mapping support
> > >   docs: pmu: Add Andes PMU node example
> > >
> > >  docs/pmu_support.md                          |  82 ++++
> > >  include/sbi/sbi_ecall_interface.h            |   5 +
> > >  include/sbi/sbi_hart.h                       |   2 +
> > >  include/sbi/sbi_pmu.h                        |   6 +
> > >  include/sbi/sbi_scratch.h                    |   2 +
> > >  include/sbi_utils/fdt/fdt_helper.h           |  17 +
> > >  include/sbi_utils/fdt/fdt_pmu.h              |   6 +
> > >  include/sbi_utils/ipi/andes_plicsw.h         |  23 +-
> > >  lib/sbi/sbi_hart.c                           |   3 +
> > >  lib/sbi/sbi_pmu.c                            |  25 +-
> > >  lib/utils/fdt/fdt_fixup.c                    |   6 +-
> > >  lib/utils/fdt/fdt_pmu.c                      |  17 +-
> > >  lib/utils/ipi/andes_plicsw.c                 | 104 ++---
> > >  platform/generic/Kconfig                     |   4 +
> > >  platform/generic/andes/Kconfig               |  15 +
> > >  platform/generic/andes/ae350.c               |  19 +-
> > >  platform/generic/andes/andes_hpm.c           | 405 +++++++++++++++++++
> > >  platform/generic/andes/andes_pmu.c           | 102 +++++
> > >  platform/generic/andes/objects.mk            |   2 +
> > >  platform/generic/include/andes/andes45.h     |  32 ++
> > >  platform/generic/include/andes/andes_hpm.h   |  81 ++++
> > >  platform/generic/include/andes/andes_pmu.h   |  33 ++
> > >  platform/generic/include/platform_override.h |   1 +
> > >  platform/generic/platform.c                  |  11 +-
> > >  platform/generic/renesas/rzfive/rzfive.c     |   5 +-
> > >  25 files changed, 897 insertions(+), 111 deletions(-)
> > >  create mode 100644 platform/generic/andes/andes_hpm.c
> > >  create mode 100644 platform/generic/andes/andes_pmu.c
> > >  create mode 100644 platform/generic/include/andes/andes_hpm.h
> > >  create mode 100644 platform/generic/include/andes/andes_pmu.h
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > Regards,
> > Atish
> 
> 
> 
> -- 
> Regards,
> Atish

