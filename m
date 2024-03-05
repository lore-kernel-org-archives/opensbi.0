From: Xiang W <wxjstz@126.com>
Date: Tue,  5 Mar 2024 18:31:03 +0800
Subject: [PATCH] firmware: Prevent _start from not being at the beginning
Message-ID: <20240305103134.874444-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are multiple .entry sections in opensbi, and _start may be put
after other .entry sections, which may cause problems. The patch fix
this issue.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S   | 2 +-
 firmware/fw_base.ldS | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 09894e6..7ade6a5 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -42,7 +42,7 @@
 999:
 .endm
 
-	.section .entry, "ax", %progbits
+	.section .entry0, "ax", %progbits
 	.align 3
 	.globl _start
 	.globl _start_warm
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index fb47984..c1dc743 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -18,6 +18,7 @@
 	.text :
  	{
 		PROVIDE(_text_start = .);
+		*(.entry0)
 		*(.entry)
 		*(.text)
 		. = ALIGN(8);
-- 
2.43.0


