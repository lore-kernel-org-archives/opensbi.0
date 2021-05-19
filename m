From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 19 May 2021 11:10:56 +0000
Subject: [PATCH] Makefile: unconditionally disable SSP
In-Reply-To: <2c8a933bae5cbe989227f44b52b451acd09b5ecf.camel@126.com>
References: <20210515081638.2361496-1-fontaine.fabrice@gmail.com>
 <2c8a933bae5cbe989227f44b52b451acd09b5ecf.camel@126.com>
Message-ID: <CO6PR04MB7812F94B43E6DD3399E1BDC18D2B9@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Xiang W
> Sent: 15 May 2021 17:37
> To: Fabrice Fontaine <fontaine.fabrice@gmail.com>;
> opensbi at lists.infradead.org
> Subject: Re: [PATCH] Makefile: unconditionally disable SSP
> 
> ? 2021-05-15?? 10:16 +0200?Fabrice Fontaine???
> > Though -nostdlib is passed in CFLAGS, -fno-stack-protector must also
> > be passed to avoid linking errors related to undefined references to
> > '__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
> > -fstack-protector.
> >
> > Fixes:
> >  - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
> >
> 
> Reviewed-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index eeffe6b..6b64205 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -203,7 +203,7 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
> >  GENFLAGS	+=	$(platform-genflags-y)
> >  GENFLAGS	+=	$(firmware-genflags-y)
> >
> > -CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib
> > -fno-strict-aliasing -O2
> > +CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib
> > -fno-stack-protector -fno-strict-aliasing -O2
> >  CFLAGS		+=	-fno-omit-frame-pointer -fno-
> > optimize-sibling-calls
> >  CFLAGS		+=	-mno-save-restore -mstrict-align
> >  CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI)
> > -march=$(PLATFORM_RISCV_ISA)
> > --
> > 2.30.2
> >
> >
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi
