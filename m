From: Xiang W <wxjstz@126.com>
Date: Wed,  5 Jul 2023 22:36:54 +0800
Subject: [PATCH v8 02/11] lib: sbi: print not fill '0' when left-aligned
In-Reply-To: <20230705143703.635254-1-wxjstz@126.com>
References: <20230705143703.635254-1-wxjstz@126.com>
Message-ID: <20230705143703.635254-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Left alignment and padding '0' should not exist at the same time,
this patch skips padding.

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_console.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index d87b5c2..03ee05a 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -288,6 +288,8 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				if (!flags_done)
 					++format;
 			}
+			if (flags & PAD_RIGHT)
+				flags &= ~PAD_ZERO;
 			/* Get width */
 			for (; *format >= '0' && *format <= '9'; ++format) {
 				width *= 10;
-- 
2.40.1


