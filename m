From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 16 Jan 2023 20:15:29 +0000
Subject: [PATCH 6/6] lib: sbi_hsm: Introduce hart_secondary_boot()
 callback
In-Reply-To: <CAAhSdy3B8vi2DQ7Caa-i=VFELvYnh=aZZV+7fNKtmcnehi3WkA@mail.gmail.com>
References: <20230104062927.15628-1-peterlin@andestech.com>
 <20230104062927.15628-7-peterlin@andestech.com>
 <20230106142946.y27lr2it25y3mywa@orel>
 <Y7sw9qByX4QK2IIa@APC323>
 <CAAhSdy3B8vi2DQ7Caa-i=VFELvYnh=aZZV+7fNKtmcnehi3WkA@mail.gmail.com>
Message-ID: <Y8WwYeF/oievzNwn@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On Mon, Jan 16, 2023 at 02:48:46PM +0530, Anup Patel wrote:
> On Sun, Jan 8, 2023 at 6:40 PM Yu-Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Hi Andrew,
> >
> > On Fri, Jan 06, 2023 at 03:29:46PM +0100, Andrew Jones wrote:
> > > On Wed, Jan 04, 2023 at 02:29:27PM +0800, Yu Chien Peter Lin wrote:
> > > > When platform supports hotplug, i.e. both hart_start() and hart_stop()
> > > > callbacks are provided, the former doesn't need to be performed at
> > > > the boot-time. Thus, add a callback for the case of secondary boot.
> > > >
> > > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > > ---
> > > >  include/sbi/sbi_hsm.h |  7 +++++++
> > > >  lib/sbi/sbi_hsm.c     | 22 +++++++++++++---------
> > > >  2 files changed, 20 insertions(+), 9 deletions(-)
> > >
> > > I'm not sure why this patch is in the series as the change isn't used.
> > >
> > > Thanks,
> > > drew
> >
> > Thanks for the review.
> >
> > I'm just found it's not necessary to run platform-specific hart_start()
> > at boot-time since it's for CPU hotplug, I'm not sure hart_start() is
> > supposed to do at boot-time so we can ignore this patch if it's not worth
> > adding a callback.
> 
> For now it looks like we don't need this callback but we can revisit
> in the future.
> 
> Regards,
> Anup
> 

Thanks for the review, I will drop this callback.

Best regards,
Peter Lin

