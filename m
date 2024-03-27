From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Wed, 27 Mar 2024 11:11:36 +0100
Subject: [PATCH 8/9] platform: generic: thead: Add definition of T-Head's vendor ID
In-Reply-To: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
Message-ID: <20240327101137.3644359-9-christoph.muellner@vrull.eu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds a macro for T-Head's vendor ID to the C9xx encodings.

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
---
 platform/generic/include/thead/c9xx_encoding.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/platform/generic/include/thead/c9xx_encoding.h b/platform/generic/include/thead/c9xx_encoding.h
index 58adbef..a4811f6 100644
--- a/platform/generic/include/thead/c9xx_encoding.h
+++ b/platform/generic/include/thead/c9xx_encoding.h
@@ -1,6 +1,8 @@
 #ifndef __RISCV_THEAD_C9XX_ENCODING_H____
 #define __RISCV_THEAD_C9XX_ENCODING_H____
 
+#define THEAD_VENDOR_ID			0x5b7
+
 /* T-HEAD C9xx M mode CSR.  */
 #define THEAD_C9XX_CSR_MXSTATUS		0x7c0
 #define THEAD_C9XX_CSR_MHCR		0x7c1
-- 
2.44.0


