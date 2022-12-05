From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Dec 2022 18:23:40 +0530
Subject: [PATCH v3 0/6] Add support for Renesas RZ/Five SoC
In-Reply-To: <20221130220825.193693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221130220825.193693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAAhSdy2R2t9QENdi7qn-hx1_3xQMFi5D=cnT9AyL_k485YafBw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 1, 2022 at 3:38 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series adds initial support to RZ/Five (R9A07G043F) SoC (which
> is equipped with AX45MP AndesCore). Platform supports DT based probing.
>
> Linux support is currently being upstreamed the latest patchset can be
> found at [0](currently in linux-next, DT bindings can be seen here)
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221028165921.94487-1-prabhakar.mahadev-lad.rj at bp.renesas.com/
>
> - PLIC binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml#L57
> - PLMT and PLICSW are not used by any driver in kernel hence DT bindings for it
>   and is used in a similar manner as compared Andes AE350 [1]
>   [1] https://github.com/andestech/linux/commits/v6.0.y_ae350-ax45mp/Documentation/devicetree/bindings
> - SCIF binding - https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/serial/renesas,scif.yaml#L79
>
> Note:
> - The PMA implementation is still in discussion [1] once its decided
> corresponding patch to OpenSBI will be added to reserve the memory nodes
> and vendor specific SBI EXT.
> - U-boot from BSP release wont work with these patches, it requires additional
>   patches (happy to share the u-boot branch if anyone wants to test this patchset)
> - Patches apply on top of [2]
>
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221124172207.153718-8-prabhakar.mahadev-lad.rj at bp.renesas.com/
> [2] https://patchwork.ozlabs.org/project/opensbi/cover/20221128083046.6799-1-peterlin at andestech.com/
>
> v2->v3
> * Switched to generic platform
> * Dropped all vendor specific SBI EXT
> * Fixed review comments pointed by Bin for SCIF driver
> * Updated doc
>
> RFC->v2
> * Fixed comments pointed by Xiang W
> * Included RB tag from Yu Chien Peter Lin for patch #3
>
> RFC: https://patchwork.ozlabs.org/project/opensbi/cover/20221028004042.135549-1-prabhakar.mahadev-lad.rj at bp.renesas.com/
>
> Below are the logs for U-Boot (2022.10), OpenSBI and Linux:
> -----------------------------------------------------------
> U-Boot SPL 2022.10-00194-g8fe71ee1da (Nov 30 2022 - 17:32:32 +0000)
> Trying to boot from NOR
>
> OpenSBI v1.1-109-gfa85d48
>    ____                    _____ ____ _____
>   / __ \                  / ____|  _ \_   _|
>  | |  | |_ __   ___ _ __ | (___ | |_) || |
>  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>  | |__| | |_) |  __/ | | |____) | |_) || |_
>   \____/| .__/ \___|_| |_|_____/|____/_____|
>         | |
>         |_|
>
> Platform Name             : Renesas SMARC EVK based on r9a07g043f01
> Platform Features         : medeleg
> Platform HART Count       : 1
> Platform IPI Device       : andes_plicsw
> Platform Timer Device     : andes_plmt @ 12000000Hz
> Platform Console Device   : renesas_scif
> Platform HSM Device       : ---
> Platform PMU Device       : ---
> Platform Reboot Device    : ---
> Platform Shutdown Device  : ---

Any plans for a system reboot/shutdown driver for OpenSBI ?

Regards,
Anup

