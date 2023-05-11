From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 11 May 2023 18:11:04 +0200
Subject: [PATCH v4 3/3] lib: sbi: Apply register_extensions to vendor extensions
In-Reply-To: <20230511161104.115168-1-ajones@ventanamicro.com>
References: <20230511161104.115168-1-ajones@ventanamicro.com>
Message-ID: <20230511161104.115168-4-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The vendor extension ID range is large, but at runtime at most a
single ID will be available. Apply the register_extensions callback
to check if that single ID is available. When it isn't, don't
register the vendor extension at all. When it is, then narrow the
extension range to the single ID and register it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_ecall_vendor.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
index 8b8dab00c92d..a64a82a8a3b1 100644
--- a/lib/sbi/sbi_ecall_vendor.c
+++ b/lib/sbi/sbi_ecall_vendor.c
@@ -47,9 +47,26 @@ static int sbi_ecall_vendor_handler(unsigned long extid, unsigned long funcid,
 						out_val, out_trap);
 }
 
+struct sbi_ecall_extension ecall_vendor;
+
+static int sbi_ecall_vendor_register_extensions(void)
+{
+	unsigned long extid = sbi_ecall_vendor_id(), out_val;
+
+	if (sbi_ecall_vendor_probe(extid, &out_val) || !out_val)
+		return 0;
+
+	ecall_vendor.extid_start = extid;
+	ecall_vendor.extid_end = extid;
+	ecall_vendor.register_extensions = NULL;
+
+	return sbi_ecall_register_extension(&ecall_vendor);
+}
+
 struct sbi_ecall_extension ecall_vendor = {
 	.extid_start = SBI_EXT_VENDOR_START,
 	.extid_end = SBI_EXT_VENDOR_END,
 	.probe = sbi_ecall_vendor_probe,
 	.handle = sbi_ecall_vendor_handler,
+	.register_extensions = sbi_ecall_vendor_register_extensions,
 };
-- 
2.40.0


