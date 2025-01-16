From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 16 Jan 2025 21:26:47 +0530
Subject: [PATCH 08/12] include: sbi_utils: Include mailbox.h in rpmi_mailbox.h header
In-Reply-To: <20250116155651.103782-1-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
Message-ID: <20250116155651.103782-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The rpmi_mailbox.h uses structures defined in mailbox.h so let's
include mailbox.h in rpmi_mailbox.h header.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_mailbox.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sbi_utils/mailbox/rpmi_mailbox.h b/include/sbi_utils/mailbox/rpmi_mailbox.h
index 61af51a8..a23ad8ca 100644
--- a/include/sbi_utils/mailbox/rpmi_mailbox.h
+++ b/include/sbi_utils/mailbox/rpmi_mailbox.h
@@ -11,6 +11,7 @@
 #define __RPMI_MAILBOX_H__
 
 #include <sbi/sbi_error.h>
+#include <sbi_utils/mailbox/mailbox.h>
 #include <sbi_utils/mailbox/rpmi_msgprot.h>
 
 #define rpmi_u32_count(__var)	(sizeof(__var) / sizeof(u32))
-- 
2.43.0


