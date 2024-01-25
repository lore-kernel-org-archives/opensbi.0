From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Jan 2024 11:19:37 +0530
Subject: [PATCH v2] lib:firmware: Select preferred boot hart for cold boot.
In-Reply-To: <tencent_F06F2B3591FB6E18C84089274732D95AB008@qq.com>
References: <tencent_71F84A72A4A75B16F26162E61158F6136C06@qq.com>
 <CAK9=C2U_zEOgk=CyHRj1U_2MJVWTb9c+Lky=B=C1Vz6EQqrEkw@mail.gmail.com> <tencent_F06F2B3591FB6E18C84089274732D95AB008@qq.com>
Message-ID: <CAK9=C2XDnimP3XLs_77o-nAR-TEcaG2ftJUv5CZdb2ASdrVjpg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 24, 2024 at 11:49?PM yangcheng.work at foxmail.com
<yangcheng.work@foxmail.com> wrote:
>
> >On Wed, Jan 24, 2024 at 9:05?PM Cheng Yang <yangcheng.work@foxmail.com> wrote:
> >>
> >> We now use the boot hart in struct fw_dynamic_info to do
> >> relocate, but use a lottery algorithm when selecting the
> >> cold boot hart. This may result in using a hart other
> >> than the preferred boot hart to boot the next stage
> >> firmware.
> >>
> >> sbi_platform_cold_boot_allowed seems to be able to solve
> >> this problem, but for most platforms all hartids are
> >> allowed to cold boot. In this case, we still cannot
> >> guarantee that the hart consistent with the preferred boot
> >> hart will be used for cold boot.
> >>
> >> Therefore, we should also save the preferred boot hart
> >> information in scratch, so that we can select it first when
> >> making cold start core selection. If no preferred boot hart
> >> is specified then the lottery algorithm is used as before.
> >
> >I disagree with this approach.
> >
> >We already have a flexible sbi_platform_cold_boot_allowed()
> >mechanism which allows a platform to specify a set of
> >HARTs which can do cold boot and we should use this.
> >
> >Currently, for most platforms all hartids are allowed to cold
> >boot because there the is no information in DT which
> >generic platform can use to discover the set of preferred
> >cold boot harts.
> >
> >Instead of this patch, I suggest taking a DT based approach
> >for generic platform.
> >
> >Regards,
> >Anup
> >
>
> Thanks for your reply, I have noticed that starfive uses this
> DT based approach to select a cold boot hart. However, I
> also noticed that the way of specifying boot-hartid in DT is
> not widely used. Even the EFI stub has deprecated the use of
> boot-hartid in DT when booting Linux
> (https://www.kernel.org/doc/html/latest/arch/riscv/boot.html).
> So I didn't use a DT based approach in this patch.

The way OpenSBI discovers the set of cold boot harts has
nothing to do with how subsequent booting stages or EFI
stub discovers boot-hartid.

>
> On the other hand, sbi_platform_cold_boot_allowed is really
> flexible in specifying which harts can be used for cold boot.
> But if it is used to solve this problem, it needs to specify
> boot hart in DT, which is not done by most platforms. If we
> can already pass a preferred hart through struct dymanic_info,
> why we need to specify other one in DT?

There are many issues in using with "boot_hart" field of
"struct fw_dynamic_info" for selecting cold boot hart:
1) Please refer the documentation of "boot_hart" field in
    include/sbi/fw_dynamic.h. It is only a "preferred boot hart"
    and does not guarantee that FW_DYNAMIC will use only
    that hart as the cold boot hart. Historically, the "boot_hart"
    field was added to solve a SMP boot issue in the early days
    of OpenSBI and U-Boot SPL.
2) The struct fw_dynamic_info is only used by FW_DYNAMIC
    so this will not work for FW_JUMP and FW_PAYLOAD.
3) The "boot_hart' field only specifies one HART so it is
    not suitable for specifying a set of HARTs.

>
> I submitted this Patch because I found that in the boot
> process of SPL->OpenSBI->UEFI->Linux, due to the lottery
> algorithm before cold boot, I cannot specify the hart used to
> boot UEFI even if I use dynamic OpenSBI firmware. Can you give
> me some more suggestions?

OpenSBI already takes domain configuration from the device
tree chosen node. (Refer, docs/domain_support.md)

One possible approach to specify the set of cold boot harts is
to have a DT property "cold-boot-harts = <&cpu0>, <&cpu1>, ..."
in "/chosen/opensbi-config" DT node. The fw_platform_init()
of generic platform can parse and prepare a
generic_hart_index2coldboot[] table which can be then used
by generic_cold_boot_allowed(). We should also delete the
"/chosen/opensbi-config" DT node at the end of cold boot
(just like we delete the "/chosen/opensbi-domains" DT node
in fdt_domain_fixup()).

Regards,
Anup



