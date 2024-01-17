From: Xiang W <wxjstz@126.com>
Date: Wed, 17 Jan 2024 18:42:02 +0800
Subject: [PATCH v3 05/10] firmware: fw_base.S: Move _link_start to .rodata section
In-Reply-To: <20240117104212.1055737-1-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com>
Message-ID: <20240117104212.1055737-6-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

_link_start is readonly, so move it to rodata section.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 18dd0c5..7c7157d 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -482,6 +482,9 @@ _relocate_lottery:
 	RISCV_PTR	0
 _boot_status:
 	RISCV_PTR	0
+
+	.section .rodata
+	.align 3
 _link_start:
 	RISCV_PTR	FW_TEXT_START
 
-- 
2.43.0


