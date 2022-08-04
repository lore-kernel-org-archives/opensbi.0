From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Aug 2022 16:57:42 +0530
Subject: [PATCH v5 14/16] platform: generic: Use kconfig to set platform
 version and default name
In-Reply-To: <20220802075149.ooplx7h5oqbrief5@kamzik>
References: <20220802044132.280529-1-apatel@ventanamicro.com>
 <20220802044132.280529-15-apatel@ventanamicro.com> <20220802075149.ooplx7h5oqbrief5@kamzik>
Message-ID: <CAAhSdy0+RN_263DeD8cAwGvi8ZL=r02eV1bJwOpyJUzNpEH0Hg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 2, 2022 at 1:21 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Aug 02, 2022 at 10:11:30AM +0530, Anup Patel wrote:
> > The generic platform version and default name should be set based
> > on kconfig options so that users can override it.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  platform/generic/Kconfig    | 14 ++++++++++++++
> >  platform/generic/platform.c |  6 ++++--
> >  2 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> > index c76bd12..397dcb5 100644
> > --- a/platform/generic/Kconfig
> > +++ b/platform/generic/Kconfig
> > @@ -9,6 +9,20 @@ config PLATFORM_GENERIC
> >
> >  if PLATFORM_GENERIC
> >
> > +config PLATFORM_GENERIC_NAME
> > +     string "Generic platform default name"
> > +     default "Generic"
> > +
> > +config PLATFORM_GENERIC_MAJOR_VER
> > +     int "Generic platform major version"
> > +     range 0 65535
> > +     default 0
> > +
> > +config PLATFORM_GENERIC_MINOR_VER
> > +     int "Generic platform minor version"
> > +     range 0 65535
> > +     default 1
>
> I'm not sure we want 'GENERIC' and 'Generic' in these symbol names and
> symbol descriptions.

Let's keep the "GENERIC" in symbol names so that it is clear these
symbols are from generic platform configuration.

I will certainly remove "Generic" from the symbol descriptions.

>
> > +
> >  config PLATFORM_ALLWINNER_D1
> >       bool "Allwinner D1 support"
> >       depends on FDT_IRQCHIP_PLIC
> > diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> > index bf93af6..cc3620f 100644
> > --- a/platform/generic/platform.c
> > +++ b/platform/generic/platform.c
> > @@ -265,8 +265,10 @@ const struct sbi_platform_operations platform_ops = {
> >
> >  struct sbi_platform platform = {
> >       .opensbi_version        = OPENSBI_VERSION,
> > -     .platform_version       = SBI_PLATFORM_VERSION(0x0, 0x01),
> > -     .name                   = "Generic",
> > +     .platform_version       =
> > +             SBI_PLATFORM_VERSION(CONFIG_PLATFORM_GENERIC_MAJOR_VER,
> > +                                  CONFIG_PLATFORM_GENERIC_MINOR_VER),
> > +     .name                   = CONFIG_PLATFORM_GENERIC_NAME,
> >       .features               = SBI_PLATFORM_DEFAULT_FEATURES,
> >       .hart_count             = SBI_HARTMASK_MAX_BITS,
> >       .hart_index2id          = generic_hart_index2id,
> > --
> > 2.34.1
> >
>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
Anup

