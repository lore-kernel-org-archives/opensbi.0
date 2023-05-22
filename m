From: Xiang W <wxjstz@126.com>
Date: Mon, 22 May 2023 13:18:06 +0800
Subject: [PATCH v3 1/4] lib: sbi: Fix return of sbi_console_init
In-Reply-To: <20230522051809.1062177-1-wxjstz@126.com>
References: <20230522051809.1062177-1-wxjstz@126.com>
Message-ID: <20230522051809.1062177-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

console is not a required peripheral. So it should return success when
the console does not exist.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index f3ac003..168dffd 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -481,5 +481,11 @@ void sbi_console_set_device(const struct sbi_console_device *dev)
 
 int sbi_console_init(struct sbi_scratch *scratch)
 {
-	return sbi_platform_console_init(sbi_platform_ptr(scratch));
+	int rc = sbi_platform_console_init(sbi_platform_ptr(scratch));
+
+	/* console is not a necessary device */
+	if (rc == SBI_ENODEV)
+		return 0;
+
+	return rc;
 }
-- 
2.39.2


