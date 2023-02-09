From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Feb 2023 22:21:44 +0530
Subject: [PATCH v5 1/8] include: Add defines for SBI debug console extension
In-Reply-To: <20230131172639.cscl4ixscibnokot@orel>
References: <20230113114110.1916226-1-apatel@ventanamicro.com>
 <20230113114110.1916226-2-apatel@ventanamicro.com> <20230131172639.cscl4ixscibnokot@orel>
Message-ID: <CAAhSdy1HM3ErPdoW9e_On7pjewBhXubZ_2GzmYnzv4CfwOODNA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 10:56 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Jan 13, 2023 at 05:11:03PM +0530, Anup Patel wrote:
> > We add SBI debug console extension related defines/enum to the
>
> Not adding any enums.

Okay, I will update.

>
> > SBI ecall interface header.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > Reviewed-by: Bin Meng <bmeng@tinylab.org>
> > Reviewed-by: Xiang W <wxjstz@126.com>
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> > ---
> >  include/sbi/sbi_ecall_interface.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> > index a3f2bf4..9d6f474 100644
> > --- a/include/sbi/sbi_ecall_interface.h
> > +++ b/include/sbi/sbi_ecall_interface.h
> > @@ -29,6 +29,7 @@
> >  #define SBI_EXT_HSM                          0x48534D
> >  #define SBI_EXT_SRST                         0x53525354
> >  #define SBI_EXT_PMU                          0x504D55
> > +#define SBI_EXT_DBCN                         0x4442434E
> >
> >  /* SBI function IDs for BASE extension*/
> >  #define SBI_EXT_BASE_GET_SPEC_VERSION                0x0
> > @@ -230,6 +231,11 @@ enum sbi_pmu_ctr_type {
> >  /* Flags defined for counter stop function */
> >  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> >
> > +/* SBI function IDs for DBCN extension */
> > +#define SBI_EXT_DBCN_CONSOLE_WRITE           0x0
> > +#define SBI_EXT_DBCN_CONSOLE_READ            0x1
> > +#define SBI_EXT_DBCN_CONSOLE_WRITE_BYTE              0x2
> > +
> >  /* SBI base specification related macros */
> >  #define SBI_SPEC_VERSION_MAJOR_OFFSET                24
> >  #define SBI_SPEC_VERSION_MAJOR_MASK          0x7f
> > --
> > 2.34.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

