From: Xiang W <wxjstz@126.com>
Date: Tue,  6 Jun 2023 18:31:01 +0800
Subject: [PATCH v2 01/12] lib: sbi: Fix missing contine in print
In-Reply-To: <20230606103112.1218382-1-wxjstz@126.com>
References: <20230606103112.1218382-1-wxjstz@126.com>
Message-ID: <20230606103112.1218382-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Missing continue after print %lu %ld %lx ...

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 168dffd..1f0727c 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -370,6 +370,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 						     va_arg(args, long), 10, 1,
 						     width, flags, '0');
 				}
+				continue;
 			}
 			if (*format == 'c') {
 				/* char are converted to int then pushed on the stack */
-- 
2.39.2


