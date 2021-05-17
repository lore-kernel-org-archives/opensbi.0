From: Daniel Schaefer <daniel.schaefer@hpe.com>
Date: Mon, 17 May 2021 19:33:17 +0800
Subject: [PATCH v1 1/3] lib: utils: Add macro to libfdt_env.h for strncpy
In-Reply-To: <20210517113319.25855-1-daniel.schaefer@hpe.com>
References: <20210517113319.25855-1-daniel.schaefer@hpe.com>
Message-ID: <20210517113319.25855-2-daniel.schaefer@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just like 2845d2d2cf4fb74a89452ba223995aa4a118c07e

Cc: Abner Chang <abner.chang@hpe.com>
Cc: Anup Patel <Anup.Patel@wdc.com>
Signed-off-by: Daniel Schaefer <daniel.schaefer@hpe.com>
---
 lib/utils/libfdt/libfdt_env.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/utils/libfdt/libfdt_env.h b/lib/utils/libfdt/libfdt_env.h
index bc3e7588660a..f9d9c6783c52 100644
--- a/lib/utils/libfdt/libfdt_env.h
+++ b/lib/utils/libfdt/libfdt_env.h
@@ -31,6 +31,7 @@
 #define strchr		sbi_strchr
 #define strrchr		sbi_strrchr
 #define strcpy		sbi_strcpy
+#define strncpy		sbi_strncpy
 #define strcmp		sbi_strcmp
 #define strncmp		sbi_strncmp
 #define strlen		sbi_strlen
-- 
2.30.1


