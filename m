From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:42 -0700
Subject: [PATCH 01/16] lib: utils/fdt: Fix fdt_add_cpu_idle_states() prototype
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-2-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The function prototype should use the same parameter name as the
documentation and the function definition.

Fixes: 33bf9174602c ("lib: utils: Add fdt_add_cpu_idle_states() helper function")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/fdt/fdt_fixup.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
index ecd55a72..21a53011 100644
--- a/include/sbi_utils/fdt/fdt_fixup.h
+++ b/include/sbi_utils/fdt/fdt_fixup.h
@@ -30,7 +30,7 @@ struct sbi_cpu_idle_state {
  * @param states: array of idle state descriptions, ending with empty element
  * @return zero on success and -ve on failure
  */
-int fdt_add_cpu_idle_states(void *dtb, const struct sbi_cpu_idle_state *state);
+int fdt_add_cpu_idle_states(void *fdt, const struct sbi_cpu_idle_state *state);
 
 /**
  * Fix up the CPU node in the device tree
-- 
2.45.1


