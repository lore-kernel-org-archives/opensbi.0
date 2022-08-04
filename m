From: Vivian Wang <dramforever@live.com>
Date: Thu,  4 Aug 2022 22:32:27 +0800
Subject: [PATCH v2 1/5] include: Add mstatus[h].GVA encodings
In-Reply-To: <TYYP286MB1439FC0A558FBF23B64D8BB4C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439FC0A558FBF23B64D8BB4C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <TYYP286MB14393BE506FBC4D0E67209B5C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The machine mode GVA field is in mstatus for RV64 and mstatush for RV32,
and is available if the hypervisor extension is available. If an
exception occurs, we may need to redirect the trap to HS-mode, in which
case, hstatus.GVA should be set to same as the machine mode GVA bit.

Add MSTATUS_GVA for RV64, MSTATUSH_GVA for RV32, and their SHIFT
encodings. The SHIFT index is helpful in assembly code, since field
extraction can be implemented in only one register. In pseudocode:

- For RV32: gva = (mstatus >> MSTATUS_GVA_SHIFT) & 1;
- For RV64: gva = (mstatush >> MSTATUSH_GVA_SHIFT) & 1;

Signed-off-by: Vivian Wang <dramforever@live.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/riscv_encoding.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 798afb7..8884301 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -38,10 +38,14 @@
 #define MSTATUS_SXL			_ULL(0x0000000C00000000)
 #define MSTATUS_SBE			_ULL(0x0000001000000000)
 #define MSTATUS_MBE			_ULL(0x0000002000000000)
+#define MSTATUS_GVA			_ULL(0x0000004000000000)
+#define MSTATUS_GVA_SHIFT		38
 #define MSTATUS_MPV			_ULL(0x0000008000000000)
 #else
 #define MSTATUSH_SBE			_UL(0x00000010)
 #define MSTATUSH_MBE			_UL(0x00000020)
+#define MSTATUSH_GVA			_UL(0x00000040)
+#define MSTATUSH_GVA_SHIFT		6
 #define MSTATUSH_MPV			_UL(0x00000080)
 #endif
 #define MSTATUS32_SD			_UL(0x80000000)
-- 
2.37.1


