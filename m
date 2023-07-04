From: Xiang W <wxjstz@126.com>
Date: Tue,  4 Jul 2023 21:13:16 +0800
Subject: [PATCH v7 11/11] lib: sbi: Fix missing '\0' when buffer szie equal 1
In-Reply-To: <20230704131208.465914-1-wxjstz@126.com>
References: <20230704131208.465914-1-wxjstz@126.com>
Message-ID: <20230704131316.466246-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix special case: sbi_snprintf(out, out_len, ...) when out_len equal
1, The previous code will not fill the buffer with any char.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 50af405..4f7c4ca 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -271,6 +271,10 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 		out_len = &console_tbuf_len;
 	}
 
+	/* handle special case: *out_len == 1*/
+	if (out)
+		**out = '\0';
+
 	for (; *format != 0; ++format) {
 		width = flags = 0;
 		if (use_tbuf)
-- 
2.40.1


