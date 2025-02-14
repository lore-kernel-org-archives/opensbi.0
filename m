From: Raj Vishwanathan <raj.vishwanathan@gmail.com>
Date: Thu, 13 Feb 2025 22:01:19 -0800
Subject: [PATCH v2] lib: utils: Make sure that hartid and the scratch are aligned
In-Reply-To: <e4795dbc-0186-4261-9110-799f6a6c7b9b@sifive.com>
References: <0250109233241.2491-1-cfu@mips.com> <20250213195211.15587-1-Raj.Vishwanathan@gmail.com>
 <e4795dbc-0186-4261-9110-799f6a6c7b9b@sifive.com>
Message-ID: <CA+-5cKfDpb_OFvf5UF0rA2n01jX69nuO1AkGL0PkVSvzy91xoQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Samuel

Thanks for the quick review. I took a quick look and in our case,
where the hart-id's are not sequential,  I see that there will be gaps
in the MMIO space but nothing should break

I will do a deeper study and respond specifically to your questions.

Raj

On Thu, Feb 13, 2025 at 2:58?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Raj,
>
> On 2025-02-13 1:52 PM, Raj Vishwanathan wrote:
> > Harts associated with an ACLINT_MSWI need not have sequential hartids.
> > It is insufficient to use first_hartid and hart_count. To account for
> > non-sequential hart ids, include the empty hard-ids' generate hart-count.
>
> This doesn't help, because the expression (hartid - first_hartid) is still used
> to calculate MMIO addresses. See for example mtimer_event_start() and
> mswi_ipi_send(). If there is a gap in the hartids mapped to the ACLINT
> MTIMER/MSWI indexes, these functions will compute the wrong MMIO address and
> fail to set the timer or send an IPI.
>
> Either each device instance needs an array of [ACLINT index] => [hart index]
> mappings, or the ACLINT index needs to be recorded separately in a new per-hart
> scratch variable.
>
> Regards,
> Samuel
>
> > Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
> > ---
> >
> > hart_count = last_hart_id - first_hart_id +1
> > count = number of harts
> > For sequential hart_id's, count = hart_count
> > For non-sequential hart_id's, count  < hart_count
> > ---
> >  lib/utils/fdt/fdt_helper.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> > index cb350e5..bb3fddd 100644
> > --- a/lib/utils/fdt/fdt_helper.c
> > +++ b/lib/utils/fdt/fdt_helper.c
> > @@ -1046,8 +1046,7 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
> >
> >       if ((last_hartid >= first_hartid) && first_hartid != -1U) {
> >               *out_first_hartid = first_hartid;
> > -             count = last_hartid - first_hartid + 1;
> > -             *out_hart_count = (hart_count < count) ? hart_count : count;
> > +             *out_hart_count  = last_hartid - first_hartid + 1;
> >       }
> >
> >       return 0;
>

