From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 13 Jan 2021 15:36:57 +0530
Subject: [PATCH 3/3] include: sbi: Don't pack struct sbi_platform and
 sbi_platform_operations
In-Reply-To: <20210113100657.809754-1-anup.patel@wdc.com>
References: <20210113100657.809754-1-anup.patel@wdc.com>
Message-ID: <20210113100657.809754-4-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We don't need to pack struct sbi_platform and sbi_platform_operations
because GCC ensures member offsets match member data type irrespective
to the target system (RV32 or RV64). This also allows GCC to generate
more optimized instruction sequence when accessing members of struct
sbi_platform and struct sbi_platform_operations.

Reported-by: Paul Campbell <taniwha@gmail.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_platform.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index c252628..cc7e3ff 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -152,7 +152,7 @@ struct sbi_platform_operations {
 				   const struct sbi_trap_regs *regs,
 				   unsigned long *out_value,
 				   struct sbi_trap_info *out_trap);
-} __packed;
+};
 
 /** Platform default per-HART stack size for exception/interrupt handling */
 #define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE	8192
@@ -199,7 +199,7 @@ struct sbi_platform {
 	 * 2. HART id < SBI_HARTMASK_MAX_BITS
 	 */
 	const u32 *hart_index2id;
-} __packed;
+};
 
 /** Get pointer to sbi_platform for sbi_scratch pointer */
 #define sbi_platform_ptr(__s) \
-- 
2.25.1


