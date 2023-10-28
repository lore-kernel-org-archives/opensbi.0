From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Sun, 29 Oct 2023 00:31:37 +0200
Subject: [PATCH 1/1] include: sbi: macros for mseccfg.sseed and .useed
Message-ID: <20231028223137.95007-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Define macros to access the sseed and the useed bits in the machine
security configuration register (mseccfg). These are defined in the
Zkr ISA extension [1] to control access to the seed CSR.

[1] RISC-V Cryptography Extensions Volume I
    Scalar & Entropy Source Instructions
    Version v1.0.1, 18'th Feb, 2022: Ratified
    https://drive.google.com/file/d/1Thd010Eh2DqnhDHpDd3SM7Ame7KENkPw/view

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
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


