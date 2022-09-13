From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Tue, 13 Sep 2022 15:17:08 +0530
Subject: [PATCH] lib: sbi: Fix sbi_strnlen wrong count decrement
Message-ID: <20220913094708.2089724-1-rpathak@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

count(maxlen) should not be decremented here

Fixes: 1901e8a287bc ("platform: Add minimal libc support.")
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 lib/sbi/sbi_string.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index c163f3176506..9ebea693d0f6 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -59,7 +59,6 @@ size_t sbi_strnlen(const char *str, size_t count)
 	while (*str != '\0' && ret < count) {
 		ret++;
 		str++;
-		count--;
 	}
 
 	return ret;
-- 
2.34.1


