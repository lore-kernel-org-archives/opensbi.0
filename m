From: guoren@kernel.org <guoren@kernel.org>
Date: Tue, 27 Apr 2021 07:00:25 +0000
Subject: [PATCH v2] platform: generic: Enable FW_PIC=y as default
Message-ID: <1619506825-2230-1-git-send-email-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

Tested with qemu_rv32 & rv64, T-HEAD all hardwares. I think it's
time to enable it as default.

Thx Vincent's commit: 0f20e8adcf42

Suggested-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Tested-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Vincent Chen <vincent.chen@sifive.com>
---
 firmware/objects.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/firmware/objects.mk b/firmware/objects.mk
index c1f632e..ce91c2f 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -13,6 +13,10 @@ firmware-cflags-y +=
 firmware-asflags-y +=
 firmware-ldflags-y +=
 
+ifndef FW_PIC
+FW_PIC := y
+endif
+
 ifeq ($(FW_PIC),y)
 firmware-genflags-y +=	-DFW_PIC
 firmware-asflags-y  +=	-fpic
-- 
2.7.4


