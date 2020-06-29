From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 29 Jun 2020 04:49:13 +0000
Subject: [PATCH v2 2/3] config.mk: Update QEMU run command for generic and
 sifive fu540 platforms
In-Reply-To: <1593134764-16743-2-git-send-email-bmeng.cn@gmail.com>
References: <1593134764-16743-1-git-send-email-bmeng.cn@gmail.com>
 <1593134764-16743-2-git-send-email-bmeng.cn@gmail.com>
Message-ID: <DM6PR04MB6201F3CD7ED8F98271E0F4F28D6E0@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Bin
> Meng
> Sent: 26 June 2020 06:56
> To: Atish Patra <Atish.Patra@wdc.com>; opensbi at lists.infradead.org
> Cc: Bin Meng <bin.meng@windriver.com>
> Subject: [PATCH v2 2/3] config.mk: Update QEMU run command for generic
> and sifive fu540 platforms
> 
> From: Bin Meng <bin.meng@windriver.com>
> 
> Since QEMU v5.1, if there is no "-bios" option provided, the default OpenSBI
> firmware will be loaded by QEMU as the BIOS automatically, hence to load
> fw_payload type image, we should explicitly pass the "-bios" option to
> QEMU.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
> 
> (no changes since v1)
> 
>  platform/generic/config.mk      | 2 +-
>  platform/sifive/fu540/config.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/platform/generic/config.mk b/platform/generic/config.mk index
> 8d63ece..8151974 100644
> --- a/platform/generic/config.mk
> +++ b/platform/generic/config.mk
> @@ -15,7 +15,7 @@ platform-ldflags-y =
> 
>  # Command for platform specific "make run"
>  platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -
> m 256M \
> -  -nographic -kernel $(build_dir)/platform/generic/firmware/fw_payload.elf
> +  -nographic -bios
> + $(build_dir)/platform/generic/firmware/fw_payload.elf
> 
>  # Blobs to build
>  FW_TEXT_START=0x80000000
> diff --git a/platform/sifive/fu540/config.mk
> b/platform/sifive/fu540/config.mk index e76adcd..23169b1 100644
> --- a/platform/sifive/fu540/config.mk
> +++ b/platform/sifive/fu540/config.mk
> @@ -15,7 +15,7 @@ platform-ldflags-y =
> 
>  # Command for platform specific "make run"
>  platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M
> sifive_u -m 256M \
> -  -nographic -kernel
> $(build_dir)/platform/sifive/fu540/firmware/fw_payload.elf
> +  -nographic -bios
> + $(build_dir)/platform/sifive/fu540/firmware/fw_payload.elf
> 
>  # Blobs to build
>  FW_TEXT_START=0x80000000
> --
> 2.7.4
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

