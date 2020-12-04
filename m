From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  4 Dec 2020 21:22:16 +0530
Subject: [PATCH v2 03/11] lib: sbi: Fix domain_count check in
 sbi_domain_finalize()
In-Reply-To: <20201204155224.733188-1-anup.patel@wdc.com>
References: <20201204155224.733188-1-anup.patel@wdc.com>
Message-ID: <20201204155224.733188-4-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The domain_count check in sbi_domain_finalize() for newly discovered
domain is incorrect and should be reversed.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 4c98a1b..ac920b8 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -371,7 +371,7 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 			 * Ensure that we have room for Domain Index to
 			 * HART ID mapping
 			 */
-			if (domain_count <= SBI_DOMAIN_MAX_INDEX)
+			if (SBI_DOMAIN_MAX_INDEX <= domain_count)
 				return SBI_ENOSPC;
 
 			/* Sanitize discovered domain */
-- 
2.25.1


