From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 21 Nov 2023 23:03:48 +0530
Subject: [PATCH 0/2] Allow relaxed MMIO writes in device IPI callbacks
In-Reply-To: <b36f2dd2b4e99149394735b9d622d96ad062a4ea.camel@126.com>
References: <20231121161711.904674-1-apatel@ventanamicro.com> <b36f2dd2b4e99149394735b9d622d96ad062a4ea.camel@126.com>
Message-ID: <CAK9=C2XMVBJq4g7RxEZQ_k4DuT_v85qBm4UafaueoDFxzdRLyw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 21, 2023 at 10:18?PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2023-11-21???? 21:47 +0530?Anup Patel???
> > This series improves the barrier usage around device IPI callbacks
> > such that platform IPI driver can now use relaxed MMIO writes in
> > device IPI callbacks.
> >
> > These patches can also be found in the sbi_ipi_barrier_imp_v1 branch
> > at: https://github.com/avpatel/opensbi.git
> This patch is partly similar to this one?
> https://lists.infradead.org/pipermail/opensbi/2023-November/005931.html
>
> Then we may also encounter the following case:
>
>                 hart A             hart B
> send ipi--------->|                  |
>                   | clear ipi        |
>                   |                  | set ipi_type
>                   |                  |
>                   | xchg ipi_type    |
>                   |                  |
>                   |<-----------------| send ipi
>                   |                  |
>                   |                  |

This case is handled.

>
> To deal with this case, my patch:
> https://lists.infradead.org/pipermail/opensbi/2023-November/005932.html

Using spinlock for IPI synchronization is very handed
and reduces performance.

Functionally we have an IPI mux built on-top of one HW IPI
which is functionally similar to the Linux generic IPI-mux.

Regards,
Anup

>
> Regards,
> Xiang W
> >
> > Anup Patel (2):
> >   lib: sbi: Allow relaxed MMIO writes in device ipi_send() callback
> >   lib: sbi: Allow relaxed MMIO writes in device ipi_clear() callback
> >
> >  lib/sbi/sbi_ipi.c           | 31 +++++++++++++++++++++++++------
> >  lib/utils/ipi/aclint_mswi.c |  4 ++--
> >  lib/utils/irqchip/imsic.c   |  4 ++--
> >  3 files changed, 29 insertions(+), 10 deletions(-)
> >
> > --
> > 2.34.1
> >
> >
>

