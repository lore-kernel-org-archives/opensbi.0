From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Jan 2023 08:45:21 +0530
Subject: [PATCH] firmware: Fix fw_rw_offset computation in fw_base.S
In-Reply-To: <CA+V-a8ukLMTyWtCNn3U5x7Ksu4+_Xvh+eP-Wgndp55JF_diKLQ@mail.gmail.com>
References: <20230126155238.2617075-1-apatel@ventanamicro.com> <CA+V-a8ukLMTyWtCNn3U5x7Ksu4+_Xvh+eP-Wgndp55JF_diKLQ@mail.gmail.com>
Message-ID: <CAAhSdy3w-wb8_0Xk1MEd3URk5Y0B+a=Nmnxm=yo+8=LRnip10Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 3:53 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> On Thu, Jan 26, 2023 at 3:53 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > From: Jessica Clarke <jrtc27@jrtc27.com>
> >
> > It seems BFD just does totally nonsensical things for SHN_ABS symbols
> > when producing position-independent outputs (both -pie and -shared)
> > for various historical reasons, and so SHN_ABS symbols are still
> > subject to relocation as far as BFD is concerned (except AArch64,
> > which fixes it in limited cases that don?t apply here...).
> >
> > The above affects the _fw_rw_offset provided through fw_base.ldS
> > linker script which results in OpenSBI firmware failing to boot
> > whne loaded at an address different from FW_TEXT_START.
> >
> s/whne/when

Okay, I will fix the typo at the time of merging this patch.

>
> > Fixes: c10e3fe5f9a1 ("firmware: Add RW section offset in scratch")
> > Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> > Tested-by: Anup Patel <apatel@ventanamicro.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  firmware/fw_base.S   | 2 +-
> >  firmware/fw_base.ldS | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> Reported-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for testing it.

I have applied this patch to the riscv/opensbi repo.

Regards,
Anup

>
> Cheers,
> Prabhakar
>
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> > index e04b683..fb6ac92 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -526,7 +526,7 @@ _link_start:
> >  _link_end:
> >         RISCV_PTR       _fw_reloc_end
> >  __fw_rw_offset:
> > -       RISCV_PTR       _fw_rw_offset
> > +       RISCV_PTR       _fw_rw_start - _fw_start
> >
> >         .section .entry, "ax", %progbits
> >         .align 3
> > diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> > index 9a1304e..3d68484 100644
> > --- a/firmware/fw_base.ldS
> > +++ b/firmware/fw_base.ldS
> > @@ -64,7 +64,7 @@
> >         . = ALIGN(1 << LOG2CEIL((SIZEOF(.rodata) + SIZEOF(.text)
> >                                 + SIZEOF(.dynsym) + SIZEOF(.rela.dyn))));
> >
> > -       PROVIDE(_fw_rw_offset = (.  - _fw_start));
> > +       PROVIDE(_fw_rw_start = .);
> >
> >         /* Beginning of the read-write data sections */
> >
> > --
> > 2.34.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

