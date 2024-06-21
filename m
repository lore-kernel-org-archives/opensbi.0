From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 21 Jun 2024 16:02:50 +0200
Subject: [PATCH 0/4] Initialize the console as early as possible
In-Reply-To: <CAAhSdy3b8-wzwPobWeLASX5jE77GWixYVhiOt7+NQ_kYtsHzYQ@mail.gmail.com>
References: <20240606091723.896477-1-wxjstz@126.com>
 <CAAhSdy3b8-wzwPobWeLASX5jE77GWixYVhiOt7+NQ_kYtsHzYQ@mail.gmail.com>
Message-ID: <20240621-334f59a4e3446a62fefecdbf@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 05:37:07PM GMT, Anup Patel wrote:
> On Thu, Jun 6, 2024 at 2:47?PM Xiang W <wxjstz@126.com> wrote:
> >
> > Initializing the console as early as possible can output more useful
> > information. This series of patches is used to initialize the console
> > as early as possible.
> >
> > This series of patches is based on a previous patch
> > http://lists.infradead.org/pipermail/opensbi/2024-May/006960.html
> >
> > Xiang W (4):
> >   include: sbi_utils: fixup fdt_get_address
> >   lib: sbi: Add domains_init to sbi_console_device
> >   lib: utils/serial: add domains_init for 8250
> >   lib: sbi: Initialize the console as early as possible
> 
> The problem with this series is that it is changing the order
> of platform callback in coldboot path because sbi_scratch_init,
> sbi_heap_init, and sbi_domain_init should always be the
> first things done in the coldboot path.
> 
> Instead, I suggest the following:
> 1) Update generic platform to call generic_console_init()
>      from generic_early_init() in coldboot path and don't
>      provide the console_init() callback.
> 2) Update all other platform to do similar thing as #1
> 3) Drop sbi_console_init(), sbi_platform_console_init() and
>     console_init() callback.
> 
> For prints before sbi_platform_early_init(), the sbi_console.c
> can implement a small circular buffer which is flushed whenever
> some driver sets a console device.

Almost two years ago I wrote an SBI console ring buffer patch. I never
polished and posted it, but I could maybe dig it back up.

Thanks,
drew

> 
> >
> >  include/sbi/sbi_console.h           |  3 +++
> >  include/sbi_utils/fdt/fdt_helper.h  |  4 +++-
> >  include/sbi_utils/serial/uart8250.h |  1 +
> >  lib/sbi/sbi_domain.c                | 10 ++++++++++
> >  lib/sbi/sbi_init.c                  |  8 ++++----
> >  lib/utils/serial/uart8250.c         | 28 +++++++++++++++++++---------
> >  6 files changed, 40 insertions(+), 14 deletions(-)
> >
> > --
> > 2.43.0
> >
> 
> Regards,
> Anup
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

