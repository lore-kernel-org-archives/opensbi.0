From: Carlos López <carlos.lopezr4096@gmail.com>
Date: Thu,  1 Aug 2024 14:48:11 +0200
Subject: [PATCH] lib: sbi: fwft: fix incorrect size passed to sbi_zalloc()
Message-ID: <20240801124811.5249-1-carlos.lopezr4096@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fwt_hart_state struct inciludes a flexible array member, so its
allocation size will be that of the struct itself, plus that of each
of the members in the array. When calculating this size, instead of
taking the size of the struct, the size of a pointer to it was taken,
which is incorrect. Luckily, this happenned to not produce memory
corruption because the size of the non-flexible members of the struct
is the same as the size of a pointer.

Signed-off-by: Carlos L?pez <carlos.lopezr4096@gmail.com>
---
 lib/sbi/sbi_fwft.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index f1ae915..ef881ef 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -251,7 +251,7 @@ int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot)
 
 	fhs = fwft_get_hart_state_ptr(scratch);
 	if (!fhs) {
-		fhs = sbi_zalloc(sizeof(fhs) + array_size(features) * sizeof(struct fwft_config));
+		fhs = sbi_zalloc(sizeof(*fhs) + array_size(features) * sizeof(struct fwft_config));
 		if (!fhs)
 			return SBI_ENOMEM;
 
-- 
2.39.2


