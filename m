From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Mon, 14 Aug 2023 10:09:59 +0530
Subject: [PATCH] Makefile: Force GNU hashing
Message-ID: <20230814043959.390101-1-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Yocto QA step verifies that binaries and DSOs use DT_GNU_HASH rather than
DT_HASH. If the linker is called directly, then we need to make sure to pass in
the hashing style.

Signed-off-by: Jeff Law <jlaw@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 730dbd9..7fb8d2d 100644
--- a/Makefile
+++ b/Makefile
@@ -161,7 +161,7 @@ ifeq ($(LD_IS_LLD),y)
 RELAX_FLAG	=	-mno-relax
 USE_LD_FLAG	=	-fuse-ld=lld
 else
-USE_LD_FLAG	=	-fuse-ld=bfd
+USE_LD_FLAG	=	-fuse-ld=bfd -Wl,--hash-style=gnu
 endif
 
 # Check whether the linker supports creating PIEs
-- 
2.34.1


