From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Tue, 31 Aug 2021 19:09:27 +0200
Subject: [RFC 1/1] fw_base: header for vendor information
Message-ID: <20210831170927.93019-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To implement secure boot OpenSBI should provide a well defined header
structure with reserved space in which a vendor can place information
related to a signature that the boot ROM code can check.

Typically this space will be used to add

* vendor magic
* type of signature
* offset to signature

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
Ideally such a header would be standardized. This would allow alternative
firmware to be validated by the same boot ROM.

Could this be a topic for the platform specification?

Best regards

Heinrich
---
 firmware/fw_base.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 1569e60..e2cc5cb 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -13,6 +13,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_version.h>
 
 #define BOOT_STATUS_RELOCATE_DONE	1
 #define BOOT_STATUS_BOOT_HART_DONE	2
@@ -47,6 +48,15 @@
 	.globl _start
 	.globl _start_warm
 _start:
+	j	_real_start
+	.align	2
+	.ascii	"OpenSBI\0"
+	.short	OPENSBI_VERSION_MAJOR
+	.short  OPENSBI_VERSION_MINOR
+	/* Space reserved for vendor information, e.g. offset to a signature */
+	.long	0
+	.skip	12
+_real_start:
 	/* Find preferred boot HART id */
 	MOV_3R	s0, a0, s1, a1, s2, a2
 	call	fw_boot_hart
-- 
2.30.2


