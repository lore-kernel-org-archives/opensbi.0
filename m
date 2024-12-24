From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 24 Dec 2024 12:00:36 +0530
Subject: [PATCH 2/2] lib: sbi: Improve the alignment of boot-time prints
In-Reply-To: <20241222060328.469014-2-apatel@ventanamicro.com>
References: <20241222060328.469014-1-apatel@ventanamicro.com> <20241222060328.469014-2-apatel@ventanamicro.com>
Message-ID: <CAK9=C2WvPc7COE6N0zAobUDWtx4QQULWztRt-tkasZGuxpmD6A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 22, 2024 at 11:33?AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Addtion of "Experimental SBI Extensions" to the boot-time prints
> disturbs the alignment of other prints so adjust all boot-time
> prints accordingly.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  lib/sbi/sbi_init.c | 62 +++++++++++++++++++++++-----------------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index cef658a2..58030cf2 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -83,56 +83,56 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
>                 return;
>
>         /* Platform details */
> -       sbi_printf("Platform Name             : %s\n",
> +       sbi_printf("Platform Name               : %s\n",
>                    sbi_platform_name(plat));
>         sbi_platform_get_features_str(plat, str, sizeof(str));
> -       sbi_printf("Platform Features         : %s\n", str);
> -       sbi_printf("Platform HART Count       : %u\n",
> +       sbi_printf("Platform Features           : %s\n", str);
> +       sbi_printf("Platform HART Count         : %u\n",
>                    sbi_platform_hart_count(plat));
>         idev = sbi_ipi_get_device();
> -       sbi_printf("Platform IPI Device       : %s\n",
> +       sbi_printf("Platform IPI Device         : %s\n",
>                    (idev) ? idev->name : "---");
>         tdev = sbi_timer_get_device();
> -       sbi_printf("Platform Timer Device     : %s @ %luHz\n",
> +       sbi_printf("Platform Timer Device       : %s @ %luHz\n",
>                    (tdev) ? tdev->name : "---",
>                    (tdev) ? tdev->timer_freq : 0);
>         cdev = sbi_console_get_device();
> -       sbi_printf("Platform Console Device   : %s\n",
> +       sbi_printf("Platform Console Device     : %s\n",
>                    (cdev) ? cdev->name : "---");
>         hdev = sbi_hsm_get_device();
> -       sbi_printf("Platform HSM Device       : %s\n",
> +       sbi_printf("Platform HSM Device         : %s\n",
>                    (hdev) ? hdev->name : "---");
>         pdev = sbi_pmu_get_device();
> -       sbi_printf("Platform PMU Device       : %s\n",
> +       sbi_printf("Platform PMU Device         : %s\n",
>                    (pdev) ? pdev->name : "---");
>         srdev = sbi_system_reset_get_device(SBI_SRST_RESET_TYPE_COLD_REBOOT, 0);
> -       sbi_printf("Platform Reboot Device    : %s\n",
> +       sbi_printf("Platform Reboot Device      : %s\n",
>                    (srdev) ? srdev->name : "---");
>         srdev = sbi_system_reset_get_device(SBI_SRST_RESET_TYPE_SHUTDOWN, 0);
> -       sbi_printf("Platform Shutdown Device  : %s\n",
> +       sbi_printf("Platform Shutdown Device    : %s\n",
>                    (srdev) ? srdev->name : "---");
>         susp_dev = sbi_system_suspend_get_device();
> -       sbi_printf("Platform Suspend Device   : %s\n",
> +       sbi_printf("Platform Suspend Device     : %s\n",
>                    (susp_dev) ? susp_dev->name : "---");
>         cppc_dev = sbi_cppc_get_device();
> -       sbi_printf("Platform CPPC Device      : %s\n",
> +       sbi_printf("Platform CPPC Device        : %s\n",
>                    (cppc_dev) ? cppc_dev->name : "---");
>
>         /* Firmware details */
> -       sbi_printf("Firmware Base             : 0x%lx\n", scratch->fw_start);
> -       sbi_printf("Firmware Size             : %d KB\n",
> +       sbi_printf("Firmware Base               : 0x%lx\n", scratch->fw_start);
> +       sbi_printf("Firmware Size               : %d KB\n",
>                    (u32)(scratch->fw_size / 1024));
> -       sbi_printf("Firmware RW Offset        : 0x%lx\n", scratch->fw_rw_offset);
> -       sbi_printf("Firmware RW Size          : %d KB\n",
> +       sbi_printf("Firmware RW Offset          : 0x%lx\n", scratch->fw_rw_offset);
> +       sbi_printf("Firmware RW Size            : %d KB\n",
>                    (u32)((scratch->fw_size - scratch->fw_rw_offset) / 1024));
> -       sbi_printf("Firmware Heap Offset      : 0x%lx\n", scratch->fw_heap_offset);
> -       sbi_printf("Firmware Heap Size        : "
> +       sbi_printf("Firmware Heap Offset        : 0x%lx\n", scratch->fw_heap_offset);
> +       sbi_printf("Firmware Heap Size          : "
>                    "%d KB (total), %d KB (reserved), %d KB (used), %d KB (free)\n",
>                    (u32)(scratch->fw_heap_size / 1024),
>                    (u32)(sbi_heap_reserved_space() / 1024),
>                    (u32)(sbi_heap_used_space() / 1024),
>                    (u32)(sbi_heap_free_space() / 1024));
> -       sbi_printf("Firmware Scratch Size     : "
> +       sbi_printf("Firmware Scratch Size       : "
>                    "%d B (total), %d B (used), %d B (free)\n",
>                    SBI_SCRATCH_SIZE,
>                    (u32)sbi_scratch_used_space(),
> @@ -154,7 +154,7 @@ static void sbi_boot_print_domains(struct sbi_scratch *scratch)
>                 return;
>
>         /* Domain details */
> -       sbi_domain_dump_all("      ");
> +       sbi_domain_dump_all("        ");
>  }
>
>  static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
> @@ -174,26 +174,26 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
>         }
>
>         /* Boot HART details */
> -       sbi_printf("Boot HART ID              : %u\n", hartid);
> -       sbi_printf("Boot HART Domain          : %s\n", dom->name);
> +       sbi_printf("Boot HART ID                : %u\n", hartid);
> +       sbi_printf("Boot HART Domain            : %s\n", dom->name);
>         sbi_hart_get_priv_version_str(scratch, str, sizeof(str));
> -       sbi_printf("Boot HART Priv Version    : %s\n", str);
> +       sbi_printf("Boot HART Priv Version      : %s\n", str);
>         misa_string(xlen, str, sizeof(str));
> -       sbi_printf("Boot HART Base ISA        : %s\n", str);
> +       sbi_printf("Boot HART Base ISA          : %s\n", str);
>         sbi_hart_get_extensions_str(scratch, str, sizeof(str));
> -       sbi_printf("Boot HART ISA Extensions  : %s\n", str);
> -       sbi_printf("Boot HART PMP Count       : %d\n",
> +       sbi_printf("Boot HART ISA Extensions    : %s\n", str);
> +       sbi_printf("Boot HART PMP Count         : %d\n",
>                    sbi_hart_pmp_count(scratch));
> -       sbi_printf("Boot HART PMP Granularity : %u bits\n",
> +       sbi_printf("Boot HART PMP Granularity   : %u bits\n",
>                    sbi_hart_pmp_log2gran(scratch));
> -       sbi_printf("Boot HART PMP Address Bits: %d\n",
> +       sbi_printf("Boot HART PMP Address Bits  : %d\n",
>                    sbi_hart_pmp_addrbits(scratch));
> -       sbi_printf("Boot HART MHPM Info       : %lu (0x%08x)\n",
> +       sbi_printf("Boot HART MHPM Info         : %lu (0x%08x)\n",
>                    sbi_popcount(sbi_hart_mhpm_mask(scratch)),
>                    sbi_hart_mhpm_mask(scratch));
> -       sbi_printf("Boot HART Debug Triggers  : %d triggers\n",
> +       sbi_printf("Boot HART Debug Triggers    : %d triggers\n",
>                    sbi_dbtr_get_total_triggers());
> -       sbi_hart_delegation_dump(scratch, "Boot HART ", "         ");
> +       sbi_hart_delegation_dump(scratch, "Boot HART ", "           ");
>  }
>
>  static unsigned long coldboot_done;
> --
> 2.43.0
>

