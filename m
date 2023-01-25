From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Wed, 25 Jan 2023 19:42:25 +0000
Subject: [PATCH v3 5/5] Add two entries:
In-Reply-To: <20230119151826.59697-6-hchauhan@ventanamicro.com>
References: <20230119151826.59697-1-hchauhan@ventanamicro.com> <20230119151826.59697-6-hchauhan@ventanamicro.com>
Message-ID: <CA+V-a8u0vhfD8Bqus0bx4guwYo5+EQufB7fvf3JxZ-DooqksPQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Himanshu,

On Thu, Jan 19, 2023 at 3:19 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
>   1. TEXT: fw_start to _fw_rw_offset with RX permissions
>   2. DATA: _fw_rw_offset to fw_size with RW permissions
>
> These permissions are still not enforced from M-mode but lay
> the ground work for enforcing them for M-mode. SU-mode don't
> have any access to these regions.
>
> Sample output:
>  Domain0 Region01  : 0x0000000080000000-0x000000008001ffff M: (R,X) S/U: ()
>  Domain0 Region02  : 0x0000000080020000-0x000000008003ffff M: (R,W) S/U: ()
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  lib/sbi/sbi_domain.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
After updating to the latest master, RZ/Five SoC doesn't boot up.
Bisecting pointed me to this commit 230278d "lib: sbi: Add separate
entries for firmware RX and RW regions"

I get no prints from OpenSBI ; the only prints I get are from SPL.
After reverting this patch I get RZ/Five working as expected (log
below). Do you see any reason why this fails on RZ/Five ?

U-Boot SPL 2023.01-00206-g1026336bc6 (Jan 25 2023 - 19:36:23 +0000)
Trying to boot from NOR

OpenSBI v1.2-40-g031b6db
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
Firmware RW Offset        : 0xffffffffc4020000
Runtime SBI Version       : 1.0

Domain0 Name              : root
Domain0 Boot HART         : 0
Domain0 HARTs             : 0*
Domain0 Region00          : 0x0000000000030000-0x000000000003ffff M:
(R,W,X) S/U: ()
Domain0 Region01          : 0x0000000000040000-0x000000000004ffff M:
(R,W,X) S/U: ()
Domain0 Region02          : 0x00000000110c0000-0x00000000110fffff M:
(I,R,W,X) S/U: (R)
Domain0 Region03          : 0x0000000011180000-0x00000000111bffff M:
(I,R,W,X) S/U: (R)
Domain0 Region04          : 0x0000000044000000-0x000000004403ffff M:
(R,W,X) S/U: ()
Domain0 Region05          : 0x0000000011100000-0x000000001117ffff M:
(I,R,W,X) S/U: (R)
Domain0 Region06          : 0x0000000013000000-0x00000000133fffff M: (I) S/U: ()
Domain0 Region07          : 0x0000000000000000-0xffffffffffffffff M:
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


U-Boot 2023.01-00206-g1026336bc6 (Jan 25 2023 - 19:36:23 +0000)

CPU:   rv64imafdc
Model: Renesas SMARC EVK based on r9a07g043f01
DRAM:  896 MiB
SW_ET0_EN: OFFCore:  30 devices, 18 uclasses, devicetree: separate
MMC:   sd at 11c00000: 0, sd at 11c10000: 1
Loading Environment from MMC... OK
In:    serial at 1004b800
Out:   serial at 1004b800
Err:   serial at 1004b800
Net:   eth0: ethernet@11c30000
Hit any key to stop autoboot:  0



Cheers,
Prabhakar

