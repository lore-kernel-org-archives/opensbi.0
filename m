From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 12 Apr 2021 17:46:11 +0530
Subject: [PATCH v2 1/7] lib: sbi: Domains can be registered only before
 finalizing domains
In-Reply-To: <20210412121617.933493-1-anup.patel@wdc.com>
References: <20210412121617.933493-1-anup.patel@wdc.com>
Message-ID: <20210412121617.933493-2-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The domains are boot-time system-level partitions so we should
allow platform support to register domains only before hart
domain assignments are finalized.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Xiang W <wxjstz@126.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 lib/sbi/sbi_domain.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 195c941..2849241 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -19,8 +19,8 @@
 
 struct sbi_domain *hartid_to_domain_table[SBI_HARTMASK_MAX_BITS] = { 0 };
 struct sbi_domain *domidx_to_domain_table[SBI_DOMAIN_MAX_INDEX] = { 0 };
-
 static u32 domain_count = 0;
+static bool domain_finalized = false;
 
 static struct sbi_hartmask root_hmask = { 0 };
 
@@ -376,7 +376,8 @@ int sbi_domain_register(struct sbi_domain *dom,
 	u32 cold_hartid = current_hartid();
 	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 
-	if (!dom || !assign_mask)
+	/* Sanity checks */
+	if (!dom || !assign_mask || domain_finalized)
 		return SBI_EINVAL;
 
 	/* Check if domain already discovered */
@@ -490,6 +491,12 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 		}
 	}
 
+	/*
+	 * Set the finalized flag so that the root domain
+	 * regions can't be changed.
+	 */
+	domain_finalized = true;
+
 	return 0;
 }
 
-- 
2.25.1


