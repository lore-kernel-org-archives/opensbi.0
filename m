From: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>
Date: Tue, 18 May 2021 00:36:50 +0000
Subject: [PATCH v1 1/3] lib: utils: Add macro to libfdt_env.h for strncpy
In-Reply-To: <94d2a372d500c14d89e6797da2f09f9b211a3969.camel@126.com>
References: <20210517113319.25855-1-daniel.schaefer@hpe.com>
 <20210517113319.25855-2-daniel.schaefer@hpe.com>
 <94d2a372d500c14d89e6797da2f09f9b211a3969.camel@126.com>
Message-ID: <CS1PR8401MB1144C3DB71CC0E7169739752FF2C9@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Abner Chang <abner.chang@hpe.com>

> -----Original Message-----
> From: Xiang W [mailto:wxjstz at 126.com]
> Sent: Monday, May 17, 2021 9:48 PM
> To: Schaefer, Daniel <daniel.schaefer@hpe.com>; opensbi at lists.infradead.org
> Cc: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>; Anup
> Patel <Anup.Patel@wdc.com>
> Subject: Re: [PATCH v1 1/3] lib: utils: Add macro to libfdt_env.h for strncpy
> 
> ? 2021-05-17?? 19:33 +0800?Daniel Schaefer???
> > Just like 2845d2d2cf4fb74a89452ba223995aa4a118c07e
> >
> > Cc: Abner Chang <abner.chang@hpe.com>
> > Cc: Anup Patel <Anup.Patel@wdc.com>
> > Signed-off-by: Daniel Schaefer <daniel.schaefer@hpe.com>
> Look good to me.
> This description doesn't look very clear.
> 
> I recommend reword:
> 
> lib: utils: Add a macro in libfdt_env.h for strncpy
> 
> This commit add a macro to replace strncpy with sbi_strncpy.
> 
> Regards
> Xiang W
> > ---
> >  lib/utils/libfdt/libfdt_env.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/lib/utils/libfdt/libfdt_env.h
> > b/lib/utils/libfdt/libfdt_env.h
> > index bc3e7588660a..f9d9c6783c52 100644
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

