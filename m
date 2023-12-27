From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Dec 2023 21:56:21 +0530
Subject: OpenSBI v1.4 Released
Message-ID: <CAAhSdy36hPww1vKAzjSwD+jdLmgKyGtrVfXqc1K1T7DU4Vf0FA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

The OpenSBI v1.4 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This release has:

* Synopsys DesignWare APB GPIO driver
* Zicntr and Zihpm support
* Console print improvements
* Smepmp support
* Simple FDT based syscon regmap driver
* Syscon based reboot and poweroff driver
* Non-contiguous hpm counters
* Smcntrpmf support
* Full sparse hartid support
* IPI improvements
* RFENCE improvements
* Zkr support
* Andes custom PMU support

Overall, this release mainly adds more ISA extensions, drivers and
other improvements.

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

