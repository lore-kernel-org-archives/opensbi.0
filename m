From: Xiang W <wxjstz@126.com>
Date: Tue,  4 Jul 2023 21:12:01 +0800
Subject: [PATCH v7 04/11] lib: sbi: Add ' ' '\'' flags for print
In-Reply-To: <20230704131208.465914-1-wxjstz@126.com>
References: <20230704131208.465914-1-wxjstz@126.com>
Message-ID: <20230704131208.465914-5-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The space flag is used to add a space before positive numbers, and
apostrophe is used to print the thousand separator. Add code to
ignore these two flags

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_console.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 6ebdc44..b6b23bf 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -288,6 +288,10 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				case '0':
 					flags |= PAD_ZERO;
 					break;
+				case ' ':
+				case '\'':
+					/* Ignored flags, do nothing */
+					break;
 				default:
 					flags_done = true;
 					break;
-- 
2.40.1


