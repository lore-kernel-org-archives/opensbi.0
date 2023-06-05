From: Xiang W <wxjstz@126.com>
Date: Mon,  5 Jun 2023 14:16:12 +0800
Subject: [PATCH 9/9] lib: sbi: Simplify prints
In-Reply-To: <20230605061612.1030529-1-wxjstz@126.com>
References: <20230605061612.1030529-1-wxjstz@126.com>
Message-ID: <20230605061612.1030529-10-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When doing width = width - strlen(string) in prints there is no need
to consider the case that witdh may be less than 0. This is because
the code to do filling needs to be executed under the condition that
width > 0.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 6f714f0..824ff6e 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -151,24 +151,11 @@ static void printc(char **out, u32 *out_len, char ch)
 static int prints(char **out, u32 *out_len, const char *string, int width,
 		  int flags)
 {
-	int pc	     = 0;
-	char padchar = ' ';
-
-	if (width > 0) {
-		int len = 0;
-		const char *ptr;
-		for (ptr = string; *ptr; ++ptr)
-			++len;
-		if (len >= width)
-			width = 0;
-		else
-			width -= len;
-		if (flags & PAD_ZERO)
-			padchar = '0';
-	}
+	int pc = 0;
+	width -= sbi_strlen(string);
 	if (!(flags & PAD_RIGHT)) {
 		for (; width > 0; --width) {
-			printc(out, out_len, padchar);
+			printc(out, out_len, flags & PAD_ZERO ? '0' : ' ');
 			++pc;
 		}
 	}
@@ -177,7 +164,7 @@ static int prints(char **out, u32 *out_len, const char *string, int width,
 		++pc;
 	}
 	for (; width > 0; --width) {
-		printc(out, out_len, padchar);
+		printc(out, out_len, ' ');
 		++pc;
 	}
 
-- 
2.39.2


