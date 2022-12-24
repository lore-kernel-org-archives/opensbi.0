From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Dec 2022 15:40:19 +0530
Subject: OpenSBI v1.2 Released
Message-ID: <CAAhSdy26PFCbY1tJm-0-urbXeFZcpOOdhwotaykfTU5CmJbkHA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

The OpenSBI v1.2 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This release has:
* Menuconfig support using Kconfiglib v14.1.0
* RISC-V AIA v1.0.0 support
* Cadence UART driver
* Platform specific PMU device operations
* Trap handling improvements for platforms with H-extension
* Semihosting support
* T-HEAD C9XX PMU and CLINT support
* FDT based drivers for Andes AE350 platform
* Andes AE350 platform improvements
* Allow enabling/disabling of SBI extensions via Kconfig
* Renesas SCIF serial driver
* Renesas RZ/Five platform support

Overall, this release mainly adds Kconfig support, new drivers
and new platforms along with other improvements.

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

