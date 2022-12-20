From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Dec 2022 18:20:42 +0530
Subject: [PATCH v4 3/3] generic/starfive: Add Starfive JH7110 platform implementation
In-Reply-To: <86d58fe538e94baab146976c161efc27@EXMBX168.cuchost.com>
References: <20221220034102.150151-1-weiliang.lim@starfivetech.com>
 <20221220034102.150151-4-weiliang.lim@starfivetech.com> <CAK9=C2WQSv-MFDUrzfiG9CP_-Wb+Ru1e8WCwoezLzNFEWztUOw@mail.gmail.com>
 <b94eeb4f4a544b13bcc036235e80026b@EXMBX168.cuchost.com> <CAK9=C2UecME1zNtTE6vX+zYKGviJWxgZVF7_ksVFWnYRZxwjvQ@mail.gmail.com>
 <86d58fe538e94baab146976c161efc27@EXMBX168.cuchost.com>
Message-ID: <CAAhSdy1MyBAMXSrdVvTGWv0Zc+Q3ksyw2Xfac0=geJxJgBUrqw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 20, 2022 at 6:03 PM Cheehong Ang
<cheehong.ang@starfivetech.com> wrote:
>
> > -----Original Message-----
> > From: Anup Patel <apatel@ventanamicro.com>
> > Sent: Tuesday, December 20, 2022 8:04 PM
> > To: Cheehong Ang <cheehong.ang@starfivetech.com>
> > Cc: WeiLiang Lim <weiliang.lim@starfivetech.com>;
> > opensbi at lists.infradead.org; JunLiang Tan <junliang.tan@starfivetech.com>
> > Subject: Re: [PATCH v4 3/3] generic/starfive: Add Starfive JH7110 platform
> > implementation
> >
> > On Tue, Dec 20, 2022 at 5:08 PM Cheehong Ang
> > <cheehong.ang@starfivetech.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Anup Patel <apatel@ventanamicro.com>
> > > > Sent: Tuesday, December 20, 2022 7:05 PM
> > > > To: WeiLiang Lim <weiliang.lim@starfivetech.com>
> > > > Cc: opensbi at lists.infradead.org; Cheehong Ang
> > > > <cheehong.ang@starfivetech.com>; JunLiang Tan
> > > > <junliang.tan@starfivetech.com>
> > > > Subject: Re: [PATCH v4 3/3] generic/starfive: Add Starfive JH7110
> > > > platform implementation
> > > >
> > > > On Tue, Dec 20, 2022 at 9:12 AM Wei Liang Lim
> > > > <weiliang.lim@starfivetech.com> wrote:
> > > > >
> > > > > Add Starfive JH7110 platform implementation
> > > > >
> > > > > Signed-off-by: Wei Liang Lim <weiliang.lim@starfivetech.com>
> > > > > Reviewed-by: Chee Hong Ang <cheehong.ang@starfivetech.com>
> > > > > Reviewed-by: Jun Liang Tan <junliang.tan@starfivetech.com>
> > > > > ---
> > > > >  platform/generic/Kconfig             |  4 ++
> > > > >  platform/generic/configs/defconfig   |  1 +
> > > > >  platform/generic/starfive/jh7110.c   | 57
> > ++++++++++++++++++++++++++++
> > > > >  platform/generic/starfive/objects.mk |  6 +++
> > > > >  4 files changed, 68 insertions(+)  create mode 100644
> > > > > platform/generic/starfive/jh7110.c
> > > > >  create mode 100644 platform/generic/starfive/objects.mk
> > > > >
> > > > > diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> > > > > index
> > > > > 62c7a2d..47c10e5 100644
> > > > > --- a/platform/generic/Kconfig
> > > > > +++ b/platform/generic/Kconfig
> > > > > @@ -45,4 +45,8 @@ config PLATFORM_SIFIVE_FU740
> > > > >         depends on FDT_RESET && FDT_I2C
> > > > >         default n
> > > > >
> > > > > +config PLATFORM_STARFIVE_JH7110
> > > > > +       bool "StarFive JH7110 support"
> > > > > +       default n
> > > > > +
> > > > >  endif
> > > > > diff --git a/platform/generic/configs/defconfig
> > > > > b/platform/generic/configs/defconfig
> > > > > index 47fca95..4b0842e 100644
> > > > > --- a/platform/generic/configs/defconfig
> > > > > +++ b/platform/generic/configs/defconfig
> > > > > @@ -3,6 +3,7 @@ CONFIG_PLATFORM_ANDES_AE350=y
> > > > > CONFIG_PLATFORM_RENESAS_RZFIVE=y
> > > > CONFIG_PLATFORM_SIFIVE_FU540=y
> > > > > CONFIG_PLATFORM_SIFIVE_FU740=y
> > > > > +CONFIG_PLATFORM_STARFIVE_JH7110=y
> > > > >  CONFIG_FDT_GPIO=y
> > > > >  CONFIG_FDT_GPIO_SIFIVE=y
> > > > >  CONFIG_FDT_I2C=y
> > > > > diff --git a/platform/generic/starfive/jh7110.c
> > > > > b/platform/generic/starfive/jh7110.c
> > > > > new file mode 100644
> > > > > index 0000000..5d3ab6f
> > > > > --- /dev/null
> > > > > +++ b/platform/generic/starfive/jh7110.c
> > > > > @@ -0,0 +1,57 @@
> > > > > +/*
> > > > > + * SPDX-License-Identifier: BSD-2-Clause
> > > > > + *
> > > > > + * Copyright (c) 2022 StarFive
> > > > > + *
> > > > > + * Authors:
> > > > > + *   Wei Liang Lim <weiliang.lim@starfivetech.com>
> > > > > + */
> > > > > +
> > > > > +#include <libfdt.h>
> > > > > +#include <platform_override.h>
> > > > > +#include <sbi_utils/fdt/fdt_helper.h>
> > > > > +
> > > > > +static bool hart_cold_booted = FALSE;
> > > > > +
> > > > > +static bool starfive_jh7110_cold_boot_allowed(u32 hartid,
> > > > > +                                  const struct fdt_match *match) {
> > > > > +       const fdt32_t *val;
> > > > > +       int len, coff;
> > > > > +
> > > > > +       if (hart_cold_booted)
> > > > > +               return FALSE;
> > > > > +
> > > > > +       void *fdt = fdt_get_address();
> > > >
> > > > starfive_jh7110_cold_boot_allowed() will be called at runtime during
> > > > CPU hotplug or CPU non-retentive suspend so don't access FDT in this
> > > > function because it might have been corrupted/over-written by S-mode
> > software.
> > > >
> > > > You can save data from FDT in starfive_jh7110_early_init() when
> > > > cold_boot == TRUE.
> > > >
> > > The problem is early_init() is called from init_coldboot() and
> > > init_warm_startup() which is right after cold_boot_allowed(). Therefore, we
> > have to access the FDT here, this is why we add a 'hart_cold_booted' boolean
> > to ensure the FDT will not be accessed again once the FDT is read in cold boot
> > path for the first time.
> > > This is to avoid the issue you mentioned above. The code here already
> > > ensure the FDT will not be accessed again when the cold_boot_allowed()
> > > function is called during HSM SBI calls. This is the reason in the beginning of
> > the cold_boot_allowed() function, we check whether the 'hart_cold_booted' is
> > set to TRUE which mean the FDT should not be accessed again.
> >
> > I see but there is another way to do this.
> >
> > You do the following as a separate PATCH before this PATCH:
> > 1) Add "void (*fw_init)(void *fdt, const struct fdt_match *match)" in
> >     "struct platform_override"
> > 2) Update fw_platform_init() to call generic_plat->fw_init() right
> >    after fw_platform_lookup_special() call.
> >
> > Your current patch can simply implement fw_init() callback which will parse
> > the chosen boot-hart-id. You will not need hart_cold_booted boolean with this
> > approach.
> Thanks. Will do. This shall also resolved Xiang's comment in other thread that the FDT is read multiple times when multiple
> harts call cold_boot_allowed(). I believe the fw_platform_init() in fw_base.S is only called once from initial boot hart.
> I don't think fdt_get_address() can be called in fw_platform_init() as the scratch area is not initialized yet.
> But I think we can still get the FDT location from one of the arguments passed to fw_platform_init().

