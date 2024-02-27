From: cmax@mailbox.org <cmax@mailbox.org>
Date: Tue, 27 Feb 2024 21:07:43 +0100
Subject: [PATCH] lib: sbi_domain: Fix PMP condition for addresses
Message-ID: <20240227200743.22661-1-cmax@mailbox.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: max <cmax@mailbox.org>

In order to put an address/size into an NAPOT PMP region, the address
needs to be aligned to the size shifted two to the right.

Example:
fw_start: 0x80040000
fw_size:  0x00040000
PMP address: 0x80040000 | (0x00040000 >> 2)
fw_size is valid, but not in the current implementation

Signed-off-by: max <cmax@mailbox.org>
---
 lib/sbi/sbi_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 4e9f742..94ee717 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -749,7 +749,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 		return SBI_EINVAL;
 	}
 
-	if ((scratch->fw_start & (scratch->fw_rw_offset - 1)) != 0) {
+	if ((scratch->fw_start & ((scratch->fw_rw_offset >> 2) - 1)) != 0) {
 		sbi_printf("%s: fw_start and fw_rw_offset not aligned\n",
 			   __func__);
 		return SBI_EINVAL;
-- 
2.43.0


