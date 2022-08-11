From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 11 Aug 2022 16:58:11 +0800
Subject: [RFC PATCH 0/0] Move the address of FW_JUMP_FDT_ADDR forward
Message-ID: <20220811085811.3577-1-nylon.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "Nylon.Chen" <nylon.chen@sifive.com>

A while ago.
when we boot from QEMU by OpenSBI Jump mode with initramfs kerenl.

The kernel encountered panic because the kernel's section was
overwritten, and the address was FW_JUMP_FDT_ADDR.

we find out the the rule `$(FW_TEXT_START) + 0x2200000` in
platform/generic/config.mk

The situation is our kernel size big than it.

e.g. 
# readelf -h vmlinux 
init.bss's LMA is "0x00000000024a96a0", and when we use this rule, it
exceeds its size.

0x24a96a0 > 0x2200000

After our experiment, we can add offset FW_JUMP_FDT_ADDR, and the
problem is solved.

But in my opinion, this is not a good method because the next time the
kernel size increases, the same situation occurs again.

So maybe we can move the address forward and normalize the address to
FW_JUMP_FDT_ADDR?

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
-- 
2.36.1


