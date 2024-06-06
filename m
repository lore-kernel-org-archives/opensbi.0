From: Xiang W <wxjstz@126.com>
Date: Thu,  6 Jun 2024 17:17:13 +0800
Subject: [PATCH 1/4] include: sbi_utils: fixup fdt_get_address
In-Reply-To: <20240606091723.896477-1-wxjstz@126.com>
References: <20240606091723.896477-1-wxjstz@126.com>
Message-ID: <20240606091723.896477-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

root.next_arg1 will be NULL before sbi_domain_init, which will cause
fdt address to be NULL before sbi_domain is initialized. This patch
fixes this.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi_utils/fdt/fdt_helper.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index ab4a80f..67e6dc7 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -116,7 +116,9 @@ int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
 
 static inline void *fdt_get_address(void)
 {
-	return (void *)root.next_arg1;
+	if (root.next_arg1)
+		return (void *)root.next_arg1;
+	return sbi_scratch_thishart_arg1_ptr();
 }
 
 #endif /* __FDT_HELPER_H__ */
-- 
2.43.0


