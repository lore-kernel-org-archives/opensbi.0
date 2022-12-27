From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Dec 2022 20:07:40 +0800
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com>
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmX9u1Fpy-ZQP=Gyp=-jwc5OzRM7XziCkydLcsQqYBivKg@mail.gmail.com> <374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com>
Message-ID: <CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 27, 2022 at 8:01 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
>
>
> On 12/27/22 12:46, Bin Meng wrote:
> > On Tue, Dec 27, 2022 at 7:03 PM Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >>
> >> plic_priority_save() and plic_priority_restore() access indexes 1 to num of
> >> the passed array. Avoid a buffer overrun by increasing the used array size
> >> by one.
> >>
> >> Addresses-Coverity-ID: 1530251 ("Out-of-bounds access")
> >> Addresses-Coverity-ID: 1530252 ("Out-of-bounds access")
> >
> > Where is the Coverity for OpenSBI project hosted?
>
> https://scan.coverity.com
>
> >
> >> Fixes: 8509e46ca63a ("lib: utils/irqchip: plic: Ensure no out-of-bound access in priority save/restore helpers")
> >> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> >> ---
> >>   platform/generic/allwinner/sun20i-d1.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> >> index 1da9e5b..9891ad0 100644
> >> --- a/platform/generic/allwinner/sun20i-d1.c
> >> +++ b/platform/generic/allwinner/sun20i-d1.c
> >> @@ -72,7 +72,7 @@ static void sun20i_d1_csr_restore(void)
> >>   #define PLIC_SOURCES                   176
> >>   #define PLIC_IE_WORDS                  ((PLIC_SOURCES + 31) / 32)
> >>
> >> -static u8 plic_priority[PLIC_SOURCES];
> >> +static u8 plic_priority[PLIC_SOURCES + 1];
> >
> > This change could fix the Coverity, but IMHO we should not change this
> > value. PLIC_SOURCES should be 176.
> >
> > You probably are using a buggy DTB that contains a wrong "riscv,ndev",
> > which I pointed out in the linux-riscv ML.
>
> The problem does not depend on any device-tree. PLIC_SOURCES is a
> constant that your code uses in
>
> platform/generic/allwinner/sun20i-d1.c:82:
> fdt_plic_priority_save(plic_priority, PLIC_SOURCES);
> platform/generic/allwinner/sun20i-d1.c:88:
> fdt_plic_priority_restore(plic_priority, PLIC_SOURCES);
>
> I wonder why plic_priority_save() and plic_priority_restore() start
> indexing at 1 and not at 0. This might deserve a code comment.

Please see the link I provided. In my original patch with the size
check, this Coverity issue won't happen.

> >
> >>   static u32 plic_sie[PLIC_IE_WORDS];
> >>   static u32 plic_threshold;
> >>
> >
> > My original patch [1] contains a size check against "riscv,ndev" in
> > the DTB. But somehow that size check got dropped when the patch was
> > applied.
> >
> > [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221211065424.806478-2-bmeng at tinylab.org/
>
> "riscv,ndev" isn't used anywhere in your patch. Just the constant
> PLIC_SOURCES.
>

Changing the array size to PLIC_SOURCES + 1 does not make sense. The
PLIC_SOURCES should be 176 which is correct as it includes source 0 on
the Allwinner SoC. The "riscv,ndev" [1] should not be 176 otherwise it
will create a buffer overrun.

[1] https://lore.kernel.org/linux-riscv/20221128133421.58614-1-bmeng at tinylab.org/

Regards,
Bin

