From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 24 Nov 2023 12:55:33 +0800
Subject: [PATCH v2 0/5] Add Svadu extension support
In-Reply-To: <CAAhSdy2ALrnjXMUoA0AondR1-pEPyLCafsZX=N=d2gN7WL3nGQ@mail.gmail.com>
References: <20231024101145.32000-1-yongxuan.wang@sifive.com> <CAAhSdy2ALrnjXMUoA0AondR1-pEPyLCafsZX=N=d2gN7WL3nGQ@mail.gmail.com>
Message-ID: <CAMWQL2j42qmbT0EHsd35yaThJB9r_w8v-ZVuiH+YOs97u2-35w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 15, 2023 at 12:46?AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Oct 24, 2023 at 3:42?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
> >
> > This series enables Svadu extension support by configuring the menvcfg
> > CSR and, if available, displays the Svadu extension in the boot log.
> >
> > Additionally, we've made some programming improvements in
> > lib/sbi/sbi_hart.c and lib/utils/fdt/fdt_helper.c.
> >
> > ---
> > v2:
> > - Rearrange the patches to do the code refactoring first before adding
> >   new features
> > - Suggested by Anup and Atish, detect extensions from DT instead of
> >   menvcfg CSR
> > - Enable access to some extensions through menvcfg CSR if they are
> >   present in the device tree.
> >
> > Yong-Xuan Wang (5):
> >   lib: sbi: Improve the code of privilege mode and extensions detection
> >   lib: sbi: Refactor the code for enable extensions in menvfg CSR
> >   lib: sbi: Using one array to define the name of extensions
> >   lib: sbi: Detect extensions from the ISA string in DT
> >   lib: sbi: Add support for Svadu extension
>
> For backward compatibility with existing OSes, it is better to have
> supervisor OS explicitly enable Svadu using the upcoming SBI
> FWFT extension instead of enabling it unconditionally whenever
> Svadu extension is available.
>
> Regards,
> Anup
>

Hi Anup,

Thank you! I'll remove the enablement of Svadu extension in the next version.

Regards,
Yong-Xuan

> >
> >  include/sbi/riscv_encoding.h |   6 +-
> >  include/sbi/sbi_hart.h       |  15 +++
> >  lib/sbi/sbi_hart.c           | 226 +++++++++++++----------------------
> >  lib/utils/fdt/fdt_helper.c   |   5 +-
> >  4 files changed, 104 insertions(+), 148 deletions(-)
> >
> > --
> > 2.17.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

