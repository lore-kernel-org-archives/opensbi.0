From: Xiang W <wxjstz@126.com>
Date: Thu,  6 Jun 2024 17:17:14 +0800
Subject: [PATCH 2/4] lib: sbi: Add domains_init to sbi_console_device
In-Reply-To: <20240606091723.896477-1-wxjstz@126.com>
References: <20240606091723.896477-1-wxjstz@126.com>
Message-ID: <20240606091723.896477-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To initialize the console before the domain is initialized, an
interface needs to be reserved for adding the mem region to the
root domain after the console is initialized.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_console.h |  3 +++
 lib/sbi/sbi_domain.c      | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
index 0979765..5c7eae7 100644
--- a/include/sbi/sbi_console.h
+++ b/include/sbi/sbi_console.h
@@ -24,6 +24,9 @@ struct sbi_console_device {
 
 	/** Read a character from the console input */
 	int (*console_getc)(void);
+
+	/* This function is used to add memregion to the root domain. */
+	int (*domains_init)(void);
 };
 
 #define __printf(a, b) __attribute__((format(printf, a, b)))
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 374ac36..eb392b7 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -696,6 +696,16 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 	struct sbi_domain *dom;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
+	/* Initialize and populate domains for the console */
+	if (sbi_console_get_device()->domains_init) {
+		rc = sbi_console_get_device()->domains_init();
+		if (rc) {
+			sbi_printf("%s: console domains_init() failed (error %d)\n",
+			   __func__, rc);
+			return rc;
+		}
+	}
+
 	/* Initialize and populate domains for the platform */
 	rc = sbi_platform_domains_init(plat);
 	if (rc) {
-- 
2.43.0


