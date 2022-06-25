From: Anup Patel <anup@brainfault.org>
Date: Sat, 25 Jun 2022 10:25:09 +0530
Subject: OpenSBI v1.1 Released
Message-ID: <CAAhSdy0axPaavha0U3VLYsDCqi3DGq=+fjDXC71nfnm_TeFYmw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

The OpenSBI v1.1 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This release has:
* SBI PMU improvements
* RISC-V AIA v0.3.0 draft support
* Simple external interrupt handling framework
* Xilinx UART-Lite driver
* RISC-V privilege specification v1.12 support
* RISC-V Svpbmt extension support
* RISC-V Smstateen extension support
* RISC-V Sstc extension support
* RISC-V privilege specification version detection
* Platform callback to populate HART extensions
* Compile time C arrays support
* Probing FDT based drivers using compile time C arrays
* SBI HSM improvements
* Allwinner D1 platform support
* Trap redirection improvements related to [m|h]tinst CSR
* SBI v1.0 specification support

Overall, this release mainly adds support for various RISC-V ISA
extensions ratified in December 2021 along with other improvements.

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

