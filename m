From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 13 Oct 2022 10:29:40 +0800
Subject: [PATCH v3 02/13] lib: sbi: Fix typo in comment
In-Reply-To: <20221013022951.5206-1-peterlin@andestech.com>
References: <20221013022951.5206-1-peterlin@andestech.com>
Message-ID: <20221013022951.5206-3-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

%s/is is/is

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Changes v2 -> v3
  - New patch
---
 lib/sbi/sbi_expected_trap.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_expected_trap.S b/lib/sbi/sbi_expected_trap.S
index a5ef26a..1f2d6b9 100644
--- a/lib/sbi/sbi_expected_trap.S
+++ b/lib/sbi/sbi_expected_trap.S
@@ -11,7 +11,7 @@
 #include <sbi/sbi_trap.h>
 
 	/*
-	 * We assume that faulting instruction is is 4-byte long and blindly
+	 * We assume that faulting instruction is 4-byte long and blindly
 	 * increment SEPC by 4.
 	 *
 	 * The trap info will be saved as follows:
-- 
2.34.1


