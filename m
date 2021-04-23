From: guoren@kernel.org <guoren@kernel.org>
Date: Fri, 23 Apr 2021 07:37:20 +0000
Subject: [PATCH] platform: generic: Enable FW_PIC=y as default
Message-ID: <1619163440-93918-1-git-send-email-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

Tested with qemu_rv32 & rv64, T-HEAD all hardwares. I think it's
time to enable it as default.

Thx Vincent's commit: 0f20e8adcf42

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Tested-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Vincent Chen <vincent.chen@sifive.com>
---
 platform/generic/config.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/platform/generic/config.mk b/platform/generic/config.mk
index 8151974..61015a0 100644
--- a/platform/generic/config.mk
+++ b/platform/generic/config.mk
@@ -21,6 +21,7 @@ platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
 FW_TEXT_START=0x80000000
 FW_DYNAMIC=y
 FW_JUMP=y
+FW_PIC=y
 ifeq ($(PLATFORM_RISCV_XLEN), 32)
   # This needs to be 4MB aligned for 32-bit system
   FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x400000)))
-- 
2.7.4


