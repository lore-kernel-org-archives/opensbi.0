From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Tue, 27 Dec 2022 12:01:29 +0100
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
Message-ID: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

plic_priority_save() and plic_priority_restore() access indexes 1 to num of
the passed array. Avoid a buffer overrun by increasing the used array size
by one.

Addresses-Coverity-ID: 1530251 ("Out-of-bounds access")
Addresses-Coverity-ID: 1530252 ("Out-of-bounds access")
Fixes: 8509e46ca63a ("lib: utils/irqchip: plic: Ensure no out-of-bound access in priority save/restore helpers")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 platform/generic/allwinner/sun20i-d1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 1da9e5b..9891ad0 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -72,7 +72,7 @@ static void sun20i_d1_csr_restore(void)
 #define PLIC_SOURCES			176
 #define PLIC_IE_WORDS			((PLIC_SOURCES + 31) / 32)
 
-static u8 plic_priority[PLIC_SOURCES];
+static u8 plic_priority[PLIC_SOURCES + 1];
 static u32 plic_sie[PLIC_IE_WORDS];
 static u32 plic_threshold;
 
-- 
2.37.2


