From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 12 May 2023 17:06:09 +0200
Subject: [PATCH v4 2/3] lib: sbi: Introduce register_extensions extension
 callback
In-Reply-To: <CAAhSdy0MEK7Gb5bPoA896tAwnztR_=bMzcisC0bs-MmznXrMSQ@mail.gmail.com>
References: <20230511161104.115168-1-ajones@ventanamicro.com>
 <20230511161104.115168-3-ajones@ventanamicro.com>
 <CAAhSdy0MEK7Gb5bPoA896tAwnztR_=bMzcisC0bs-MmznXrMSQ@mail.gmail.com>
Message-ID: <20230512-c5340e4149046d611eb57a85@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 12, 2023 at 07:55:56PM +0530, Anup Patel wrote:
> On Thu, May 11, 2023 at 9:41?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > The register_extensions callback is called from sbi_ecall_init() for
> > any extension that provides it. It's purpose is to register the
> > extension with one or more sbi_ecall_register_extension() calls after
> > possibly narrowing the range of extension IDs that should be handled.
> > More than one call of sbi_ecall_register_extension() is necessary
> > when the supported extension ID ranges have gaps. Additionally, when
> > an extension may not be available and has a probe function, then the
> > probe function should be consulted as to whether or not the extension
> > should be registered. In summary, when register_extensions() returns,
> > only valid extension IDs from the initial range, which are also
> > available, have been registered.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  include/sbi/sbi_ecall.h | 1 +
> >  lib/sbi/sbi_ecall.c     | 8 ++++++--
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
> > index ff9bf8e2b435..fac26429cf5d 100644
> > --- a/include/sbi/sbi_ecall.h
> > +++ b/include/sbi/sbi_ecall.h
> > @@ -24,6 +24,7 @@ struct sbi_ecall_extension {
> >         struct sbi_dlist head;
> >         unsigned long extid_start;
> >         unsigned long extid_end;
> > +       int (* register_extensions)(void);
> >         int (* probe)(unsigned long extid, unsigned long *out_val);
> >         int (* handle)(unsigned long extid, unsigned long funcid,
> >                        const struct sbi_trap_regs *regs,
> > diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> > index 5a301fb7d403..1c4a26fde438 100644
> > --- a/lib/sbi/sbi_ecall.c
> > +++ b/lib/sbi/sbi_ecall.c
> > @@ -154,8 +154,12 @@ int sbi_ecall_init(void)
> >
> >         for (i = 0; i < sbi_ecall_exts_size; i++) {
> >                 ext = sbi_ecall_exts[i];
> > -               if (ext->extid_start != ext->extid_end || !ext->probe ||
> > -                   (!ext->probe(ext->extid_end, &out_val) && out_val)) {
> > +               if (ext->register_extensions) {
> > +                       ret = ext->register_extensions();
> > +                       if (ret)
> > +                               return ret;
> > +               } else if (ext->extid_start != ext->extid_end || !ext->probe ||
> > +                          (!ext->probe(ext->extid_end, &out_val) && out_val)) {
> 
> We should replace probe() callback with register_extensions()
> and code over here can be something like below:

We need to keep probe in case an extension wants to implement a
nonzero out_val, which can be inspected by S-mode with the Base
extension probe function:

"""
Probe SBI extension (FID #3)

Returns 0 if the given SBI extension ID (EID) is not available, or
1 if it is available unless defined as any other non-zero value by
the implementation.
"""

> 
> if (ext->register_extensions)
>      ret = ext->register_extensions();
> else if (ext->extid_start == ext->extid_end)
>      ret = sbi_ecall_register_extension(ext);

Also here, if we don't have probe, then we can't know if the single
ID extension should be added or not. Not adding the extensions which
fail probe to the list, so sbi_ecall_find_extension() can't find
them when their functions are invoked, is the main motivation of the
series.

> else
>      ret = SBI_ENODEV;
> if (ret)
>     return ret;
> 
> Basically, register_extensions() is optional for single extension ID
> but mandatory for extension ID range.

Oh, right, register_extensions() needs to be mandatory for multi-ID
extensions, otherwise we would still need a change in
sbi_ecall_find_extension() to ensure we don't return the extension for
IDs which aren't available. However, if we make it mandatory for all
multi-ID extensions, then the legacy extensions will need to implement
it, even though it will just call sbi_ecall_register_extension() without
making any changes first. I guess that's fine.

I'll go ahead and make register_extensions() mandatory for multi-ID
extensions and add the callback to the legacy range. So, assuming we
keep probe for the reasons I stated above, then we'll have this

 if (ext->register_extensions) {
     ret = ext->register_extensions();
 else if (ext->extid_start == ext->extid_end)
     if (!ext->probe || (!ext->probe(ext->extid_end, &out_val) && out_val))
         ret = sbi_ecall_register_extension(ext);
 else
     ret = SBI_ENODEV;

 if (ret)
     return ret;


Thanks,
drew