> Firmware Base             : 0x44000000
> Firmware Size             : 212 KB
> Runtime SBI Version       : 1.0
>
> Domain0 Name              : root
> Domain0 Boot HART         : 0
> Domain0 HARTs             : 0*
> Domain0 Region00          : 0x00000000110c0000-0x00000000110fffff (I,R)
> Domain0 Region01          : 0x0000000011180000-0x00000000111bffff (I,R)
> Domain0 Region02          : 0x0000000044000000-0x000000004403ffff ()
> Domain0 Region03          : 0x0000000011100000-0x000000001117ffff (I,R)
> Domain0 Region04          : 0x0000000013000000-0x00000000133fffff (I)
> Domain0 Region05          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
> Domain0 Next Address      : 0x0000000050000000
> Domain0 Next Arg1         : 0x00000000500bdee0
> Domain0 Next Mode         : S-mode
> Domain0 SysReset          : yes
>
> Boot HART ID              : 0
> Boot HART Domain          : root
> Boot HART Priv Version    : v1.11
> Boot HART Base ISA        : rv64imafdcnx
> Boot HART ISA Extensions  : none
> Boot HART PMP Count       : 16
> Boot HART PMP Granularity : 8
> Boot HART PMP Address Bits: 36
> Boot HART MHPM Count      : 4
> Boot HART MIDELEG         : 0x0000000000000222
> Boot HART MEDELEG         : 0x000000000000b109
>
>
> U-Boot 2022.10-00194-g8fe71ee1da (Nov 30 2022 - 17:32:32 +0000)
>
> CPU:   rv64imafdc
> Model: Renesas SMARC EVK based on r9a07g043f01
> DRAM:  896 MiB
> SW_ET0_EN: OFFCore:  30 devices, 18 uclasses, devicetree: separate
> MMC:   sd at 11c00000: 0, sd at 11c10000: 1
> Loading Environment from MMC... OK
> In:    serial at 1004b800
> Out:   serial at 1004b800
> Err:   serial at 1004b800
> Net:   eth0: ethernet at 11c30000
> Hit any key to stop autoboot:  0
> => run prafat;run pranfs;run bootimage
> 7153012 bytes read in 445 ms (15.3 MiB/s)
> 22510 bytes read in 3 ms (7.2 MiB/s)
> Uncompressed size: 19854848 = 0x12EF600
> Moving Image from 0x48080000 to 0x48200000, end=49569000
> ## Flattened Device Tree blob at 48000000
>    Booting using the fdt blob at 0x48000000
>    Loading Device Tree to 0000000077f00000, end 0000000077f087ed ... OK
>
> Starting kernel ...
>
> [    0.000000] Linux version 6.1.0-rc4-00292-ga3c6b529ec9f-dirty (prasmi at prasmi) (riscv64-unknown-linux-gnu-gcc (g2ee5e430018) 12.2.0, GNU ld (GNU Binutils) 2.39) #69 SMP Wed Nov 30 17:36:35 GMT 2022
> [    0.000000] OF: fdt: Ignoring memory range 0x48000000 - 0x48200000
> [    0.000000] Machine model: Renesas SMARC EVK based on r9a07g043f01
> [    0.000000] efi: UEFI not found.
> [    0.000000] Reserved memory: created DMA memory pool at 0x0000000058000000, size 128 MiB
> [    0.000000] OF: reserved mem: initialized node linux,cma at 58000000, compatible id shared-dma-pool
> [    0.000000] Zone ranges:
> [    0.000000]   DMA32    [mem 0x0000000048200000-0x000000007fffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000048200000-0x0000000057ffffff]
> [    0.000000]   node   0: [mem 0x0000000058000000-0x000000005fffffff]
> [    0.000000]   node   0: [mem 0x0000000060000000-0x000000007fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000048200000-0x000000007fffffff]
> [    0.000000] SBI specification v1.0 detected
> [    0.000000] SBI implementation ID=0x1 Version=0x10001
> [    0.000000] SBI TIME extension detected
> [    0.000000] SBI IPI extension detected
> [    0.000000] SBI RFENCE extension detected
> [    0.000000] SBI HSM extension detected
> [    0.000000] riscv: base ISA extensions acdfim
> [    0.000000] riscv: ELF capabilities acdfim
> [    0.000000] percpu: Embedded 18 pages/cpu s34744 r8192 d30792 u73728
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 225288
> [    0.000000] Kernel command line: root=/dev/nfs rw rootwait ip=dhcp nfsroot=192.168.10.1:/mnt/rzfive,vers=4,tcp console=ttySC0,115200n8 earlycon=sbi debug loglevel=7 deferred_probe_timeout=5
> [    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]       fixmap : 0xffffffc6fee00000 - 0xffffffc6ff000000   (2048 kB)
> [    0.000000]       pci io : 0xffffffc6ff000000 - 0xffffffc700000000   (  16 MB)
> [    0.000000]      vmemmap : 0xffffffc700000000 - 0xffffffc800000000   (4096 MB)
> [    0.000000]      vmalloc : 0xffffffc800000000 - 0xffffffd800000000   (  64 GB)
> [    0.000000]      modules : 0xffffffff01369000 - 0xffffffff80000000   (2028 MB)
> [    0.000000]       lowmem : 0xffffffd800000000 - 0xffffffd837e00000   ( 894 MB)
> [    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   (2047 MB)
> [    0.000000] Memory: 747812K/915456K available (7394K kernel code, 3746K rwdata, 4096K rodata, 3355K init, 480K bss, 167644K reserved, 0K cma-reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=1.
> [    0.000000] rcu:     RCU debug extended QS entry/exit.
> [    0.000000]  Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] riscv-intc: 64 local interrupts mapped
> [    0.000000] plic: interrupt-controller at 12c00000: mapped 511 interrupts with 1 handlers for 2 contexts.
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.000000] riscv-timer: riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [0]
> [    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x2c47f4ee7, max_idle_ns: 440795202497 ns
> [    0.000003] sched_clock: 64 bits at 12MHz, resolution 83ns, wraps every 4398046511096ns
> [    0.000242] Console: colour dummy device 80x25
> [    0.000345] Calibrating delay loop (skipped), value calculated using timer frequency.. 24.00 BogoMIPS (lpj=48000)
> [    0.000367] pid_max: default: 32768 minimum: 301
> [    0.000472] LSM: Security Framework initializing
> [    0.000684] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
> [    0.000712] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
> [    0.002601] cacheinfo: Unable to detect cache hierarchy for CPU 0
> [    0.003937] cblist_init_generic: Setting adjustable number of callback queues.
> [    0.003956] cblist_init_generic: Setting shift to 0 and lim to 1.
> [    0.004235] riscv: ELF compat mode unsupported
> [    0.004316] ASID allocator using 9 bits (512 entries)
> [    0.004576] rcu: Hierarchical SRCU implementation.
> [    0.004587] rcu:     Max phase no-delay instances is 1000.
> [    0.005204] Detected Renesas RZ/Five r9a07g043 Rev 0
> [    0.005221] EFI services will not be available.
> [    0.005728] smp: Bringing up secondary CPUs ...
> [    0.005740] smp: Brought up 1 node, 1 CPU
> [    0.006644] devtmpfs: initialized
> [    0.013628] DMA: default coherent area is set
> [    0.013648] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.013678] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
> [    0.013951] pinctrl core: initialized pinctrl subsystem
> [    0.015869] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.016359] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
> [    0.016413] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.016526] audit: initializing netlink subsys (disabled)
> [    0.017387] thermal_sys: Registered thermal governor 'step_wise'
> [    0.017504] cpuidle: using governor menu
> [    0.033712] audit: type=2000 audit(0.020:1): state=initialized audit_enabled=0 res=1
> [    0.034608] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.034623] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
> [    0.038322] SCSI subsystem initialized
> [    0.038641] usbcore: registered new interface driver usbfs
> [    0.038707] usbcore: registered new interface driver hub
> [    0.038766] usbcore: registered new device driver usb
> [    0.039808] Advanced Linux Sound Architecture Driver Initialized.
> [    0.041311] clocksource: Switched to clocksource riscv_clocksource
> [    0.054917] NET: Registered PF_INET protocol family
> [    0.055223] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [    0.057347] tcp_listen_portaddr_hash hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    0.057402] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    0.057430] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
> [    0.057523] TCP bind hash table entries: 8192 (order: 7, 524288 bytes, linear)
> [    0.058595] TCP: Hash tables configured (established 8192 bind 8192)
> [    0.058814] UDP hash table entries: 512 (order: 3, 49152 bytes, linear)
> [    0.058951] UDP-Lite hash table entries: 512 (order: 3, 49152 bytes, linear)
> [    0.059394] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.060323] RPC: Registered named UNIX socket transport module.
> [    0.060342] RPC: Registered udp transport module.
> [    0.060348] RPC: Registered tcp transport module.
> [    0.060354] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.069907] workingset: timestamp_bits=46 max_order=18 bucket_order=0
> [    0.094416] NFS: Registering the id_resolver key type
> [    0.094498] Key type id_resolver registered
> [    0.094507] Key type id_legacy registered
> [    0.094665] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> [    0.094675] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
> [    0.095031] 9p: Installing v9fs 9p2000 file system support
> [    0.095642] NET: Registered PF_ALG protocol family
> [    0.095756] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
> [    0.095769] io scheduler mq-deadline registered
> [    0.095776] io scheduler kyber registered
> [    0.211112] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    0.213011] SuperH (H)SCI(F) driver initialized
> [    0.213764] cacheinfo: Unable to detect cache hierarchy for CPU 0
> [    0.223531] loop: module loaded
> [    0.227640] usbcore: registered new interface driver uas
> [    0.227742] usbcore: registered new interface driver usb-storage
> [    0.228103] mousedev: PS/2 mouse device common for all mice
> [    0.279088] sdhci: Secure Digital Host Controller Interface driver
> [    0.279104] sdhci: Copyright(c) Pierre Ossman
> [    0.279281] sdhci-pltfm: SDHCI platform and OF driver helper
> [    0.279596] usbcore: registered new interface driver usbhid
> [    0.279607] usbhid: USB HID core driver
> [    0.280169] riscv-pmu-sbi: SBI PMU extension is available
> [    0.280214] riscv-pmu-sbi: 16 firmware and 6 hardware counters
> [    0.280225] riscv-pmu-sbi: Perf sampling/filtering is not supported as sscof extension is not available
> [    0.282558] NET: Registered PF_INET6 protocol family
> [    0.284457] Segment Routing with IPv6
> [    0.284537] In-situ OAM (IOAM) with IPv6
> [    0.284639] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    0.285632] NET: Registered PF_PACKET protocol family
> [    0.285879] 9pnet: Installing 9P2000 support
> [    0.286004] Key type dns_resolver registered
> [    0.290080] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
> [    0.305477] gpio-378 (can0_stb): hogged as output/low
> [    0.305517] gpio-379 (can1_stb): hogged as output/low
> [    0.305549] gpio-363 (sd1_pwr_en): hogged as output/high
> [    0.306264] pinctrl-rzg2l 11030000.pinctrl: pinctrl-rzg2l support registered
> [    0.307379] 1004b800.serial: ttySC0 at MMIO 0x1004b800 (irq = 2, base_baud = 0) is a scif
> [    1.169958] printk: console [ttySC0] enabled
> [    1.176321] i2c-riic 10058000.i2c: registered with 100000Hz bus speed
> [    1.185005] i2c-riic 10058400.i2c: registered with 100000Hz bus speed
> [    1.193147] Trying to probe devices needed for running init ...
> [   13.481453] ALSA device list:
> [   13.484433]   No soundcards found.
> [   13.490459] Freeing unused kernel image (initmem) memory: 3352K
> [   13.496415] Run /init as init process
> This is for testing KEXEC!
> mount: mounting /dev/sda1 on /mnt/root failed: No such file or directory
> Dropping to a shell.
> sh: can't access tty; job control turned off
> / #
> / #
> -------------------------------------------------------------------------------
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (6):
>   lib: utils: serial: Add Renesas SCIF driver
>   lib: utils: serial: Add FDT driver for Renesas SCIF
>   lib: utils/irqchip: Add compatible string for Andestech NCEPLIC100
>   platform: generic: Add Renesas RZ/Five initial support
>   docs: platform: Add documentation for Renesas RZ/Five SoC
>   platform: generic: Drop root_offset parameter from
>     fw_platform_lookup_special()
>
>  docs/platform/platform.md                  |   5 +
>  docs/platform/renesas-rzfive.md            | 145 +++++++++++++++++++++
>  include/sbi_utils/fdt/fdt_helper.h         |   3 +
>  include/sbi_utils/serial/renesas-scif.h    |  11 ++
>  lib/utils/fdt/fdt_helper.c                 |  11 ++
>  lib/utils/irqchip/fdt_irqchip_plic.c       |   3 +-
>  lib/utils/serial/Kconfig                   |   9 ++
>  lib/utils/serial/fdt_serial_renesas_scif.c |  31 +++++
>  lib/utils/serial/objects.mk                |   4 +
>  lib/utils/serial/renesas_scif.c            | 116 +++++++++++++++++
>  platform/generic/Kconfig                   |   4 +
>  platform/generic/configs/defconfig         |   2 +
>  platform/generic/platform.c                |   4 +-
>  platform/generic/renesas/rzfive/objects.mk |   8 ++
>  platform/generic/renesas/rzfive/rzfive.c   |  17 +++
>  15 files changed, 370 insertions(+), 3 deletions(-)
>  create mode 100644 docs/platform/renesas-rzfive.md
>  create mode 100644 include/sbi_utils/serial/renesas-scif.h
>  create mode 100644 lib/utils/serial/fdt_serial_renesas_scif.c
>  create mode 100644 lib/utils/serial/renesas_scif.c
>  create mode 100644 platform/generic/renesas/rzfive/objects.mk
>  create mode 100644 platform/generic/renesas/rzfive/rzfive.c
>
> --
> 2.17.1
>

