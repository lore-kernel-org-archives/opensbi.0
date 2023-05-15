From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 May 2023 11:34:46 +0200
Subject: [PATCH v5 7/7] lib: sbi: Document sbi_ecall_extension members
In-Reply-To: <20230515093446.73123-1-ajones@ventanamicro.com>
References: <20230515093446.73123-1-ajones@ventanamicro.com>
Message-ID: <20230515093446.73123-8-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the introduction of the register_extensions callback the
range members (extid_start and extid_end) may now change and it
has become a bit subtle as to when a probe function should be
implemented. Document all the members and their relationship to
the register_extensions callback.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_ecall.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index fac26429cf5d..3cb25ae80fb0 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -21,11 +21,46 @@ struct sbi_trap_regs;
 struct sbi_trap_info;
 
 struct sbi_ecall_extension {
+	/* head is used by the extension list */
 	struct sbi_dlist head;
+	/*
+	 * extid_start and extid_end specify the range for this extension.
+	 * As the initial range may be wider than the valid runtime range,
+	 * the register_extensions callback is responsible for narrowing
+	 * the range before other callbacks may be invoked.
+	 */
 	unsigned long extid_start;
 	unsigned long extid_end;
+	/*
+	 * register_extensions
+	 *
+	 * Calls sbi_ecall_register_extension() one or more times to
+	 * register extension ID range(s) which should be handled by this
+	 * extension. More than one sbi_ecall_extension struct and
+	 * sbi_ecall_register_extension() call is necessary when the supported
+	 * extension ID ranges have gaps. Additionally, extension availability
+	 * must be checked before registering, which means, when this callback
+	 * returns, only valid extension IDs from the initial range, which are
+	 * also available, have been registered.
+	 */
 	int (* register_extensions)(void);
+	/*
+	 * probe
+	 *
+	 * Implements the Base extension's probe function for the extension. As
+	 * the register_extensions callback ensures that no other extension
+	 * callbacks will be invoked when the extension is not available, then
+	 * probe can never fail. However, an extension may choose to set out_val
+	 * to a nonzero value other than one. In those cases, it should implement
+	 * this callback.
+	 */
 	int (* probe)(unsigned long extid, unsigned long *out_val);
+	/*
+	 * handle
+	 *
+	 * This is the extension handler. register_extensions ensures it is
+	 * never invoked with an invalid or unavailable extension ID.
+	 */
 	int (* handle)(unsigned long extid, unsigned long funcid,
 		       const struct sbi_trap_regs *regs,
 		       unsigned long *out_val,
-- 
2.40.0


