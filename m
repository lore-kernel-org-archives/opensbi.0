From: Xiang W <wxjstz@126.com>
Date: Wed, 15 Sep 2021 14:50:52 +0800
Subject: [PATCH] lib: sbi: fix ctz bug
Message-ID: <20210915065052.14980-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The original version of ctz will cause an endless loop, if the parameter
passed in is 0. This commit fixes this bug.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/riscv_asm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 4c24a51..d7b9b2b 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -213,6 +213,9 @@ static unsigned long ctz(unsigned long x)
 {
 	unsigned long ret = 0;
 
+	if (x == 0)
+		return 8 * sizeof(x);
+
 	while (!(x & 1UL)) {
 		ret++;
 		x = x >> 1;
-- 
2.30.2


