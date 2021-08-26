From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Thu, 26 Aug 2021 15:24:18 +0530
Subject: [PATCH] lib: sbi: Correct typo in faults delegation CSR name
Message-ID: <20210826095417.135448-1-rpathak@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Correcting the name of faults delegation CSR
%s/mfdeleg/medeleg

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 lib/sbi/sbi_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_platform.c b/lib/sbi/sbi_platform.c
index e8b94a3..99bd8f5 100644
--- a/lib/sbi/sbi_platform.c
+++ b/lib/sbi/sbi_platform.c
@@ -20,7 +20,7 @@ static inline char *sbi_platform_feature_id2string(unsigned long feature)
 
 	switch (feature) {
 	case SBI_PLATFORM_HAS_MFAULTS_DELEGATION:
-		fstr = "mfdeleg";
+		fstr = "medeleg";
 		break;
 	default:
 		break;
-- 
2.25.1


