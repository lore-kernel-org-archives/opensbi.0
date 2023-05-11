From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 11 May 2023 18:11:03 +0200
Subject: [PATCH v4 2/3] lib: sbi: Introduce register_extensions extension callback
In-Reply-To: <20230511161104.115168-1-ajones@ventanamicro.com>
References: <20230511161104.115168-1-ajones@ventanamicro.com>
Message-ID: <20230511161104.115168-3-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The register_extensions callback is called from sbi_ecall_init() for
any extension that provides it. It's purpose is to register the
extension with one or more sbi_ecall_register_extension() calls after
possibly narrowing the range of extension IDs that should be handled.
More than one call of sbi_ecall_register_extension() is necessary
when the supported extension ID ranges have gaps. Additionally, when
an extension may not be available and has a probe function, then the
probe function should be consulted as to whether or not the extension
should be registered. In summary, when register_extensions() returns,
only valid extension IDs from the initial range, which are also
available, have been registered.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_ecall.h | 1 +
 lib/sbi/sbi_ecall.c     | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index ff9bf8e2b435..fac26429cf5d 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -24,6 +24,7 @@ struct sbi_ecall_extension {
 	struct sbi_dlist head;
 	unsigned long extid_start;
 	unsigned long extid_end;
+	int (* register_extensions)(void);
 	int (* probe)(unsigned long extid, unsigned long *out_val);
 	int (* handle)(unsigned long extid, unsigned long funcid,
 		       const struct sbi_trap_regs *regs,
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 5a301fb7d403..1c4a26fde438 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -154,8 +154,12 @@ int sbi_ecall_init(void)
 
 	for (i = 0; i < sbi_ecall_exts_size; i++) {
 		ext = sbi_ecall_exts[i];
-		if (ext->extid_start != ext->extid_end || !ext->probe ||
-		    (!ext->probe(ext->extid_end, &out_val) && out_val)) {
+		if (ext->register_extensions) {
+			ret = ext->register_extensions();
+			if (ret)
+				return ret;
+		} else if (ext->extid_start != ext->extid_end || !ext->probe ||
+			   (!ext->probe(ext->extid_end, &out_val) && out_val)) {
 			ret = sbi_ecall_register_extension(ext);
 			if (ret)
 				return ret;
-- 
2.40.0


