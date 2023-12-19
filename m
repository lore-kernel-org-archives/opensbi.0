From: Xiang W <wxjstz@126.com>
Date: Tue, 19 Dec 2023 11:31:59 +0800
Subject: [PATCH] Makefile: Remove unused code and data
Message-ID: <20231219033217.181779-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add compiler options to create separate sections for functions and
static variables. And add options to the linker to remove unused
sections.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index de4e73a..fbb64f2 100644
--- a/Makefile
+++ b/Makefile
@@ -331,7 +331,7 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
 GENFLAGS	+=	$(platform-genflags-y)
 GENFLAGS	+=	$(firmware-genflags-y)
 
-CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing
+CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
 ifneq ($(DEBUG),)
 CFLAGS		+=	-O0
 else
@@ -377,6 +377,7 @@ ARFLAGS		=	rcs
 ELFFLAGS	+=	$(USE_LD_FLAG)
 ELFFLAGS	+=	-Wl,--exclude-libs,ALL
 ELFFLAGS	+=	-Wl,--build-id=none
+ELFFLAGS	+=	-Wl,--gc-sections
 ELFFLAGS	+=	$(platform-ldflags-y)
 ELFFLAGS	+=	$(firmware-ldflags-y)
 
-- 
2.43.0


