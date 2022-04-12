From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 12 Apr 2022 09:16:53 +0800
Subject: [PATCH] include: correct the definition of MSTATUS_VS
Message-ID: <20220412011653.27641-1-vincent.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Accordind to the RISC-V privileged specification, the VS filed is
mstatus[10:9] instead of mstatus[24:23]. Modify the MSTATUS_VS
to the correct value.

Reported-by: I-Cheng Cheng <i-cheng.cheng@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 include/sbi/riscv_encoding.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 04d5621..a9772a6 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -25,7 +25,7 @@
 #define MSTATUS_MPP			(_UL(3) << MSTATUS_MPP_SHIFT)
 #define MSTATUS_FS			_UL(0x00006000)
 #define MSTATUS_XS			_UL(0x00018000)
-#define MSTATUS_VS			_UL(0x01800000)
+#define MSTATUS_VS			_UL(0x00000600)
 #define MSTATUS_MPRV			_UL(0x00020000)
 #define MSTATUS_SUM			_UL(0x00040000)
 #define MSTATUS_MXR			_UL(0x00080000)
-- 
2.17.1


