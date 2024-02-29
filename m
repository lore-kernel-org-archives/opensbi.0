From: cmax@mailbox.org <cmax@mailbox.org>
Date: Thu, 29 Feb 2024 17:02:17 +0100
Subject: [PATCH v2] lib: sbi_domain: Fix PMP condition for addresses
In-Reply-To: <272de5922603af4a3080eba37b2368bb8b3ead64.camel@126.com>
References: <272de5922603af4a3080eba37b2368bb8b3ead64.camel@126.com>
Message-ID: <20240229160432.6230-1-cmax@mailbox.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: max <cmax@mailbox.org>

In order to put an address/size into an NAPOT PMP region, the fw_start
address needs to be aligned to the fw_rw_offset. Since the PMP address
is already aligned to 4 byte by design, we have two more bits available.

Example:
fw_start: 0x80040000
fw_rw_offset:  0x00040000
PMP address: 0x80040000 | (0x00040000 >> 2)
fw_rw_offset is valid, but not in the current implementation

Signed-off-by: max <cmax@mailbox.org>
---
I updated to commit-msg to be more clear. I hope that clears it up.
This is my first email patch, so I probably made some mistakes.

kind regards,
Max

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
2.44.0


