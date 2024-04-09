From: Clément Léger <cleger@rivosinc.com>
Date: Tue,  9 Apr 2024 12:02:07 +0200
Subject: [PATCH 6/7] lib: sbi: sse: use PRV_S instead of hardcoded value for mode
In-Reply-To: <20240409100216.263256-1-cleger@rivosinc.com>
References: <20240409100216.263256-1-cleger@rivosinc.com>
Message-ID: <20240409100216.263256-7-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rather then passing 1 to sbi_domain_check_addr_range() for supervisor
mode, use PRV_S.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 8b448bf..85137c2 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -837,8 +837,8 @@ int sbi_sse_attr_check(uint32_t base_attr_id, uint32_t attr_count,
 		return SBI_EINVALID_ADDR;
 
 	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(), phys_lo,
-					 sizeof(unsigned long) * attr_count, 1,
-					 access))
+					 sizeof(unsigned long) * attr_count,
+					 PRV_S, access))
 		return SBI_EINVALID_ADDR;
 
 	return SBI_OK;
-- 
2.43.0


