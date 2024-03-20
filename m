From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 20 Mar 2024 15:50:43 +0100
Subject: [PATCH] lib: sbi: Add missing sscrind and sscfg extensions in sbi_hart_ext[]
Message-ID: <20240320145051.1459406-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_hart_ext[] array is missing these two extensions ids. It is
expected that this array contains all the extensions declaration at the
same index of the SBI_HART_EXT_* define. Without this, when adding a new
extension, there is a mismatch between ids and extension names and it
can even display corrupted extension names.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

---
 lib/sbi/sbi_hart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 3d13694..d68e2a0 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -666,6 +666,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(sdtrig, SBI_HART_EXT_SDTRIG),
 	__SBI_HART_EXT_DATA(smcsrind, SBI_HART_EXT_SMCSRIND),
 	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
+	__SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
+	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
 };
 
 /**
-- 
2.43.0


