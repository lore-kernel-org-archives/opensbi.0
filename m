From: Yao Zi <ziyao@disroot.org>
Date: Tue, 25 Mar 2025 08:43:45 +0000
Subject: [PATCH 1/2] lib: sbi: hart: Detect existence of cycle and
 instret CSRs for Zicntr
In-Reply-To: <CAAhSdy0LhKVEmvOHNObyDHDixCZ+GQh=hWK+g3NZVFWHBrmKnQ@mail.gmail.com>
References: <20250225154103.5229-1-ziyao@disroot.org>
 <20250225154103.5229-2-ziyao@disroot.org>
 <CAAhSdy0LhKVEmvOHNObyDHDixCZ+GQh=hWK+g3NZVFWHBrmKnQ@mail.gmail.com>
Message-ID: <Z-Jswdfa7pbQlnib@pie>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 25, 2025 at 01:45:25PM +0530, Anup Patel wrote:
> On Tue, Feb 25, 2025 at 10:14?PM Yao Zi <ziyao@disroot.org> wrote:
> >
> > Zicntr extension specifies three RO CSRs, time, cycle and instret. It
> > isn't precise to report Zicntr is fully supported with only time CSR
> > detected.
> >
> > Since CSR emulating code only cares about the availablity of time CSR,
> > add additional definitions to represent the existance of cycle and
> > instret CSRs.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  include/sbi/sbi_hart.h |  8 ++++++--
> >  lib/sbi/sbi_hart.c     | 30 ++++++++++++++++++++++--------
> >  lib/sbi/sbi_timer.c    |  2 +-
> >  3 files changed, 29 insertions(+), 11 deletions(-)
> >
> > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> > index 4c36c77..0a740cf 100644
> > --- a/include/sbi/sbi_hart.h
> > +++ b/include/sbi/sbi_hart.h
> > @@ -37,8 +37,12 @@ enum sbi_hart_extensions {
> >         SBI_HART_EXT_SSCOFPMF,
> >         /** HART has Sstc extension */
> >         SBI_HART_EXT_SSTC,
> > -       /** HART has Zicntr extension (i.e. HW cycle, time & instret CSRs) */
> > -       SBI_HART_EXT_ZICNTR,
> > +       /** HART has HW time CSR, as specified in Zicntr extension */
> > +       SBI_HART_EXT_ZICNTR_TIME,
> > +       /** HART has HW cycle CSR, as specified in Zicntr extension */
> > +       SBI_HART_EXT_ZICNTR_CYCLE,
> > +       /** HART has HW instret CSR, as specified in Zicntr extension */
> > +       SBI_HART_EXT_ZICNTR_INSTRET,
> 
> Zicntr_time, Zicntr_cycle, and Zicntr_instret are not real extension
> names so let's not add pseudo extension names.
> 
> Instead, I suggest introducing "enum sbi_hart_csrs" for CSRs
> detected at boot-time. We will also need "csrs" bitmap in
> "struct sbi_hart_features".
> 
> The new "enum sbi_hart_csrs" can have:
> SBI_HART_CSR_CYCLE,
> SBI_HART_CSR_TIME,
> SBI_HART_CSR_INSTRET
> 
> These bits will be set in "struct sbi_hart_features" when
> corresponding CSRs are detected at boot-time.

Makes sense to me, I'll take it in v2.

Thanks,
Yao Zi

