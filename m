From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 17 Dec 2022 08:51:37 +0530
Subject: [PATCH v3 1/5] lib: utils/irqchip: plic: Fix the off-by-one error
 in priority save/restore helpers
In-Reply-To: <65db953b-fc55-7323-7c8b-754c9b8f6d85@sholland.org>
References: <20221211065424.806478-1-bmeng@tinylab.org> <87a63ufe4a.fsf@linux-m68k.org>
 <CAEUhbmWJCB=i7OkeCMvtz0ut9xcCjiO8fTQ379GZWU=vHuzhwg@mail.gmail.com> <65db953b-fc55-7323-7c8b-754c9b8f6d85@sholland.org>
Message-ID: <CAK9=C2Xqy21AqKZ=OJq=J=fGv1j0ySFoVNTjs8=U3FLrzZQ_zw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 12:10 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 12/11/22 04:18, Bin Meng wrote:
> > On Sun, Dec 11, 2022 at 6:08 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> >>
> >> On Dez 11 2022, Bin Meng wrote:
> >>
> >>> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> >>> index 73d7788..4df9020 100644
> >>> --- a/lib/utils/irqchip/plic.c
> >>> +++ b/lib/utils/irqchip/plic.c
> >>> @@ -38,13 +38,13 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
> >>>
> >>>  void plic_priority_save(const struct plic_data *plic, u8 *priority)
> >>>  {
> >>> -     for (u32 i = 0; i < plic->num_src; i++)
> >>> +     for (u32 i = 1; i <= plic->num_src; i++)
> >>>               priority[i] = plic_get_priority(plic, i);
> >>
> >> That needs to adjust the index into the priority array.
> >
> > Does that help anything? It just confuses people more.
> >
> > I added function parameter descriptions in patch 2 to make it crystal
> > clear, that the priority array needs to include interrupt source 0.
>
> To me, it is more confusing that when I ask to save the priority for N
> sources, I need to allocate an array with >N elements. And leaving array
> element 0 unused wastes memory.

This can be a separate improvement patch.

Regards,
Anup

>
> Regards,
> Samuel
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

