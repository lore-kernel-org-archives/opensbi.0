From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 9 Apr 2021 13:47:02 +0000
Subject: [PATCH v3 2/3] spinlocks: Allow direct initialization via
 SPIN_LOCK_INIT()
In-Reply-To: <DM6PR04MB6201347845C43F332157038B8D769@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20210406015354.332780-1-cmuellner@linux.com>
 <20210406015354.332780-3-cmuellner@linux.com>
 <DM6PR04MB6201347845C43F332157038B8D769@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <DM6PR04MB62010C9D82DA0CEFE76D62948D739@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 06 April 2021 10:37
> To: Christoph Muellner <cmuellner@linux.com>;
> opensbi at lists.infradead.org; Guo Ren <guoren@kernel.org>; Xiang W
> <wxjstz@126.com>; Jessica Clarke <jrtc27@jrtc27.com>
> Subject: RE: [PATCH v3 2/3] spinlocks: Allow direct initialization via
> SPIN_LOCK_INIT()
> 
> 
> 
> > -----Original Message-----
> > From: Christoph Muellner <cmuellner@linux.com>
> > Sent: 06 April 2021 07:24
> > To: opensbi at lists.infradead.org; Anup Patel <Anup.Patel@wdc.com>; Guo
> > Ren <guoren@kernel.org>; Xiang W <wxjstz@126.com>; Jessica Clarke
> > <jrtc27@jrtc27.com>
> > Cc: Christoph Muellner <cmuellner@linux.com>
> > Subject: [PATCH v3 2/3] spinlocks: Allow direct initialization via
> > SPIN_LOCK_INIT()
> >
> > The current implementation of SPIN_LOCK_INIT() provides the spinlock
> > to be initialized as reference. This does not allow a direct
> > initialization of the spinlock object at the creation site.
> >
> > Let's pass the spinlock directly instead (like Linux does as well) and
> > adjust all users of the macro (in fact there is only one user).
> >
> > Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Replaced patch subject prefix "spinlocks:" with "lib: sbi:"

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> 
> Thanks,
> Anup
> 
> > ---
> >  include/sbi/riscv_locks.h | 2 +-
> >  lib/sbi/sbi_fifo.c        | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/sbi/riscv_locks.h b/include/sbi/riscv_locks.h
> > index
> > 55da7c0..faa9676 100644
> > --- a/include/sbi/riscv_locks.h
> > +++ b/include/sbi/riscv_locks.h
> > @@ -16,7 +16,7 @@ typedef struct {
> >
> >  #define __RISCV_SPIN_UNLOCKED 0
> >
> > -#define SPIN_LOCK_INIT(_lptr) (_lptr)->lock = __RISCV_SPIN_UNLOCKED
> > +#define SPIN_LOCK_INIT(x) (x).lock = __RISCV_SPIN_UNLOCKED
> >
> >  #define SPIN_LOCK_INITIALIZER                  \
> >  	{                                      \
> > diff --git a/lib/sbi/sbi_fifo.c b/lib/sbi/sbi_fifo.c index
> > 8d1dbf0..2a5c012
> > 100644
> > --- a/lib/sbi/sbi_fifo.c
> > +++ b/lib/sbi/sbi_fifo.c
> > @@ -18,7 +18,7 @@ void sbi_fifo_init(struct sbi_fifo *fifo, void
> > *queue_mem, u16 entries,
> >  	fifo->queue	  = queue_mem;
> >  	fifo->num_entries = entries;
> >  	fifo->entry_size  = entry_size;
> > -	SPIN_LOCK_INIT(&fifo->qlock);
> > +	SPIN_LOCK_INIT(fifo->qlock);
> >  	fifo->avail = fifo->tail = 0;
> >  	sbi_memset(fifo->queue, 0, (size_t)entries * entry_size);  }
> > --
> > 2.30.2