>
> Regards
> Cheng Yang
>
> >>
> >> Signed-off-by: Cheng Yang <yangcheng.work@foxmail.com>
> >> ---
> >> Changes v1 -> v2:
> >>   - Replace -1 with -1UL.
> >>   - If the preferred hart does not allow cold boot will enter sbi_hart_hang.
> >>
> >>  firmware/fw_base.S        |  5 +++++
> >>  include/sbi/sbi_scratch.h | 11 ++++++++++-
> >>  lib/sbi/sbi_init.c        | 21 +++++++++++++++------
> >>  3 files changed, 30 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> >> index f7763f4..88abd45 100644
> >> --- a/firmware/fw_base.S
> >> +++ b/firmware/fw_base.S
> >> @@ -333,6 +333,11 @@ _scratch_init:
> >>  #endif
> >>         REG_S   a0, SBI_SCRATCH_OPTIONS_OFFSET(tp)
> >>         MOV_3R  a0, s0, a1, s1, a2, s2
> >> +       /* Store boot hart in scratch space */
> >> +       MOV_3R  s0, a0, s1, a1, s2, a2
> >> +       call    fw_boot_hart
> >> +       REG_S   a0, SBI_SCRATCH_BOOT_HART_OFFSET(tp)
> >> +       MOV_3R  a0, s0, a1, s1, a2, s2
> >>         /* Move to next scratch space */
> >>         add     t1, t1, t2
> >>         blt     t1, s7, _scratch_init
> >> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> >> index e6a33ba..1cf2b5e 100644
> >> --- a/include/sbi/sbi_scratch.h
> >> +++ b/include/sbi/sbi_scratch.h
> >> @@ -42,8 +42,10 @@
> >>  #define SBI_SCRATCH_TMP0_OFFSET                        (12 * __SIZEOF_POINTER__)
> >>  /** Offset of options member in sbi_scratch */
> >>  #define SBI_SCRATCH_OPTIONS_OFFSET             (13 * __SIZEOF_POINTER__)
> >> +/** Offset of boot_hart member in sbi_scratch */
> >> +#define SBI_SCRATCH_BOOT_HART_OFFSET           (14 * __SIZEOF_POINTER__)
> >>  /** Offset of extra space in sbi_scratch */
> >> -#define SBI_SCRATCH_EXTRA_SPACE_OFFSET         (14 * __SIZEOF_POINTER__)
> >> +#define SBI_SCRATCH_EXTRA_SPACE_OFFSET         (15 * __SIZEOF_POINTER__)
> >>  /** Maximum size of sbi_scratch (4KB) */
> >>  #define SBI_SCRATCH_SIZE                       (0x1000)
> >>
> >> @@ -83,6 +85,8 @@ struct sbi_scratch {
> >>         unsigned long tmp0;
> >>         /** Options for OpenSBI library */
> >>         unsigned long options;
> >> +       /** Preferred boot HART id */
> >> +       unsigned long boot_hart;
> >>  };
> >>
> >>  /**
> >> @@ -144,6 +148,11 @@ _Static_assert(
> >>                 == SBI_SCRATCH_OPTIONS_OFFSET,
> >>         "struct sbi_scratch definition has changed, please redefine "
> >>         "SBI_SCRATCH_OPTIONS_OFFSET");
> >> +_Static_assert(
> >> +       offsetof(struct sbi_scratch, boot_hart)
> >> +               == SBI_SCRATCH_BOOT_HART_OFFSET,
> >> +       "struct sbi_scratch definition has changed, please redefine "
> >> +       "SBI_SCRATCH_BOOT_HART_OFFSET");
> >>
> >>  /** Possible options for OpenSBI library */
> >>  enum sbi_scratch_options {
> >> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> >> index 804b01c..42eec2d 100644
> >> --- a/lib/sbi/sbi_init.c
> >> +++ b/lib/sbi/sbi_init.c
> >> @@ -573,14 +573,23 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
> >>          * HART because the coldboot HART will be directly jumping to
> >>          * the next booting stage.
> >>          *
> >> -        * We use a lottery mechanism to select coldboot HART among
> >> -        * HARTs which satisfy above condition.
> >> +        * We select coldboot HART among HARTs which satisfy above condition.
> >> +        * If the preferred boot hart is not specified, we use a lottery
> >> +        * algorithm to select a cold boot hart, otherwise the preferred
> >> +        * boot core is selected.
> >>          */
> >>
> >> -       if (sbi_platform_cold_boot_allowed(plat, hartid)) {
> >> -               if (next_mode_supported &&
> >> -                   atomic_xchg(&coldboot_lottery, 1) == 0)
> >> -                       coldboot = true;
> >> +       if (scratch->boot_hart != -1UL && !sbi_platform_cold_boot_allowed(plat, hartid))
> >> +               sbi_hart_hang();
> >> +
> >> +       if (sbi_platform_cold_boot_allowed(plat, hartid) && next_mode_supported) {
> >> +               if (scratch->boot_hart == -1UL) {
> >> +                       if (atomic_xchg(&coldboot_lottery, 1) == 0)
> >> +                               coldboot = true;
> >> +               } else {
> >> +                       if (scratch->boot_hart == hartid)
> >> +                               coldboot = true;
> >> +               }
> >>         }
> >>
> >>         /*
> >> --
> >> 2.34.1
> >>
> >>
> >> --
> >> opensbi mailing list
> >> opensbi at lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/opensbi

