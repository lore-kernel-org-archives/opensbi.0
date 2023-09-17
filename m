From: Vivian Wang <dramforever@live.com>
Date: Mon, 18 Sep 2023 01:52:49 +0800
Subject: [PATCH 1/3] firmware: Remove ALIGN in .rela.dyn in linker script
In-Reply-To: <TYYP286MB1439495D0B19A0ECFD89BDABC6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439495D0B19A0ECFD89BDABC6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <TYYP286MB143994BAD3D130B072AB4105C6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The .rela.dyn section should be exactly the size of the relocations,
without padding. On RV64, .rela* sections are already aligned and
there's no need for padding. On RV32, this adds padding up to 4 bytes,
which, if present, confuses the relocation loop into processing an extra
entry past the end of .rela*, and it crashes with an invalid memory
access.

Fixes: 0f20e8adcf42 ("firmware: Support position independent execution")
Signed-off-by: Vivian Wang <dramforever@live.com>
---
 firmware/fw_base.ldS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 3d68484..88b8dfd 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -49,7 +49,6 @@
 	.rela.dyn : {
 		PROVIDE(__rel_dyn_start = .);
 		*(.rela*)
-		. = ALIGN(8);
 		PROVIDE(__rel_dyn_end = .);
 	}
 
-- 
2.41.0


