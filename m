From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Dec 2024 16:31:59 +0530
Subject: OpenSBI v1.6 Released
Message-ID: <CAAhSdy3TR96C5AHiqn5mHEFhNbE+BsnwLHbxOUifDQqfc5h0Ug@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

The OpenSBI v1.6 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This release has:

* Support for parsing riscv,isa-extensions DT property
* Setup serial console very early in cold boot path
* Support for multiple heaps and aligned memory allocation
* Support for shadow stacks (Zicfiss) ISA extension
* Support for landing pads (Zicfilp) ISA extension
* Support for per-domain data
* Support for double-trap (Smdbltrp/Ssdbltrp) ISA extensions
* DT-based configurable heap size
* Common fdt_driver and helpers for driver initialization
* Support for SBI PMU raw event v2 (Experimental)
* Simple FDT based mailbox driver framework
* RPMI shared memory transport driver (Experimental)
* RPMI system reset driver (Experimental)
* Simple FDT based system suspend driver framework
* RPMI system suspend driver (Experimental)
* Simple FDT based HSM driver framework
* RPMI HSM driver (Experimental)
* Simple FDT based CPPC driver framework
* RPMI CPPC driver (Experimental)
* SBI Message Proxy (MPXY) extension (Experimental)
* Simple FDT based MPXY driver framework
* Common RPMI client driver for MPXY (Experimental)
* Support for vector misaligned load/store

Overall, this release adds more ISA extensions, drivers, and
other improvements.

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

