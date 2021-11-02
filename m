From: Atish Patra <atish.patra@wdc.com>
Date: Tue,  2 Nov 2021 08:09:49 -0700
Subject: [PATCH v3 01/11] riscv: Add new CSRs introduced by Sscofpmf extension
In-Reply-To: <20211102150959.492991-1-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
Message-ID: <20211102150959.492991-2-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/riscv_encoding.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index e1d0b463c668..14caa95d66de 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -516,6 +516,40 @@
 #define CSR_MHPMEVENT30			0x33e
 #define CSR_MHPMEVENT31			0x33f
 
+/* For RV32 */
+#define CSR_MHPMEVENT3H			0x723
+#define CSR_MHPMEVENT4H			0x724
+#define CSR_MHPMEVENT5H			0x725
+#define CSR_MHPMEVENT6H			0x726
+#define CSR_MHPMEVENT7H			0x727
+#define CSR_MHPMEVENT8H			0x728
+#define CSR_MHPMEVENT9H			0x729
+#define CSR_MHPMEVENT10H		0x72a
+#define CSR_MHPMEVENT11H		0x72b
+#define CSR_MHPMEVENT12H		0x72c
+#define CSR_MHPMEVENT13H		0x72d
+#define CSR_MHPMEVENT14H		0x72e
+#define CSR_MHPMEVENT15H		0x72f
+#define CSR_MHPMEVENT16H		0x730
+#define CSR_MHPMEVENT17H		0x731
+#define CSR_MHPMEVENT18H		0x732
+#define CSR_MHPMEVENT19H		0x733
+#define CSR_MHPMEVENT20H		0x734
+#define CSR_MHPMEVENT21H		0x735
+#define CSR_MHPMEVENT22H		0x736
+#define CSR_MHPMEVENT23H		0x737
+#define CSR_MHPMEVENT24H		0x738
+#define CSR_MHPMEVENT25H		0x739
+#define CSR_MHPMEVENT26H		0x73a
+#define CSR_MHPMEVENT27H		0x73b
+#define CSR_MHPMEVENT28H		0x73c
+#define CSR_MHPMEVENT29H		0x73d
+#define CSR_MHPMEVENT30H		0x73e
+#define CSR_MHPMEVENT31H		0x73f
+
+/* Counter Overflow CSR */
+#define CSR_SCOUNTOVF			0xda0
+
 /* Debug/Trace Registers */
 #define CSR_TSELECT			0x7a0
 #define CSR_TDATA1			0x7a1
-- 
2.31.1


