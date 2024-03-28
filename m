From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Thu, 28 Mar 2024 15:11:59 +0100
Subject: [PATCH 3/9] lib: sbi_emulate_csr: Utilize platform hooks for
 unknown CSRs
In-Reply-To: <8b42b081-5621-47d1-8dd2-a92f6220bfa2@dram.page>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
 <20240327101137.3644359-4-christoph.muellner@vrull.eu> <8b42b081-5621-47d1-8dd2-a92f6220bfa2@dram.page>
Message-ID: <CAEg0e7j_K2GFu-D5HGw-Q5F9M22rBYHM8GQuTmBNYtDhXwOJmg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[adding the list]

On Wed, Mar 27, 2024 at 12:22?PM Vivian Wang <uwu@dram.page> wrote:
>
> On 3/27/24 18:11, Christoph M?llner wrote:
> > In case we trap during CSR accesses, we have a few defined CSRs
> > that are gracefully emulated. In case we don't know what to do
> > with an unknown CSR, let's give the platform a chance to handle
> > the CSR access.
>
> This seems to be a pretty awful way to handle this. Can we use a vendor
> SBI extension [1] instead? It would be far easier to implement and also
> easier for users to use and probe for suppport.
>
> Also, the C910 manual mentions a sxstatus register that is partly RO and
> partly RW in Supervisor mode. Can we just use that instead?

Yes, I'll switch to sxstatus (I was not aware of this CSR).
Thanks!

>
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-vendor.adoc
> [2] https://github.com/T-head-Semi/openc910/blob/main/doc/%E7%8E%84%E9%93%81C910%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf
>
> Vivian "dram"
> > Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
> > ---
> >  lib/sbi/sbi_emulate_csr.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
> > index 5f3b111..a6cb855 100644
> > --- a/lib/sbi/sbi_emulate_csr.c
> > +++ b/lib/sbi/sbi_emulate_csr.c
> > @@ -14,6 +14,7 @@
> >  #include <sbi/sbi_emulate_csr.h>
> >  #include <sbi/sbi_error.h>
> >  #include <sbi/sbi_hart.h>
> > +#include <sbi/sbi_platform.h>
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi/sbi_timer.h>
> >  #include <sbi/sbi_trap.h>
> > @@ -147,7 +148,8 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
> >  #undef switchcase_hpm
> >
> >       default:
> > -             ret = SBI_ENOTSUPP;
> > +             ret = sbi_platform_read_csr(sbi_platform_ptr(scratch),
> > +                                         csr_num, regs, csr_val);
> >               break;
> >       }
> >
> > @@ -162,6 +164,7 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
> >                         ulong csr_val)
> >  {
> >       int ret = 0;
> > +     struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> >       ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
> >  #if __riscv_xlen == 32
> >       bool virt = (regs->mstatusH & MSTATUSH_MPV) ? true : false;
> > @@ -185,7 +188,8 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
> >               break;
> >  #endif
> >       default:
> > -             ret = SBI_ENOTSUPP;
> > +             ret = sbi_platform_write_csr(sbi_platform_ptr(scratch),
> > +                                          csr_num, regs, csr_val);
> >               break;
> >       }
> >
>
>

