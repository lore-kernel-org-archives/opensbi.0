From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 11 May 2023 18:11:02 +0200
Subject: [PATCH v4 1/3] lib: sbi: Don't register unavailable single ID extensions
In-Reply-To: <20230511161104.115168-1-ajones@ventanamicro.com>
References: <20230511161104.115168-1-ajones@ventanamicro.com>
Message-ID: <20230511161104.115168-2-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When an extension provides a probe callback we can check it at
init time to see if we should register the extension at all.
However, this is only possible for single ID extensions since
attempting to probe all IDs of a potentially very large range
doesn't make sense.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_ecall.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 76a1ae9ab733..5a301fb7d403 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -148,15 +148,18 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
 
 int sbi_ecall_init(void)
 {
-	int ret;
 	struct sbi_ecall_extension *ext;
-	unsigned long i;
+	unsigned long out_val, i;
+	int ret;
 
 	for (i = 0; i < sbi_ecall_exts_size; i++) {
 		ext = sbi_ecall_exts[i];
-		ret = sbi_ecall_register_extension(ext);
-		if (ret)
-			return ret;
+		if (ext->extid_start != ext->extid_end || !ext->probe ||
+		    (!ext->probe(ext->extid_end, &out_val) && out_val)) {
+			ret = sbi_ecall_register_extension(ext);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return 0;
-- 
2.40.0


