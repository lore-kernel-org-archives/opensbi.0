From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 10 Feb 2023 11:16:46 +0530
Subject: [PATCH v6 2/8] lib: sbi: Add sbi_nputs() function
In-Reply-To: <20230210054652.495628-1-apatel@ventanamicro.com>
References: <20230210054652.495628-1-apatel@ventanamicro.com>
Message-ID: <20230210054652.495628-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add new sbi_nputs() which help us print a fixed number of characters
from a physical memory location.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_console.h |  2 ++
 lib/sbi/sbi_console.c     | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
index e15b55d..dd6a905 100644
--- a/include/sbi/sbi_console.h
+++ b/include/sbi/sbi_console.h
@@ -33,6 +33,8 @@ void sbi_putc(char ch);
 
 void sbi_puts(const char *str);
 
+unsigned long sbi_nputs(const char *str, unsigned long len);
+
 void sbi_gets(char *s, int maxwidth, char endchar);
 
 int __printf(2, 3) sbi_sprintf(char *out, const char *format, ...);
diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index bb6e1ef..2f83a26 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -51,6 +51,18 @@ void sbi_puts(const char *str)
 	spin_unlock(&console_out_lock);
 }
 
+unsigned long sbi_nputs(const char *str, unsigned long len)
+{
+	unsigned long i;
+
+	spin_lock(&console_out_lock);
+	for (i = 0; i < len; i++)
+		sbi_putc(str[i]);
+	spin_unlock(&console_out_lock);
+
+	return i;
+}
+
 void sbi_gets(char *s, int maxwidth, char endchar)
 {
 	int ch;
-- 
2.34.1


