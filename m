From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Mon, 30 Jan 2023 16:12:11 +0000
Subject: [RFC PATCH v3 1/3] platform: generic: renesas: rzfive: Add
 support to configure the PMA
In-Reply-To: <Y9STRS2xa4WUXk4r@Thinkpad-L14>
References: <20230126095832.21566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230126095832.21566-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y9STRS2xa4WUXk4r@Thinkpad-L14>
Message-ID: <CA+V-a8stu0wCOqJiccFiW7ycnwVSX-gPUYC=p+fErjxcgVZjzA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yu-Chien,

Thank you for the review.

On Sat, Jan 28, 2023 at 3:12 AM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi Prabhakar,
>
> > +static unsigned long
> > +andes45_pma_setup(const struct andes45_pma_region *pma_region,
> > +               unsigned int entry_id)
> > +{
> > +     unsigned long size = pma_region->size;
> > +     unsigned long addr = pma_region->pa;
> > +     unsigned int pma_cfg_addr;
> > +     unsigned long pmacfg_val;
> > +     unsigned long pmaaddr;
> > +     char *pmaxcfg;
> > +
> > +     /* Check for 4KiB granularity */
> > +     if (size < (1 << 12))
> > +             return SBI_EINVAL;
> > +
> > +     /* Check size is power of 2 */
> > +     if (size & (size - 1))
> > +             return SBI_EINVAL;
> > +
> > +     if (pma_region->flags > 0xff || entry_id > 15)
>
> (pma_region->flags > 0xff) is always false as its type is unsigned char?
> I guess we can drop the condition and specify the bit-field of flags as
> 7-bit wide (the MSB is reserved), i.e.
>
> struct andes45_pma_region {
>     unsigned long pa;
>     unsigned long size;
>     u8 flags:7;
> [...]
>
> So if someone sets the flags to a value greater than 0x7f, it will cause
> a compilation error.
>
Good point, I will update this in the next version.

Cheers,
Prabhakar

