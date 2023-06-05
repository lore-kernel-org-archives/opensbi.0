From: Xiang W <wxjstz@126.com>
Date: Mon,  5 Jun 2023 14:16:08 +0800
Subject: [PATCH 5/9] lib: sbi: Add ' ' '\'' flags for print
In-Reply-To: <20230605061612.1030529-1-wxjstz@126.com>
References: <20230605061612.1030529-1-wxjstz@126.com>
Message-ID: <20230605061612.1030529-6-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index a616316..7f32f81 100644
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
2.39.2