Yes, fw_base.S ensures that only one HART calls fw_platform_init().

Regards,
Anup

> >
> > Regards,
> > Anup
> >
> > >
> > > > Regards,
> > > > Anup
> > > >
> > > > > +
> > > > > +       coff = fdt_path_offset(fdt, "/chosen");
> > > > > +       if (-1 < coff) {
> > > > > +               val = fdt_getprop(fdt, coff, "boot-hart", &len);
> > > > > +               if (val && len) {
> > > > > +                       u32 selected_hartid = (u32) fdt32_to_cpu(*val);
> > > > > +                       return (selected_hartid == hartid);
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       return TRUE;
> > > > > +}
> > > > > +
> > > > > +static int starfive_jh7110_early_init(bool cold_boot,
> > > > > +                                  const struct fdt_match *match) {
> > > > > +       if (cold_boot)
> > > > > +               hart_cold_booted = TRUE;
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct fdt_match starfive_jh7110_match[] = {
> > > > > +       { .compatible = "starfive,jh7110" },
> > > > > +       { },
> > > > > +};
> > > > > +
> > > > > +const struct platform_override starfive_jh7110 = {
> > > > > +       .match_table = starfive_jh7110_match,
> > > > > +       .early_init = starfive_jh7110_early_init,
> > > > > +       .cold_boot_allowed = starfive_jh7110_cold_boot_allowed,
> > > > > +};
> > > > > diff --git a/platform/generic/starfive/objects.mk
> > > > > b/platform/generic/starfive/objects.mk
> > > > > new file mode 100644
> > > > > index 0000000..0b900fb
> > > > > --- /dev/null
> > > > > +++ b/platform/generic/starfive/objects.mk
> > > > > @@ -0,0 +1,6 @@
> > > > > +#
> > > > > +# SPDX-License-Identifier: BSD-2-Clause #
> > > > > +
> > > > > +carray-platform_override_modules-
> > > > $(CONFIG_PLATFORM_STARFIVE_JH7110)
> > > > > ++= starfive_jh7110
> > > > > +platform-objs-$(CONFIG_PLATFORM_STARFIVE_JH7110) +=
> > > > starfive/jh7110.o
> > > > > --
> > > > > 2.25.1
> > > > >
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

