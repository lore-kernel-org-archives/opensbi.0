From: Xiang W <wxjstz@126.com>
Date: Fri, 16 Jun 2023 15:03:51 +0800
Subject: [PATCH] firmware: Fix find hart index
Message-ID: <20230616070351.779644-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After the loop to find the hartid is launched, assigning -1 to
index will fail in the subsequent compare instruction bge. Fix
This.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index fff09e1..b947423 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -471,7 +471,6 @@ _start_warm:
 	add	s9, s9, 4
 	add	a4, a4, 1
 	blt	a4, s7, 1b
-	li	a4, -1
 2:	add	s6, a4, zero
 3:	bge	s6, s7, _start_hang
 
-- 
2.39.2


