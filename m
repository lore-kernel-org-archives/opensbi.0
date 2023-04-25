From: Xiang W <wxjstz@126.com>
Date: Tue, 25 Apr 2023 16:56:24 +0800
Subject: [PATCH 2/2] lib: sbi: Simplify sbi_ipi_process remove goto
In-Reply-To: <20230425085625.465921-1-wxjstz@126.com>
References: <20230425085625.465921-1-wxjstz@126.com>
Message-ID: <20230425085625.465921-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_ipi.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index ba83f24..ad09154 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -223,14 +223,11 @@ void sbi_ipi_process(void)
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
 	while (ipi_type) {
-		if (!(ipi_type & 1UL))
-			goto skip;
-
-		ipi_ops = ipi_ops_array[ipi_event];
-		if (ipi_ops && ipi_ops->process)
-			ipi_ops->process(scratch);
-
-skip:
+		if (ipi_type & 1UL) {
+			ipi_ops = ipi_ops_array[ipi_event];
+			if (ipi_ops && ipi_ops->process)
+				ipi_ops->process(scratch);
+		}
 		ipi_type = ipi_type >> 1;
 		ipi_event++;
 	}
-- 
2.39.2


