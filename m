From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 18 Jan 2023 17:07:54 +0530
Subject: [PATCH v2 2/5] firmware: Move dynsym and reladyn sections to RX section
In-Reply-To: <20230118113757.46282-1-hchauhan@ventanamicro.com>
References: <20230118113757.46282-1-hchauhan@ventanamicro.com>
Message-ID: <20230118113757.46282-3-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the dynsym and reladyn sections are under RW data.
They are moved to the Read-only/Executable region.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 firmware/fw_base.ldS | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 5411bbd..9a1304e 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -30,23 +30,39 @@
 
 	/* Beginning of the read-only data sections */
 
+	PROVIDE(_rodata_start = .);
+
 	.rodata :
 	{
-		PROVIDE(_rodata_start = .);
 		*(.rodata .rodata.*)
 		. = ALIGN(8);
-		PROVIDE(_rodata_end = .);
 	}
 
-	/* End of the read-only data sections */
-
 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
 
+	.dynsym : {
+		PROVIDE(__dyn_sym_start = .);
+		*(.dynsym)
+		PROVIDE(__dyn_sym_end = .);
+	}
+
+	.rela.dyn : {
+		PROVIDE(__rel_dyn_start = .);
+		*(.rela*)
+		. = ALIGN(8);
+		PROVIDE(__rel_dyn_end = .);
+	}
+
+	PROVIDE(_rodata_end = .);
+
+	/* End of the read-only data sections */
+
 	/*
-	 * PMP regions must be to be power-of-2. RO/RW will have separate
+	 * PMP regions must be to be power-of-2. RX/RW will have separate
 	 * regions, so ensure that the split is power-of-2.
 	 */
-	. = ALIGN(1 << LOG2CEIL(SIZEOF(.rodata) + SIZEOF(.text)));
+	. = ALIGN(1 << LOG2CEIL((SIZEOF(.rodata) + SIZEOF(.text)
+				+ SIZEOF(.dynsym) + SIZEOF(.rela.dyn))));
 
 	PROVIDE(_fw_rw_offset = (.  - _fw_start));
 
@@ -67,19 +83,6 @@
 		PROVIDE(_data_end = .);
 	}
 
-	.dynsym : {
-		PROVIDE(__dyn_sym_start = .);
-		*(.dynsym)
-		PROVIDE(__dyn_sym_end = .);
-	}
-
-	.rela.dyn : {
-		PROVIDE(__rel_dyn_start = .);
-		*(.rela*)
-		. = ALIGN(8);
-		PROVIDE(__rel_dyn_end = .);
-	}
-
 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
 
 	.bss :
-- 
2.39.0


