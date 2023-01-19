From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu, 19 Jan 2023 20:48:22 +0530
Subject: [PATCH v3 1/5] firmware: Split RO/RX and RW sections
In-Reply-To: <20230119151826.59697-1-hchauhan@ventanamicro.com>
References: <20230119151826.59697-1-hchauhan@ventanamicro.com>
Message-ID: <20230119151826.59697-2-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Split the RO/RX and RW sections so that they can have
independent pmp entries with required permissions. The
split size is ensured to be a power-of-2 as required by
pmp.

_fw_rw_offset symbol marks the beginning of the data
section.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 firmware/fw_base.ldS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 563ae25..5411bbd 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -42,6 +42,14 @@
 
 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
 
+	/*
+	 * PMP regions must be to be power-of-2. RO/RW will have separate
+	 * regions, so ensure that the split is power-of-2.
+	 */
+	. = ALIGN(1 << LOG2CEIL(SIZEOF(.rodata) + SIZEOF(.text)));
+
+	PROVIDE(_fw_rw_offset = (.  - _fw_start));
+
 	/* Beginning of the read-write data sections */
 
 	.data :
-- 
2.39.1


