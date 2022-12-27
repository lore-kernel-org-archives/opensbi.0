From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Dec 2022 20:41:42 +0800
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <e869a6e2-458a-df92-6662-bf4fd3ff68a9@canonical.com>
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
 <87h6xhdpbx.fsf@igel.home> <e869a6e2-458a-df92-6662-bf4fd3ff68a9@canonical.com>
Message-ID: <CAEUhbmXqNLnpP=726bvY0h8GUehGCqQZkESM_RHd-voc7QQRoA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 27, 2022 at 8:30 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 12/27/22 13:05, Andreas Schwab wrote:
> > The actual bug is in plic_priority_save/restore.
>
>
> The problem really starts at include/sbi_utils/irqchip/plic.h where
> there is no comment at all describing the usage of the function and its
> parameters. So we don't know what the different authors of these
> functions intended to use index 0 for.
>
> It would be great if we could move the project to follow the kernel
> documentation style (https://docs.kernel.org/doc-guide/kernel-doc.html)
>
>
> >
> > diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> > index d633514..901ffaa 100644
> > --- a/lib/utils/irqchip/plic.c
> > +++ b/lib/utils/irqchip/plic.c
> > @@ -39,14 +39,14 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
> >   void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num)
> >   {
> >       for (u32 i = 1; i <= num; i++)
>
> In patch 34da6638 ("lib: utils/irqchip: plic: Fix the off-by-one error
> in priority save/restore helpers") Bin wrote
>
> Interrupt source 0 is reserved. Hence the irq should start from 1.
>
> Why was the the upper limit changed?
>

Both lower and upper limits are changed because the irq number range
is really [1, plic->num_src].

Previously the author had a wrong understanding of the irq number
hence that's what the patch 34da6638 tried to fix.

Regards,
Bin

