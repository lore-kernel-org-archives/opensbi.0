From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Fri, 21 Mar 2025 08:14:50 +0800
Subject: [PATCH] lib: sbi: Handle length of extension name string exceed buffer size error
Message-ID: <20250321001450.11189-1-jimmy.ho@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

print error message and turncat the string when length
of extension name string exceed buffer size

Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
Reviewd-by: Nick Hu <nick.hu@sifive.com>
Reviewd-by: Zong Li <zong.li@sifive.com>
---
 lib/sbi/sbi_hart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 15070021..0acf6063 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -743,6 +743,10 @@ void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
 	sbi_memset(extensions_str, 0, nestr);
 
 	for_each_set_bit(ext, hfeatures->extensions, SBI_HART_EXT_MAX) {
+		if (offset + sbi_strlen(sbi_hart_ext[ext].name) + 1 > nestr) {
+			sbi_printf("%s:extension name is longer than buffer (error)\n", __func__);
+			break;
+		}
 		sbi_snprintf(extensions_str + offset,
 				 nestr - offset,
 				 "%s,", sbi_hart_ext[ext].name);
-- 
2.43.2


