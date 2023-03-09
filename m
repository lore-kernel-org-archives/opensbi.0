From: Xiang W <wxjstz@126.com>
Date: Thu,  9 Mar 2023 18:35:28 +0800
Subject: [PATCH v2] lib: sbi_scratch: Optimize the alignment code for alloc size
Message-ID: <20230309103528.78775-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
Changes in v2:
- Added type conversion as suggested by Andreas Schwab to prevent
  errors when extending sign bits

 lib/sbi/sbi_scratch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index 87b34c6..55ebdbb 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -59,8 +59,8 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
 	if (!size)
 		return 0;
 
-	if (size & (__SIZEOF_POINTER__ - 1))
-		size = (size & ~(__SIZEOF_POINTER__ - 1)) + __SIZEOF_POINTER__;
+	size += __SIZEOF_POINTER__ - 1;
+	size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
 
 	spin_lock(&extra_lock);
 
-- 
2.39.2


