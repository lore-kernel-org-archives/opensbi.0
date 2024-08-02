From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Aug 2024 12:34:50 +0530
Subject: OpenSBI v1.5.1 Released
Message-ID: <CAAhSdy0zTsRC9yrTim5LLx-Ok2MVSn-JLN=H-ssxEy6FmW3ckg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

The OpenSBI v1.5.1 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This intermediate release has following fixes:

* Save/restore menvcfg only when it exists
* Adjust Sscofpmf mhpmevent mask for upper 8 bits
* Fix potential NULL pointer dereferences in SBI DBTR
* Fix incorrect size passed to sbi_zalloc() in SBI FWFT
* Check result of pmp_get() in is_pmp_entry_mapped()

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

