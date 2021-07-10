From: Xiang W <wxjstz@126.com>
Date: Sun, 11 Jul 2021 02:21:46 +0800
Subject: [PATCH] firmware: Detect whether the toolchain supports pie and
 automatically disable the FW_PIC option
Message-ID: <20210710182146.148767-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/objects.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/firmware/objects.mk b/firmware/objects.mk
index ce91c2f..96a8d7d 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -17,6 +17,10 @@ ifndef FW_PIC
 FW_PIC := y
 endif
 
+ifeq ($(FW_PIC),y)
+FW_PIC := $(shell $(CC) -nostdlib -fPIE -Wl,-pie /dev/null  -o /dev/null 2>/dev/null && echo y || echo n)
+endif
+
 ifeq ($(FW_PIC),y)
 firmware-genflags-y +=	-DFW_PIC
 firmware-asflags-y  +=	-fpic
-- 
2.30.2


