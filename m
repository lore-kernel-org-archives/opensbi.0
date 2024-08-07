From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 7 Aug 2024 17:46:26 +0800
Subject: [PATCH 14/16] lib: sbi: Implement SBI MPXY extension
In-Reply-To: <CA+Oz1=b-YXqJONFa11FC6q69r=R=ORqWmCR=aPJmW7wHdKrK5w@mail.gmail.com>
References: <20240806073338.1856901-1-apatel@ventanamicro.com>
 <20240806073338.1856901-15-apatel@ventanamicro.com>
 <ZrM9Yir0L5o5NAJL@APC323>
 <CA+Oz1=b-YXqJONFa11FC6q69r=R=ORqWmCR=aPJmW7wHdKrK5w@mail.gmail.com>
Message-ID: <ZrNCcolRLobzoeL7@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Rahul,

On Wed, Aug 07, 2024 at 03:04:31PM +0530, Rahul Pathak wrote:
> [EXTERNAL MAIL]
> 
> On Wed, Aug 7, 2024 at 2:55?PM Yu-Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Hi Anup,
> >
> > On Tue, Aug 06, 2024 at 01:03:36PM +0530, Anup Patel wrote:
> > > [EXTERNAL MAIL]
> > >
> > > Implement the SBI MPXY extension which provides an SBI interface to
> > > the supervisor software for send messages via MPXY framework.
> > >
> > > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > > Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  include/sbi/sbi_ecall_interface.h | 10 +++++
> > >  lib/sbi/Kconfig                   |  3 ++
> > >  lib/sbi/objects.mk                |  3 ++
> > >  lib/sbi/sbi_ecall_mpxy.c          | 68 +++++++++++++++++++++++++++++++
> > >  4 files changed, 84 insertions(+)
> > >  create mode 100644 lib/sbi/sbi_ecall_mpxy.c
> > >
> > > diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> > > index 6b993b18..085b33e7 100644
> > > --- a/include/sbi/sbi_ecall_interface.h
> > > +++ b/include/sbi/sbi_ecall_interface.h
> > > @@ -35,6 +35,7 @@
> > >  #define SBI_EXT_DBTR                           0x44425452
> > >  #define SBI_EXT_SSE                            0x535345
> > >  #define SBI_EXT_FWFT                           0x46574654
> > > +#define SBI_EXT_MPXY                           0x4D505859
> > >
> > >  /* SBI function IDs for BASE extension*/
> > >  #define SBI_EXT_BASE_GET_SPEC_VERSION          0x0
> > > @@ -406,6 +407,15 @@ enum sbi_sse_state {
> > >  #define SBI_SSE_EVENT_GLOBAL_BIT               (1 << 15)
> > >  #define SBI_SSE_EVENT_PLATFORM_BIT             (1 << 14)
> > >
> > > +/* SBI function IDs for MPXY extension */
> > > +#define SBI_EXT_MPXY_SET_SHMEM                 0x0
> > > +#define SBI_EXT_MPXY_GET_CHANNEL_IDS           0x1
> >
> > I am unable to find this FID from the thread:
> > https://lists.riscv.org/g/tech-rpmi/message/89
> >
> > Could you please let me know if there's an updated
> > version of the MPXY Chapter?
> 
> This function was added in the V3 version of MPXY spec.
> Here is the link https://lists.riscv.org/g/tech-prs/message/974

Thanks for the information.

Best regards,
Peter Lin

> > Thanks,
> > Peter Lin
> >
> > > +#define SBI_EXT_MPXY_READ_ATTRS                        0x2
> > > +#define SBI_EXT_MPXY_WRITE_ATTRS               0x3
> > > +#define SBI_EXT_MPXY_SEND_MSG_WITH_RESP                0x4
> > > +#define SBI_EXT_MPXY_SEND_MSG_NO_RESP          0x5
> > > +#define SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS   0x6
> 
> 
> 
> --
> 
> Thanks
> Rahul Pathak

