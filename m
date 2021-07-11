From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 11 Jul 2021 03:28:21 +0100
Subject: [PATCH v5 3/6] firmware: Explicitly pass -pie to the linker,
 not just the driver
In-Reply-To: <20210711022824.29915-1-jrtc27@jrtc27.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
Message-ID: <20210711022824.29915-4-jrtc27@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When using Clang with a bare-metal triple, -pie does not get passed to
the linker as it's not normally a thing that makes sense, unlike GCC
which will unconditionally forward it on and potentially result in a
linker error. However, LLD does support it, and manually forwarding it
on works as desired, so do so to fully support FW_PIC with Clang and
LLD.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 firmware/objects.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/firmware/objects.mk b/firmware/objects.mk
index ce91c2f..3bc83cd 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -21,7 +21,7 @@ ifeq ($(FW_PIC),y)
 firmware-genflags-y +=	-DFW_PIC
 firmware-asflags-y  +=	-fpic
 firmware-cflags-y   +=	-fPIE -pie
-firmware-ldflags-y  +=  -Wl,--no-dynamic-linker
+firmware-ldflags-y  +=  -Wl,--no-dynamic-linker -Wl,-pie
 endif
 
 ifdef FW_TEXT_START
-- 
2.31.0


