From: Chao-ying Fu <icebergfu@gmail.com>
Date: Tue, 25 Feb 2025 16:53:34 -0800
Subject: [PATCH v2 10/11] Change to jump to mips_cps_core_entry
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
Message-ID: <20250226005335.19498-10-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For MIPS P8700, all harts start from mips_cps_core_entry.
---
 firmware/fw_base.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 536bcd2..1812736 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -45,6 +45,11 @@
 	.align 3
 	.globl _start
 	.globl _start_warm
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	lla	t0, mips_cps_core_entry
+	jr	t0
+#endif
+
 _start:
 	/* Find preferred boot HART id */
 	MOV_3R	s0, a0, s1, a1, s2, a2
-- 
2.47.1


