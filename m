From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 19 May 2021 12:51:34 +0000
Subject: [PATCH v2 1/3] lib: utils: Add strncpy macro to libfdt_env.h
In-Reply-To: <e14b8291aeddae5fac55973a7695608b2c66d082.camel@126.com>
References: <20210519075410.8520-1-daniel.schaefer@hpe.com>
 <20210519075410.8520-2-daniel.schaefer@hpe.com>
 <e14b8291aeddae5fac55973a7695608b2c66d082.camel@126.com>
Message-ID: <CO6PR04MB7812C7B65D8475E9682CFAA08D2B9@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Xiang W <wxjstz@126.com>
> Sent: 19 May 2021 14:08
> To: Daniel Schaefer <daniel.schaefer@hpe.com>;
> opensbi at lists.infradead.org
> Cc: Abner Chang <abner.chang@hpe.com>; Anup Patel
> <Anup.Patel@wdc.com>
> Subject: Re: [PATCH v2 1/3] lib: utils: Add strncpy macro to libfdt_env.h
> 
> ? 2021-05-19?? 15:54 +0800?Daniel Schaefer???
> > Just like 2845d2d2cf4fb74a89452ba223995aa4a118c07e
> > we want to use sbi_strncpy as strncpy in the OpenSBI implementation
> > for libfdt.
> >
> > Cc: Abner Chang <abner.chang@hpe.com>
> > Cc: Anup Patel <Anup.Patel@wdc.com>
> > Signed-off-by: Daniel Schaefer <daniel.schaefer@hpe.com>
> > Reviewed-by: Abner Chang <abner.chang@hpe.com>
> 
> Reviewed-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> 
> > ---
> >  lib/utils/libfdt/libfdt_env.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/lib/utils/libfdt/libfdt_env.h
> > b/lib/utils/libfdt/libfdt_env.h index bc3e7588660a..f9d9c6783c52
> > 100644
> > --- a/lib/utils/libfdt/libfdt_env.h
> > +++ b/lib/utils/libfdt/libfdt_env.h
> > @@ -31,6 +31,7 @@
> >  #define strchr		sbi_strchr
> >  #define strrchr		sbi_strrchr
> >  #define strcpy		sbi_strcpy
> > +#define strncpy		sbi_strncpy
> >  #define strcmp		sbi_strcmp
> >  #define strncmp		sbi_strncmp
> >  #define strlen		sbi_strlen
> > --
> > 2.30.1
> >
> >

