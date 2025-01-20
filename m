From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Jan 2025 13:35:40 +0530
Subject: [PATCH 03/12] lib: utils: Introduce optional MPXY RPMI service
 group operations
In-Reply-To: <f92204d2-5803-42eb-8abc-f6498dee4f08@sifive.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-4-apatel@ventanamicro.com> <f92204d2-5803-42eb-8abc-f6498dee4f08@sifive.com>
Message-ID: <CAK9=C2U+_LO1jJG6_CVs7MRJdzp7y9C_6CKvL+efr=o8EzBmJQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 20, 2025 at 4:28?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Anup,
>
> On 2025-01-16 9:56 AM, Anup Patel wrote:
> > Some of the RPMI service groups may additional contex and special
> > handling when transfering message to underlying mailbox channel
>
> typos: context, transferring

Okay, I will update.

>
> > so introduce optional MPXY RPMI service group operations for this
> > purpose.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h | 18 ++++++++++++++++
> >  lib/utils/mpxy/fdt_mpxy_rpmi_clock.c        |  4 ++++
> >  lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 24 +++++++++++++++++----
> >  3 files changed, 42 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> > index e4ca0151..08b32a0a 100644
> > --- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> > +++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
> > @@ -12,6 +12,7 @@
> >
> >  #include <sbi/sbi_types.h>
> >  #include <sbi/sbi_mpxy.h>
> > +#include <sbi_utils/mailbox/fdt_mailbox.h>
> >  #include <sbi_utils/mailbox/rpmi_msgprot.h>
> >  #include <sbi_utils/mpxy/fdt_mpxy.h>
> >
> > @@ -56,12 +57,29 @@ struct mpxy_rpmi_service_data {
> >       u32 max_rx_len;
> >  };
> >
> > +struct mpxy_rpmi_mbox_data;
> > +
> > +/** MPXY RPMI service group operations */
> > +struct mpxy_rpmi_service_group_ops {
> > +     /** Transfer RPMI service group message */
> > +     int (*xfer_group)(void *context, struct mbox_chan *chan,
> > +                       struct mbox_xfer *xfer);
> > +
> > +     /** Setup RPMI service group context for MPXY */
> > +     int (*setup_group)(void **context, struct mbox_chan *chan,
> > +                        const struct mpxy_rpmi_mbox_data *data);
> > +
> > +     /** Cleanup RPMI service group context for MPXY */
> > +     void (*cleanup_group)(void *context);
> > +};
> > +
> >  /** MPXY RPMI mbox data for each service group */
> >  struct mpxy_rpmi_mbox_data {
> >       u32 servicegrp_id;
> >       u32 num_services;
> >       u32 notifications_support;
> >       struct mpxy_rpmi_service_data *service_data;
> > +     struct mpxy_rpmi_service_group_ops *group_ops;
>
> Do you expect several service groups to share a mpxy_rpmi_service_group_ops? If
> not, I would suggest to reduce pointer chasing by putting the function pointers
> directly in mpxy_rpmi_mbox_data.
>
> If you do keep it as a pointer, it should be a pointer to const.

As of now, I don't envision MPXY RPMI service group drivers
sharing operations so I will put function pointers directly in
struct mpxy_rpmi_mbox_data.

Regards,
Anup

