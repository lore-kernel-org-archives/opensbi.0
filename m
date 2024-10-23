From: Zhang Runmin <runmin.zhang@ingenic.com>
Date: Wed, 23 Oct 2024 15:20:49 +0800
Subject: include: sbi: Fix typo error
Message-ID: <26d04436b267d54453d1c055641dc0247edf8c36.1729667906.git.runmin.zhang@ingenic.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Zhang RunMin <runmin.zhang@ingenic.com>

Signed-off-by: Zhang RunMin <runmin.zhang@ingenic.com>
---
 include/sbi/sbi_scratch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 9ae4f89..f3c2175 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -22,7 +22,7 @@
 #define SBI_SCRATCH_FW_RW_OFFSET		(2 * __SIZEOF_POINTER__)
 /** Offset of fw_heap_offset member in sbi_scratch */
 #define SBI_SCRATCH_FW_HEAP_OFFSET		(3 * __SIZEOF_POINTER__)
-/** Offset of fw_heap_size_offset member in sbi_scratch */
+/** Offset of fw_heap_size member in sbi_scratch */
 #define SBI_SCRATCH_FW_HEAP_SIZE_OFFSET		(4 * __SIZEOF_POINTER__)
 /** Offset of next_arg1 member in sbi_scratch */
 #define SBI_SCRATCH_NEXT_ARG1_OFFSET		(5 * __SIZEOF_POINTER__)
-- 
2.25.1


