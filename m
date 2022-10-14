From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 14 Oct 2022 08:32:39 +0800
Subject: [PATCH v4 01/14] include: sbi: Fix typo in comment
In-Reply-To: <20221014003252.17765-1-peterlin@andestech.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
Message-ID: <20221014003252.17765-2-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

%s/Priviledge/Privilege

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_scratch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 2f6f0a1..40a3bc9 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -57,7 +57,7 @@ struct sbi_scratch {
 	unsigned long next_arg1;
 	/** Address of next booting stage for this HART */
 	unsigned long next_addr;
-	/** Priviledge mode of next booting stage for this HART */
+	/** Privilege mode of next booting stage for this HART */
 	unsigned long next_mode;
 	/** Warm boot entry point address for this HART */
 	unsigned long warmboot_addr;
-- 
2.34.1


