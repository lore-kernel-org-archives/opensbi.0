From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Wed, 21 Dec 2022 18:19:12 +0000
Subject: [RFC PATCH] platform: generic: renesas: Add support to configure
 the PMA
In-Reply-To: <Y6MjCN7UD1PqL9pL@APC323>
References: <20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y6IzTcaMxw9JjBW3@APC323> <CA+V-a8t8G3AawnRNxi373Gp6W15hp9FmHYCCuSANVnyT7wqmXQ@mail.gmail.com>
 <Y6MjCN7UD1PqL9pL@APC323>
Message-ID: <CA+V-a8staavOP=bpnxZw=ZjXFH-XQB7HQLKOF6fY39iFu8Wq0w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yu-Chien,

For the next version I'm thinking of having an array in OpenSBI itself
for the PMA regions to be configured instead of passing it from u-boot
and then passing the required region to the upper boot stack. Hope
that's OK with you.

On Wed, Dec 21, 2022 at 7:18 AM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi Prabhakar,
>
> > > > +unsigned long rzfive_setup_pma_region(unsigned long addr, unsigned long size,
> > > > +                                   int entry_id, u32 flag)
> > > > +{
> > > > +     unsigned long size_tmp, shift = 0, pmacfg_val;
> > > > +     unsigned long mmsc = csr_read(CSR_MMSC_CFG);
> > > > +     unsigned long pa = addr;
> > > > +     char *pmaxcfg;
> > > > +     int power = 0;
> > > > +
> > >
> > > The granularity of PMA NAPOT mode is 4KiB, so we should not allow this
> > > case.
> > >
> > > if (size < (1 << 12))
> > >   return SBI_EINVAL;
> > >
> > The manual I am referring to says "The minimal size of NAPOT regions
> > must be 8 bytes."
>
> I checked the section "16.17.1 PMA Configuration Registers" [1],
> it says "The granularity is 4K bytes.".
>
> Besides, here is my observation:
> Assume desired base: 0x58000000
>                size: 0x00000400
>
> (gdb) p/x $pmacfg0
> $10 = {0xf, pma0cfg = {0xf, etyp = 0x3, mtyp = 0x3}, [...]
> (gdb) p/x (0x58000000 >> 2) + (0x400 >> 3) - 1
> $6 = 0x1600007f
> (gdb) p/x $pmaaddr0=0x1600007fl
> $8 = 0x1600007f
> (gdb) p/x $pmaaddr0
> $9 = 0x160001ff
> (gdb) pma_to_addr 0x160001ff
> translate pmaaddr 0x160001ff
> ==========================================
> power:  12
> base:   0x1000
> region: 0x58000000 ~ 0x58001000
>
> [1] http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
>
Thanks for the pointer.

Cheers,
Prabhakar

