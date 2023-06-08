From: Xiang W <wxjstz@126.com>
Date: Thu,  8 Jun 2023 15:29:53 +0800
Subject: [PATCH v4 03/13] lib: sbi: print not fill '0' when left-aligned
In-Reply-To: <20230608073003.1565710-1-wxjstz@126.com>
References: <20230608073003.1565710-1-wxjstz@126.com>
Message-ID: <20230608073003.1565710-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Left alignment and padding '0' should not exist at the same time,
this patch is not padded with 0 when left aligned.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 97ee328..b18f9c5 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -288,6 +288,8 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				if (!flags_done)
 					++format;
 			}
+			if (flags & PAD_RIGHT)
+				flags &= ~PAD_ZERO;
 			/* Get width */
 			width = 0;
 			for (; *format >= '0' && *format <= '9'; ++format) {
-- 
2.39.2


