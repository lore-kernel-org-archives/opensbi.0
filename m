From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 25 Mar 2025 11:26:10 +0100
Subject: [PATCH v2 3/7] lib: sbi: sse: Return SBI_EDENIED for read only parameters.
In-Reply-To: <20250325102615.1587953-1-cleger@rivosinc.com>
References: <20250325102615.1587953-1-cleger@rivosinc.com>
Message-ID: <20250325102615.1587953-4-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SSE specification did specified that read only parameters should
return SBI_EBADRANGE but was modified recently to return SBI_EDENIED.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_sse.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 47166456..35bb6564 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -388,7 +388,7 @@ static int sse_event_set_hart_id_check(struct sbi_sse_event *e,
 	struct sbi_domain *hd = sbi_domain_thishart_ptr();
 
 	if (!sse_event_is_global(e))
-		return SBI_EBAD_RANGE;
+		return SBI_EDENIED;
 
 	if (!sbi_domain_is_assigned_hart(hd, sbi_hartid_to_hartindex(hartid)))
 		return SBI_EINVAL;
@@ -444,7 +444,13 @@ static int sse_event_set_attr_check(struct sbi_sse_event *e, uint32_t attr_id,
 
 		return SBI_OK;
 	default:
-		return SBI_EBAD_RANGE;
+		/*
+		 * Attribute range validity was already checked by
+		 * sbi_sse_attr_check(). If we end up here, attribute was not
+		 * handled by the above 'case' statements and thus it is
+		 * read-only.
+		 */
+		return SBI_EDENIED;
 	}
 }
 
-- 
2.47.2


