From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Sun, 29 Oct 2023 00:49:57 +0200
Subject: [PATCH 1/3] include: sbi: macros for mseccfg.sseed and .useed
In-Reply-To: <20231028224959.95465-1-heinrich.schuchardt@canonical.com>
References: <20231028224959.95465-1-heinrich.schuchardt@canonical.com>
Message-ID: <20231028224959.95465-2-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Define macros to access the sseed and the useed bit in the machine
security configuration register (mseccfg).

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
Just resending this patch which should be merged independent of how
we set mseccfg.sseed in future.
---
 include/sbi/riscv_encoding.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index a545242..0996d64 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -678,6 +678,10 @@
 #define MSECCFG_MMWP			(_UL(1) << MSECCFG_MMWP_SHIFT)
 #define MSECCFG_RLB_SHIFT		(2)
 #define MSECCFG_RLB			(_UL(1) << MSECCFG_RLB_SHIFT)
+#define MSECCFG_USEED_SHIFT		(8)
+#define MSECCFG_USEED			(_UL(1) << MSECCFG_USEED_SHIFT)
+#define MSECCFG_SSEED_SHIFT		(9)
+#define MSECCFG_SSEED			(_UL(1) << MSECCFG_SSEED_SHIFT)
 
 /* Counter Overflow CSR */
 #define CSR_SCOUNTOVF			0xda0
-- 
2.40.1


