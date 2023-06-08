From: Xiang W <wxjstz@126.com>
Date: Thu,  8 Jun 2023 15:32:14 +0800
Subject: [PATCH v4 13/13] lib: sbi: Fix missing '\0' when buffer szie equal 1
In-Reply-To: <20230608073214.1566095-1-wxjstz@126.com>
References: <20230608073003.1565710-1-wxjstz@126.com>
 <20230608073214.1566095-1-wxjstz@126.com>
Message-ID: <20230608073214.1566095-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix special case: sbi_snprintf(out, 1, ...), The previous code will
not fill the buffer with any char.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 7d811e7..81555f3 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -157,6 +157,14 @@ static void printc(struct print_info *info, char ch)
 	/* The buffer is long enough to add new characters */
 	if (info->len - info->pos > 1)
 		goto append;
+
+	/*
+	 * special case: sbi_snprintf(out, 1, ...);
+	 * This case never jumps to append, so add '\0' here
+	 */
+	if (info->pos == 0)
+		info->out[0] = '\0';
+
 	return;
 
 append:
-- 
2.39.2


