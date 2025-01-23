From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 23 Jan 2025 17:05:34 +0100
Subject: [PATCH 1/3] include: sbi: Add SBI_ERR_DENIED_LOCKED
In-Reply-To: <20250123160537.3420975-1-cleger@rivosinc.com>
References: <20250123160537.3420975-1-cleger@rivosinc.com>
Message-ID: <20250123160537.3420975-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add SBI_ERR_DENIED_LOCKED and set it as the SBI_LAST_ERR which was
wrongly set to SBI_ERR_BAD_RANGE.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_ecall_interface.h | 3 ++-
 include/sbi/sbi_error.h           | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 0b6b5714..cac347a1 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -455,8 +455,9 @@ enum sbi_sse_state {
 #define SBI_ERR_BAD_RANGE			-11
 #define SBI_ERR_TIMEOUT				-12
 #define SBI_ERR_IO				-13
+#define SBI_ERR_DENIED_LOCKED			-14
 
-#define SBI_LAST_ERR				SBI_ERR_BAD_RANGE
+#define SBI_LAST_ERR				SBI_ERR_DENIED_LOCKED
 
 /* clang-format on */
 
diff --git a/include/sbi/sbi_error.h b/include/sbi/sbi_error.h
index b40b3319..febd596e 100644
--- a/include/sbi/sbi_error.h
+++ b/include/sbi/sbi_error.h
@@ -29,6 +29,7 @@
 #define SBI_ETIMEOUT		SBI_ERR_TIMEOUT
 #define SBI_ETIMEDOUT		SBI_ERR_TIMEOUT
 #define SBI_EIO			SBI_ERR_IO
+#define SBI_EDENIED_LOCKED	SBI_ERR_DENIED_LOCKED
 
 #define SBI_ENODEV		-1000
 #define SBI_ENOSYS		-1001
-- 
2.47.1


