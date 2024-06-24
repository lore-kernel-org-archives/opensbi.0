From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 24 Jun 2024 12:29:09 +0200
Subject: [PATCH 2/2] lib: sbi: fwft: return SBI_EINVAL rather than SBI_ERR_INVALID_PARAM
In-Reply-To: <20240624102918.1410501-1-cleger@rivosinc.com>
References: <20240624102918.1410501-1-cleger@rivosinc.com>
Message-ID: <20240624102918.1410501-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Error code returned by the ecall handles should use the defines from
sbi_ecall_interface.h rather than sbi_error.h.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_fwft.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index 595819b..f1ae915 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -196,7 +196,7 @@ int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
 		return ret;
 
 	if ((flags & ~SBI_FWFT_SET_FLAG_LOCK) != 0)
-		return SBI_ERR_INVALID_PARAM;
+		return SBI_EINVAL;
 
 	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
 		return SBI_EDENIED;
-- 
2.45.2


