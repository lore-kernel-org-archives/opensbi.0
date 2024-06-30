From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 30 Jun 2024 15:08:04 +0530
Subject: OpenSBI v1.5 Released
Message-ID: <CAK9=C2UC94bg=eoFkYVLo6h-pTYJtn9wV30YguAsh489-LCGJw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

The OpenSBI v1.5 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This release has:

* SBI debug triggers (DBTR) extension (Experimental)
* Support to specify coldboot harts in DT
* Relocatable FW_JUMP_ADDR and FW_JUMP_FDT_ADDR
* Smcsrind and Smcdeleg extensions support
* SBIUnit testing framework
* Initial domain context management support
* Platform specific load/store emulation callbacks
* New trap context
* Improved sbi_trap_error() to dump state in a nested trap
* SBI supervisor software events (SSE) extension (Experimental)
* Simplified wait_for_coldboot() implementation
* Early wakeup of non-coldboot HART in the coldboot path
* Sophgo CV18XX/SG200X series support
* APLIC delegation DT property fix
* Svade and Svadu extensions support
* SBI firmware features (FWFT) extension (Experimental)

Overall, this release mainly adds more ISA extensions, SBI extensions
and other improvements.

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

