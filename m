From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Mon, 21 Jun 2021 21:37:54 +0200
Subject: [PATCH 1/1] lib: sign conflict in wake_coldboot_harts()
Message-ID: <20210621193754.31845-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Compiling wake_coldboot_harts() with GCC 11 and -Wextra yields:

lib/sbi/sbi_init.c:208:27:
error: comparison of integer expressions of different signedness:
?int? and ?u32? {aka ?unsigned int?} [-Werror=sign-compare]
  208 |         for (int i = 0; i <= sbi_scratch_last_hartid(); i++) {
      |                           ^~

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 lib/sbi/sbi_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index b158314..e396d95 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -205,7 +205,7 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 	spin_lock(&coldboot_lock);

 	/* Send an IPI to all HARTs waiting for coldboot */
-	for (int i = 0; i <= sbi_scratch_last_hartid(); i++) {
+	for (u32 i = 0; i <= sbi_scratch_last_hartid(); i++) {
 		if ((i != hartid) &&
 		    sbi_hartmask_test_hart(i, &coldboot_wait_hmask))
 			sbi_ipi_raw_send(i);
--
2.30.2


