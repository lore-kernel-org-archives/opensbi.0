From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 21 Dec 2022 15:15:20 +0000
Subject: [RFC PATCH] platform: generic: renesas: Add support to configure
 the PMA
In-Reply-To: <CA+V-a8t8G3AawnRNxi373Gp6W15hp9FmHYCCuSANVnyT7wqmXQ@mail.gmail.com>
References: <20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y6IzTcaMxw9JjBW3@APC323>
 <CA+V-a8t8G3AawnRNxi373Gp6W15hp9FmHYCCuSANVnyT7wqmXQ@mail.gmail.com>
Message-ID: <Y6MjCN7UD1PqL9pL@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Prabhakar,

> > > +unsigned long rzfive_setup_pma_region(unsigned long addr, unsigned long size,
> > > +                                   int entry_id, u32 flag)
> > > +{
> > > +     unsigned long size_tmp, shift = 0, pmacfg_val;
> > > +     unsigned long mmsc = csr_read(CSR_MMSC_CFG);
> > > +     unsigned long pa = addr;
> > > +     char *pmaxcfg;
> > > +     int power = 0;
> > > +
> >
> > The granularity of PMA NAPOT mode is 4KiB, so we should not allow this
> > case.
> >
> > if (size < (1 << 12))
> >   return SBI_EINVAL;
> >
> The manual I am referring to says "The minimal size of NAPOT regions
> must be 8 bytes."

I checked the section "16.17.1 PMA Configuration Registers" [1],
it says "The granularity is 4K bytes.".

Besides, here is my observation:
Assume desired base: 0x58000000
               size: 0x00000400

(gdb) p/x $pmacfg0
$10 = {0xf, pma0cfg = {0xf, etyp = 0x3, mtyp = 0x3}, [...]
(gdb) p/x (0x58000000 >> 2) + (0x400 >> 3) - 1
$6 = 0x1600007f
(gdb) p/x $pmaaddr0=0x1600007fl
$8 = 0x1600007f
(gdb) p/x $pmaaddr0
$9 = 0x160001ff
(gdb) pma_to_addr 0x160001ff
translate pmaaddr 0x160001ff
==========================================
power:  12
base:?? 0x1000
region: 0x58000000 ~ 0x58001000

[1] http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf

[...]
> >
> > Can we simplify the logic to calculate the value of pmaaddr?
> >
> > If addr = 0x58000000
> >    size = 0x08000000
> >
> > pmaaddr = (addr >> 2) + (size >> 3) - 1 = 0x16ffffff
> >
> Ok I'll simply as above.
> 
> Cheers,
> Prabhakar

Best regards,
Peter Lin

