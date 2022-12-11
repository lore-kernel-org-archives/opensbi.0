From: Bin Meng <bmeng@tinylab.org>
Date: Sun, 11 Dec 2022 14:54:22 +0800
Subject: [PATCH v3 3/5] lib: utils/irqchip: plic: Fix the off-by-one error in plic_context_init()
In-Reply-To: <20221211065424.806478-1-bmeng@tinylab.org>
References: <20221211065424.806478-1-bmeng@tinylab.org>
Message-ID: <20221211065424.806478-3-bmeng@tinylab.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The number of interrupt enable register in words was once correct,
but was wrongly changed to have an off-by-one error since
commit 8c362e7d065e ("lib: irqchip/plic: Factor out a context init function").

Fixes: 8c362e7d065e ("lib: irqchip/plic: Factor out a context init function")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Anup Patel <anup@brainfault.org>

---

(no changes since v2)

Changes in v2:
- new patch: lib: utils/irqchip: plic: Fix the off-by-one error in plic_context_init()

 lib/utils/irqchip/plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index dca5678..568f814 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -127,7 +127,7 @@ int plic_context_init(const struct plic_data *plic, int context_id,
 	if (!plic || context_id < 0)
 		return SBI_EINVAL;
 
-	ie_words = (plic->num_src + 31) / 32;
+	ie_words = plic->num_src / 32 + 1;
 	ie_value = enable ? 0xffffffffU : 0U;
 
 	for (u32 i = 0; i < ie_words; i++)
-- 
2.34.1


