From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jul 2024 17:24:01 +0800
Subject: [PATCH] include: Adjust Sscofpmf mhpmevent mask for upper 8 bits
Message-ID: <20240730092401.8182-1-eric.lin@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, OpenSBI reserves the upper 16 bits in mhpmevent for
the Sscofpmf extension.

However, according to the Sscofpmf extension specification[1],
it only defines the upper 8 bits in mhpmevent for privilege mode
inhibit and counter overflow disable. Other bits are defined by
the platform for event selection.

Since vendors might define raw event encoding exceeding 48 bits in
mhpmevent, we should adjust the MHPMEVENT_SSCOF_MASK to support it.

Link: https://github.com/riscvarchive/riscv-count-overflow [1]
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 include/sbi/riscv_encoding.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 477fa3a1..2ed05f24 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -207,7 +207,7 @@
 
 #endif
 
-#define MHPMEVENT_SSCOF_MASK		_ULL(0xFFFF000000000000)
+#define MHPMEVENT_SSCOF_MASK		_ULL(0xFF00000000000000)
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
 #define ENVCFG_PBMTE			(_ULL(1) << 62)
-- 
2.43.2


