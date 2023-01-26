From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Thu, 26 Jan 2023 08:50:37 +0000
Subject: [PATCH v3 5/5] Add two entries:
In-Reply-To: <3A3708D9-3437-4BB1-A800-01F0966ACF71@jrtc27.com>
References: <20230119151826.59697-1-hchauhan@ventanamicro.com>
 <20230119151826.59697-6-hchauhan@ventanamicro.com> <CA+V-a8u0vhfD8Bqus0bx4guwYo5+EQufB7fvf3JxZ-DooqksPQ@mail.gmail.com>
 <1C640FDA-840C-4018-A44A-089D833B33D2@jrtc27.com> <CE80FC13-AC30-45A1-AD53-CDF13EE4CE5B@jrtc27.com>
 <CA+V-a8v+txgCQmo60j3Vvq5xkMddx9g87B7seGq_LB3vmZLXEQ@mail.gmail.com>
 <383241D7-283F-4C9E-A203-607F1880FAB2@jrtc27.com> <908B5532-D994-4359-A605-DA5A0CC359FB@jrtc27.com>
 <c37ea578-6048-12d7-911a-0ac751e17792@sholland.org> <3A3708D9-3437-4BB1-A800-01F0966ACF71@jrtc27.com>
Message-ID: <CA+V-a8u=mg=UAmb+1xMpUSSPQJsZHgENbHA1Xk8pfWTyu5aegQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jessica,

On Thu, Jan 26, 2023 at 6:48 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 26 Jan 2023, at 04:41, Samuel Holland <samuel@sholland.org> wrote:
> > On 1/25/23 15:06, Jessica Clarke wrote:
> >> On 25 Jan 2023, at 20:56, Jessica Clarke <jrtc27@jrtc27.com> wrote:
<snip>
> >> I guess you could be getting further and hanging for some other reason.
> >> Despite the sbi_printf calls, sbi_domain_init will never actually print
> >> anything, because it?s run before sbi_console_init and thus the prints
> >> are just slow no-ops.
> >>
> >> What do you see with the problematic patch reverted but my fix applied?
> >
> > The same patch breaks booting for me as well on Allwinner D1. I get the
> > same value reported with or without your linker script change:
> >
> > Firmware RW Offset        : 0xffffffffc0020000
> >
> > (OpenSBI is loaded at 0x40000000)
>
> Ok, so it seems BFD just does totally nonsensical things for SHN_ABS
> symbols when producing position-independent outputs (both -pie and
> -shared) for various historical reasons, and so SHN_ABS symbols are
> still subject to relocation as far as BFD is concerned (except AArch64,
> which fixes it in limited cases that don?t apply here...). I think the
> only way to make this work with BFD is:
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index e04b683..fb6ac92 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -526,7 +526,7 @@ _link_start:
>  _link_end:
>         RISCV_PTR       _fw_reloc_end
>  __fw_rw_offset:
> -       RISCV_PTR       _fw_rw_offset
> +       RISCV_PTR       _fw_rw_start - _fw_start
>
>         .section .entry, "ax", %progbits
>         .align 3
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index 9a1304e..3d68484 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -64,7 +64,7 @@
>         . = ALIGN(1 << LOG2CEIL((SIZEOF(.rodata) + SIZEOF(.text)
>                                 + SIZEOF(.dynsym) + SIZEOF(.rela.dyn))));
>
> -       PROVIDE(_fw_rw_offset = (.  - _fw_start));
> +       PROVIDE(_fw_rw_start = .);
>
>         /* Beginning of the read-write data sections */
>
>
The above change did the trick, RZ/Five boots up now:

U-Boot SPL 2023.01-00206-g1026336bc6 (Jan 26 2023 - 08:45:19 +0000)
Trying to boot from NOR

OpenSBI v1.2-40-g96077e3
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : Renesas SMARC EVK based on r9a07g043f01
Platform Features         : medeleg
Platform HART Count       : 1
Platform IPI Device       : andes_plicsw
Platform Timer Device     : andes_plmt @ 12000000Hz
Platform Console Device   : renesas_scif
Platform HSM Device       : ---
Platform PMU Device       : ---
Platform Reboot Device    : ---
Platform Shutdown Device  : ---
Firmware Base             : 0x44000000
Firmware Size             : 228 KB
Firmware RW Offset        : 0x20000
Runtime SBI Version       : 1.0

Domain0 Name              : root
Domain0 Boot HART         : 0
Domain0 HARTs             : 0*
Domain0 Region00          : 0x0000000000030000-0x000000000003ffff M:
(R,W,X) S/U: ()
Domain0 Region01          : 0x0000000000040000-0x000000000004ffff M:
(R,W,X) S/U: ()
Domain0 Region02          : 0x0000000044000000-0x000000004401ffff M:
(R,X) S/U: ()
Domain0 Region03          : 0x0000000044020000-0x000000004403ffff M:
(R,W) S/U: ()
Domain0 Region04          : 0x00000000110c0000-0x00000000110fffff M:
(I,R,W,X) S/U: (R)
Domain0 Region05          : 0x0000000011180000-0x00000000111bffff M:
(I,R,W,X) S/U: (R)
Domain0 Region06          : 0x0000000011100000-0x000000001117ffff M:
(I,R,W,X) S/U: (R)
Domain0 Region07          : 0x0000000013000000-0x00000000133fffff M: (I) S/U: ()
Domain0 Region08          : 0x0000000000000000-0xffffffffffffffff M:
(R,W,X) S/U: (R,W,X)
Domain0 Next Address      : 0x0000000050000000
Domain0 Next Arg1         : 0x00000000500beca0
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes

Boot HART ID              : 0
Boot HART Domain          : root
Boot HART Priv Version    : v1.11
Boot HART Base ISA        : rv64imafdcnx
Boot HART ISA Extensions  : none
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 8
Boot HART PMP Address Bits: 36
Boot HART MHPM Count      : 4
Boot HART MIDELEG         : 0x0000000000000222
Boot HART MEDELEG         : 0x000000000000b109


U-Boot 2023.01-00206-g1026336bc6 (Jan 26 2023 - 08:45:19 +0000)

CPU:   rv64imafdc
Model: Renesas SMARC EVK based on r9a07g043f01
DRAM:  896 MiB
Core:  30 devices, 18 uclasses, devicetree: separate
MMC:   sd at 11c00000: 0, sd at 11c10000: 1
Loading Environment from MMC... OK
In:    serial at 1004b800
Out:   serial at 1004b800
Err:   serial at 1004b800
Net:   eth0: ethernet@11c30000
Hit any key to stop autoboot:  0
=>
=>

Cheers,
Prabhakar

