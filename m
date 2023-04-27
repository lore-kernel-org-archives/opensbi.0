From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 27 Apr 2023 11:41:38 +0200
Subject: [PATCH v2] lib: sbi: Ensure SBI extension is available
Message-ID: <20230427094138.349029-1-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure attempts to invoke SBI extension functions fail with
SBI_ERR_NOT_SUPPORTED when the extension's probe function has
reported that the extension is not available. By adding a new status
member to the extension, which has three states (uninitialized,
available, unavailable), we can ensure that the probe functions of
single ID extensions, i.e.  extid_start == extid_end, are only
invoked once, lazily, upon first use. Extensions that have multiple
IDs cannot use a single status field to avoid making probe calls, as
probe functions are extension ID specific. It's expected that these
multi-ID extension probe functions implement their own optimizations
in order to ensure extension lookups are fast.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_ecall.h | 14 ++++++++++++++
 lib/sbi/sbi_ecall.c     | 26 ++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index ff9bf8e2b435..9793019047e7 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -20,10 +20,24 @@
 struct sbi_trap_regs;
 struct sbi_trap_info;
 
+/*
+ * sbi_ext_status is used to optimize lookups of extensions which have
+ * single extension IDs, i.e. extid_start == extid_end. The status is
+ * set after the first call of the extension's probe function (if it
+ * has one) in order to avoid repeating the probe call on later lookups.
+ * Extensions with more than one ID should ensure their probe functions
+ * are fast, perhaps by caching responses.
+ */
+enum sbi_ext_status {
+	SBI_EXT_AVAILABLE = 1,
+	SBI_EXT_UNAVAILABLE,
+};
+
 struct sbi_ecall_extension {
 	struct sbi_dlist head;
 	unsigned long extid_start;
 	unsigned long extid_end;
+	enum sbi_ext_status status;
 	int (* probe)(unsigned long extid, unsigned long *out_val);
 	int (* handle)(unsigned long extid, unsigned long funcid,
 		       const struct sbi_trap_regs *regs,
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 76a1ae9ab733..ad27b9b7e5cb 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -42,16 +42,34 @@ static SBI_LIST_HEAD(ecall_exts_list);
 
 struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid)
 {
-	struct sbi_ecall_extension *t, *ret = NULL;
+	struct sbi_ecall_extension *t;
+	unsigned long out_val;
 
 	sbi_list_for_each_entry(t, &ecall_exts_list, head) {
+		bool use_status = t->extid_start == t->extid_end;
+
 		if (t->extid_start <= extid && extid <= t->extid_end) {
-			ret = t;
-			break;
+			if (use_status) {
+				if (t->status == SBI_EXT_AVAILABLE)
+					return t;
+				if (t->status == SBI_EXT_UNAVAILABLE)
+					return NULL;
+			}
+
+			if (t->probe && (t->probe(extid, &out_val) || !out_val)) {
+				if (use_status)
+					t->status = SBI_EXT_UNAVAILABLE;
+				return NULL;
+			}
+
+			if (use_status)
+				t->status = SBI_EXT_AVAILABLE;
+
+			return t;
 		}
 	}
 
-	return ret;
+	return NULL;
 }
 
 int sbi_ecall_register_extension(struct sbi_ecall_extension *ext)
-- 
2.39.2


