From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Jun 2023 13:18:53 +0530
Subject: OpenSBI v1.3 Released
Message-ID: <CAAhSdy0S7UWzroJV04w4xfQvcaXoQ_a7zXfT9aLaYT5kWWPJ=Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

The OpenSBI v1.3 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This release has:

* Allow platform to influence cold boot HART selection
* Starfive JH7110 platform support
* Split RX and RW firmware regions
* Advertise nonretentive suspend for allwinner D1 platform
* Byteorder/endianness conversion macros
* SBI debug console extension (Experimental)
* Configure the PMA regions for RZ/Five platform
* SBI system suspend extension (Experimental)
* SBI PMU platform firmware events (Experimental)
* SBI CPPC extension (Experimental)
* Optimized remote TLB flushes
* Simple heap for boot time memory allocations
* Bring back no-map DT property for reserved memory nodes

Overall, this release mainly adds new SBI extensions along
with other improvements.

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

