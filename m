From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 11 Jul 2021 03:28:22 +0100
Subject: [PATCH v5 4/6] firmware: Only default FW_PIC to y if supported
In-Reply-To: <20210711022824.29915-1-jrtc27@jrtc27.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
Message-ID: <20210711022824.29915-5-jrtc27@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Bare-metal GNU ld does not support PIE, so if using it this will result
in a failure to build. Instead, default to FW_PIC=n if not supported.
Note that an explicit FW_PIC=y is not overriden, to ensure the build
fails rather than silently producing a position-dependent binary.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 Makefile            | 3 +++
 firmware/objects.mk | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6b64205..ba06313 100644
--- a/Makefile
+++ b/Makefile
@@ -106,6 +106,9 @@ ifndef PLATFORM_RISCV_XLEN
   endif
 endif
 
+# Check whether the linker supports creating PIEs
+OPENSBI_LD_PIE := $(shell $(CC) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
+
 # Setup list of objects.mk files
 ifdef PLATFORM
 platform-object-mks=$(shell if [ -d $(platform_src_dir)/ ]; then find $(platform_src_dir) -iname "objects.mk" | sort -r; fi)
diff --git a/firmware/objects.mk b/firmware/objects.mk
index 3bc83cd..8da7ca3 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -14,7 +14,7 @@ firmware-asflags-y +=
 firmware-ldflags-y +=
 
 ifndef FW_PIC
-FW_PIC := y
+FW_PIC := $(OPENSBI_LD_PIE)
 endif
 
 ifeq ($(FW_PIC),y)
-- 
2.31.0


