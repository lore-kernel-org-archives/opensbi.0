From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Dec 2020 17:15:33 +0800
Subject: OpenSBI fw_dynamic firmware does not boot 32-bit kernel on QEMU 'virt'
Message-ID: <CAEUhbmX1_3FTO4LwSN37p8itHhsLfUHaJF9qauESEx1E3B1UfA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

With latest QEMU HEAD, 32-bit kernel with the following kernel commit
reverted [1]

1bd14a66ee5200d6a24419cbd2e0a0fccd4da36f ("RISC-V: Remove any memblock
representing unusable memory area")

still does not boot on QEMU 'virt'. However explicitly specifying
-bios to use the fw_jump firmware will allow the kernel to boot.

When QEMU switched OpenSBI from fw_jump to fw_dynamic during the 5.2.0
development cycle, I remember at that time I tested this on 32-bit
machine for both 'virt' and 'sifive_u'. See the following commit
message as it indicated 32-bit testing.

2cacd8414daf6a0643926392f05fd397ed1e9b66 "hw/riscv: Use pre-built bios
image of generic platform for virt & sifive_u"

I don't have too much time to do the debugging. I hope someone could
pick this up and identify where the problem is.

[1] http://lists.infradead.org/pipermail/linux-riscv/2020-December/003925.html

Regards,
Bin

