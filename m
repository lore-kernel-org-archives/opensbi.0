From: Dong Du <Dd_nirvana@sjtu.edu.cn>
Date: Tue, 27 Jul 2021 14:08:35 +0800
Subject: [PATCH] lib: sbi: Fix bug in strncmp function
Message-ID: <20210727060835.23080-1-Dd_nirvana@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dong Du <dd_nirvana@sjtu.edu.cn>

strncmp should return 0 when the count is 0.
Fix the issue in sbi_strncmp.

Signed-off-by: Dong Du <ddnirvana1@gmail.com>
---
 lib/sbi/sbi_string.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index 7805ba4..f93ed5f 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -29,6 +29,9 @@ int sbi_strcmp(const char *a, const char *b)
 
 int sbi_strncmp(const char *a, const char *b, size_t count)
 {
+	if (!count)
+		return 0;
+
 	/* search first diff or end of string */
 	for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
 		;
-- 
2.31.1


