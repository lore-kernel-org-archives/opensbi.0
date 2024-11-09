From: Inochi Amaoto <inochiama@gmail.com>
Date: Sat, 9 Nov 2024 17:55:38 +0800
Subject: [PATCH v2 1/2] platform: ensure enough heap size with debug
 triggers extension
In-Reply-To: <CAAhSdy17mNYbT5ynOMMoFDw1Dov=g8pnakBiWGG7ykeKPdb29A@mail.gmail.com>
References: <20240920073738.597300-1-inochiama@gmail.com>
 <20240920073738.597300-2-inochiama@gmail.com>
 <CAAhSdy17mNYbT5ynOMMoFDw1Dov=g8pnakBiWGG7ykeKPdb29A@mail.gmail.com>
Message-ID: <b6yjkuxtbdfxxb7adffyiaikqujshhacfqajzdzfei4z2jjns7@my3ldatybfta>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 09, 2024 at 02:24:42PM +0530, Anup Patel wrote:
> On Fri, Sep 20, 2024 at 1:09?PM Inochi Amaoto <inochiama@gmail.com> wrote:
> >
> > DBTR introduce a big heap allocation to store hart state, this is
> > allocated percpu and needs big space when CPU number is high.
> >
> > Increase the percpu part to fix this problem, and decrease the
> > fixed part to avoid too big heap size.
> >
> > Fixes: 97f234f (lib: sbi: Introduce the SBI debug triggers extension support)
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Reviewed-by: Xiang W <wxjstz@126.com>
> > ---
> >  include/sbi/sbi_platform.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> > index 7b3ac4b..d1c556c 100644
> > --- a/include/sbi/sbi_platform.h
> > +++ b/include/sbi/sbi_platform.h
> > @@ -152,7 +152,7 @@ struct sbi_platform_operations {
> >
> >  /** Platform default heap size */
> >  #define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)     \
> > -                                       (0x8000 + 0x800 * (__num_hart))
> > +                                       (0x4000 + 0x2000 * (__num_hart))
> 
> The per-HART DTBR state is 1536 bytes so I don't see the point
> in such an arbitrary increase.
> 
> How about below ?
> 
>  #define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)     \
> -                                       (0x8000 + 0x800 * (__num_hart))
> +                                       (0x8000 + 0x1000 * (__num_hart))
> 
> Regards,
> Anup
> 

Yeah, it is OK for me. I will change the formula to 0x1000 per hart,
thanks.

Regards,
Inochi

> >
> >  /** Representation of a platform */
> >  struct sbi_platform {
> > --
> > 2.46.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

