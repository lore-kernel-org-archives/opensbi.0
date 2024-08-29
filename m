From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 29 Aug 2024 12:46:23 -0700
Subject: [PATCH 1/2] include: sbi_domain: Fix incorrect comments
Message-ID: <20240829194634.3644683-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These comments are inaccurate as of commit db56341dfa1f ("lib: sbi:
Allow platforms to provide root domain memory regions"), which modified
root domain registration to go through sbi_domain_register() like other
domains.

Fixes: db56341dfa1f ("lib: sbi: Allow platforms to provide root domain memory regions")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_domain.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index a6e99c63..34ebd39d 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -163,16 +163,9 @@ struct sbi_domain_memregion {
 
 /** Representation of OpenSBI domain */
 struct sbi_domain {
-	/**
-	 * Logical index of this domain
-	 * Note: This set by sbi_domain_finalize() in the coldboot path
-	 */
+	/** Logical index of this domain */
 	u32 index;
-	/**
-	 * HARTs assigned to this domain
-	 * Note: This set by sbi_domain_init() and sbi_domain_finalize()
-	 * in the coldboot path
-	 */
+	/** HARTs assigned to this domain */
 	struct sbi_hartmask assigned_harts;
 	/** Spinlock for accessing assigned_harts */
 	spinlock_t assigned_harts_lock;
-- 
2.45.1


