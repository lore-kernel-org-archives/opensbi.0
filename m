From: Dongdong Zhang <zhangdongdong@eswincomputing.com>
Date: Tue, 29 Nov 2022 11:54:07 +0800
Subject: [PATCH 1/1] firmware: Minor optimization for relocate
In-Reply-To: <20221129035407.28946-1-zhangdongdong@eswincomputing.com>
References: <20221129035407.28946-1-zhangdongdong@eswincomputing.com>
Message-ID: <20221129035407.28946-2-zhangdongdong@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The t3 register stores the address of _load_end. If relocation is not required, it is unnecessary to calculate the address of _load_end.

This can reduce the operation time of two instructions.

Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
---
 firmware/fw_base.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 07be4c4..3f622b3 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -128,9 +128,9 @@ _relocate:
 	REG_L	t1, 0(t1)
 	lla	t2, _load_start
 	REG_L	t2, 0(t2)
+	beq	t0, t2, _relocate_done
 	sub	t3, t1, t0
 	add	t3, t3, t2
-	beq	t0, t2, _relocate_done
 	lla	t4, _relocate_done
 	sub	t4, t4, t2
 	add	t4, t4, t0
-- 
2.17.1


