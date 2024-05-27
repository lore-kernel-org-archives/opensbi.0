From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 27 May 2024 21:33:41 +0530
Subject: [PATCH v2 0/5] Add Svadu extension support
In-Reply-To: <b960ed8c-6ad2-4a1b-8e6c-ac3d282ee1c0@ghiti.fr>
References: <20231024101145.32000-1-yongxuan.wang@sifive.com>
 <CAAhSdy2ALrnjXMUoA0AondR1-pEPyLCafsZX=N=d2gN7WL3nGQ@mail.gmail.com>
 <20c80bc9-e5a0-4173-9546-061eff7add43@ghiti.fr> <CAAhSdy00Ngr2kX+CzKRw=+GvPHP_PsuOBuSV1czoyGM+V8bt1A@mail.gmail.com>
 <b960ed8c-6ad2-4a1b-8e6c-ac3d282ee1c0@ghiti.fr>
Message-ID: <CAK9=C2V+LzF+135WBb8+SGcbQ=A6jHuk+rFbBH7mPs6CUvAxWg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 25, 2024 at 1:08?AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Anup,
>
> On 24/05/2024 18:05, Anup Patel wrote:
> > Hi Alex,
> >
> > On Fri, May 24, 2024 at 5:01?PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> >> Hi Anup,
> >>
> >> On 14/11/2023 17:45, Anup Patel wrote:
> >>> On Tue, Oct 24, 2023 at 3:42?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
> >>>> This series enables Svadu extension support by configuring the menvcfg
> >>>> CSR and, if available, displays the Svadu extension in the boot log.
> >>>>
> >>>> Additionally, we've made some programming improvements in
> >>>> lib/sbi/sbi_hart.c and lib/utils/fdt/fdt_helper.c.
> >>>>
> >>>> ---
> >>>> v2:
> >>>> - Rearrange the patches to do the code refactoring first before adding
> >>>>     new features
> >>>> - Suggested by Anup and Atish, detect extensions from DT instead of
> >>>>     menvcfg CSR
> >>>> - Enable access to some extensions through menvcfg CSR if they are
> >>>>     present in the device tree.
> >>>>
> >>>> Yong-Xuan Wang (5):
> >>>>     lib: sbi: Improve the code of privilege mode and extensions detection
> >>>>     lib: sbi: Refactor the code for enable extensions in menvfg CSR
> >>>>     lib: sbi: Using one array to define the name of extensions
> >>>>     lib: sbi: Detect extensions from the ISA string in DT
> >>>>     lib: sbi: Add support for Svadu extension
> >>> For backward compatibility with existing OSes, it is better to have
> >>> supervisor OS explicitly enable Svadu using the upcoming SBI
> >>> FWFT extension instead of enabling it unconditionally whenever
> >>> Svadu extension is available.
> >>
> >> I find this weird because maintaining backward compatibility here means
> >> "continue ignoring svadu present in the device tree".
> >>
> >> Why should we treat svadu differently than svpbmt? I understand FWFT
> >> will fix this, but will that be available?
> > Svpbmt defines a backward compatible PTE encoding so OSes
> > unaware of Svpbmt work fine. Unfortunately, this is not true for
> > Svadu because it changes trapping behaviour of PTE A/D bits
> > in a non-backward compatible way.
>
>
> Svadu-unaware kernels will protect pages so that they can set A/D bits
> when taking the trap, but that's not incompatible with Svadu. The
> setting of A or D bit in HW does not prevent this to work, so that's not
> non-backward compatible, it is just redundant.

I think you are assuming that all OSes have a separate
background thread for scanning page tables for accessed/dirty
pages hence it does not matter who updates the PTE A/D bits.

Alternately, it is also possible that an OS does not have background
thread for scanning page tables and does more work in traps apart
from updating PTE A/D bits. In such case, if OS stops receiving
traps then it would definitely break.

We had a discussion about this on PRS mailing list as well.
(https://lists.riscv.org/g/tech-prs/message/915)

<snip>

Regards,
Anup

