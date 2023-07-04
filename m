From: Xiang W <wxjstz@126.com>
Date: Tue,  4 Jul 2023 21:12:06 +0800
Subject: [PATCH v7 09/11] lib: sbi: Fix printc
In-Reply-To: <20230704131208.465914-1-wxjstz@126.com>
References: <20230704131208.465914-1-wxjstz@126.com>
Message-ID: <20230704131208.465914-10-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Because *out needs to reserve a byte to hold '\0', no more characters
should be added to the buffer when *out has one byte left, and the
buffer size *out_len should not be modified. this patch prevents
the correction of *out_len when *out_len is 1.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 43870b8..af5e94b 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -142,10 +142,9 @@ static void printc(char **out, u32 *out_len, char ch)
 	if (!out_len || *out_len > 1) {
 		*(*out)++ = ch;
 		**out = '\0';
+		if (out_len)
+			--(*out_len);
 	}
-
-	if (out_len && *out_len > 0)
-		--(*out_len);
 }
 
 static int prints(char **out, u32 *out_len, const char *string, int width,
-- 
2.40.1


