From: Inochi Amaoto <inochiama@gmail.com>
Date: Mon, 16 Sep 2024 15:25:14 +0800
Subject: [PATCH 1/2] platform: ensure enough heap size with debug triggers extension
In-Reply-To: <20240916072405.628158-1-inochiama@gmail.com>
References: <20240916072405.628158-1-inochiama@gmail.com>
Message-ID: <20240916072516.628461-1-inochiama@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

DBTR introduce a big heap allocation to store hart state, this is
allocated percpu and needs big space when CPU number is high.

Increase the percpu part to fix this problem, and decrease the
fixed part to avoid too big heap size.

Fixes: 97f234f (lib: sbi: Introduce the SBI debug triggers extension support)
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 include/sbi/sbi_platform.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 7b3ac4b..d1c556c 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -152,7 +152,7 @@ struct sbi_platform_operations {
 
 /** Platform default heap size */
 #define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)	\
-					(0x8000 + 0x800 * (__num_hart))
+					(0x4000 + 0x2000 * (__num_hart))
 
 /** Representation of a platform */
 struct sbi_platform {
-- 
2.46.1


