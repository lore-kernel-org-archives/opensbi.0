From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Sat, 7 Oct 2023 14:04:43 +0800
Subject: [PATCH 0/6] Add Andes PMU extension support
In-Reply-To: <CAAhSdy1iUKOKkp3Z8ybL8ubcF7Y+YZEyMN232HYogE4ToTH+hw@mail.gmail.com>
References: <20230906094051.3957564-1-peterlin@andestech.com>
 <CAAhSdy1iUKOKkp3Z8ybL8ubcF7Y+YZEyMN232HYogE4ToTH+hw@mail.gmail.com>
Message-ID: <ZSD0-_n7QLr_vKQI@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On Fri, Oct 06, 2023 at 05:47:16PM +0530, Anup Patel wrote:
> Hi Yu Chien Peter Lin,
> 
> On Wed, Sep 6, 2023 at 3:12?PM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > This patch series enables perf tool to utilize Andes PMU
> > extension via PMU SBI calls, provides PMU device callbacks
> > for event sampling and mode filtering.
> >
> > We also provide a PMU node example of AX45MP in the last
> > patch.
> >
> > The OpenSBI and Linux patches can be found on Andes Technology GitHub
> > - https://github.com/andestech/opensbi/commits/andes-pmu-support
> > - https://github.com/andestech/linux/commits/andes-pmu-support
> >
> > Yu Chien Peter Lin (6):
> >   sbi: sbi_pmu: Add hw_counter_filter_mode() to pmu device
> >   platform: include: andes45: Add PMU related CSR defines
> >   platform: andes: Add Andes custom PMU support
> >   platform: andes: Enable Andes PMU for AE350
> >   platform: rzfive: Enable Andes PMU for RZ/Five
> >   docs: pmu: Add Andes PMU node example
> 
> I assume there is going to be a v2 due to comments on PATCH3 ?

Yes we are working on this.

Thanks.
Peter Lin

> Regards,
> Anup
> 
> >
> >  docs/pmu_support.md                        | 87 ++++++++++++++++++++++
> >  include/sbi/sbi_pmu.h                      |  6 ++
> >  lib/sbi/sbi_pmu.c                          |  5 +-
> >  platform/generic/Kconfig                   |  2 +
> >  platform/generic/andes/Kconfig             |  4 +
> >  platform/generic/andes/ae350.c             |  2 +
> >  platform/generic/andes/andes_pmu.c         | 85 +++++++++++++++++++++
> >  platform/generic/andes/objects.mk          |  1 +
> >  platform/generic/include/andes/andes45.h   | 26 +++++++
> >  platform/generic/include/andes/andes_pmu.h | 12 +++
> >  platform/generic/renesas/rzfive/rzfive.c   |  2 +
> >  11 files changed, 231 insertions(+), 1 deletion(-)
> >  create mode 100644 platform/generic/andes/andes_pmu.c
> >  create mode 100644 platform/generic/include/andes/andes_pmu.h
> >
> > --
> > 2.34.1
> >

