From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 10 Feb 2023 11:16:47 +0530
Subject: [PATCH v6 3/8] lib: sbi: Add sbi_ngets() function
In-Reply-To: <20230210054652.495628-1-apatel@ventanamicro.com>
References: <20230210054652.495628-1-apatel@ventanamicro.com>
Message-ID: <20230210054652.495628-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add new sbi_ngets() which help us read characters into a
physical memory location.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_console.h |  2 ++
 lib/sbi/sbi_console.c     | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
index dd6a905..3c1f5e5 100644
--- a/include/sbi/sbi_console.h
+++ b/include/sbi/sbi_console.h
@@ -37,6 +37,8 @@ unsigned long sbi_nputs(const char *str, unsigned long len);
 
 void sbi_gets(char *s, int maxwidth, char endchar);
 
+unsigned long sbi_ngets(char *str, unsigned long len);
+
 int __printf(2, 3) sbi_sprintf(char *out, const char *format, ...);
 
 int __printf(3, 4) sbi_snprintf(char *out, u32 out_sz, const char *format, ...);
diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 2f83a26..c734bc0 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -76,6 +76,21 @@ void sbi_gets(char *s, int maxwidth, char endchar)
 	*retval = '\0';
 }
 
+unsigned long sbi_ngets(char *str, unsigned long len)
+{
+	int ch;
+	unsigned long i;
+
+	for (i = 0; i < len; i++) {
+		ch = sbi_getc();
+		if (ch < 0)
+			break;
+		str[i] = ch;
+	}
+
+	return i;
+}
+
 #define PAD_RIGHT 1
 #define PAD_ZERO 2
 #define PAD_ALTERNATE 4
-- 
2.34.1


