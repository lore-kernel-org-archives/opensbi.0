From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 14 Oct 2022 08:32:41 +0800
Subject: [PATCH v4 03/14] include: sbi: Fix grammar in comment
In-Reply-To: <20221014003252.17765-1-peterlin@andestech.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
Message-ID: <20221014003252.17765-4-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix minor grammar issue in function description.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 include/sbi/sbi_domain.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index b90f59c..00662a1 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -175,7 +175,7 @@ int sbi_domain_register(struct sbi_domain *dom,
  * @param reg pointer to the memory region to be added
  *
  * @return 0 on success
- * @return SBI_EALREADY if memory region conflicts with existing
+ * @return SBI_EALREADY if memory region conflicts with the existing one
  * @return SBI_EINVAL otherwise
  */
 int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg);
-- 
2.34.1


