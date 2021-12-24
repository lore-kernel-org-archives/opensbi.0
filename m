From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 24 Dec 2021 12:28:51 +0000
Subject: OpenSBI v1.0 Released
Message-ID: <4A79977D-524C-47B9-893D-E6072CA3F52A@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

The OpenSBI v1.0 is now available on GitHub at:
https://github.com/riscv/opensbi/releases

This release has:
* SBI HSM suspend as defined by SBI v0.3 specification
* Position independent execution for firmware
* Ticket based spinlocks
* Simplified / reduced platform callbacks
* ACLINT MTIMER and MSWI support
* SBI PMU extension as defined by SBI v0.3 specification
* Simple FDT based GPIO driver framework
* Improved reset driver framework along with various reset drivers
* Generic timer delay loop APIs
* RISC-V Sscofpmf extension support
* Simple FDT based I2C driver framework along with SiFive I2C driver
* UART drivers for Gaisler and LiteX platforms

Overall, this release completes a major milestone by implementing
the SBI v0.3 specification along with various other improvements.

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

