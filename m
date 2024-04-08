From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon,  8 Apr 2024 10:05:51 +0200
Subject: [PATCH 1/1] lib: sbi: missing values sbi_hart_ext[]
Message-ID: <20240408080551.50655-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In sbi_hart_get_extensions_str() we assume that sbi_hart_ext[] has
SBI_HART_EXT_MAX entries.

* Add the missing entries for sscsrind, ssccfg.
* Add a static assert to avoid future discrepancies.

Addresses-Coverity-ID: 1584994 Out-of-bounds read
Fixes: 6bb6b61c27eb ("lib: sbi: Add support for smcsrind and smcdeleg")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_hart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 3d13694..abec734 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -666,8 +666,13 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(sdtrig, SBI_HART_EXT_SDTRIG),
 	__SBI_HART_EXT_DATA(smcsrind, SBI_HART_EXT_SMCSRIND),
 	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
+	__SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
+	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
 };
 
+_Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
+	       "sbi_hart_ext[]: wrong number of entries");
+
 /**
  * Get the hart extensions in string format
  *
-- 
2.43.0


