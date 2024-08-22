From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 Aug 2024 10:48:27 -0700
Subject: [PATCH v3 3/4] lib: sbi: sw check exception delegation
In-Reply-To: <20240822174828.4031332-1-debug@rivosinc.com>
References: <20240822174828.4031332-1-debug@rivosinc.com>
Message-ID: <20240822174828.4031332-4-debug@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

zicfiss and zicfilp introduces new exception (cause=18). Delegate this
exception to S mode because cfi violations in U / S will be reported
via this exception.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 lib/sbi/sbi_hart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0636021..1f6c4c8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -207,7 +207,8 @@ static int delegate_traps(struct sbi_scratch *scratch)
 	if (sbi_platform_has_mfaults_delegation(plat))
 		exceptions |= (1U << CAUSE_FETCH_PAGE_FAULT) |
 			      (1U << CAUSE_LOAD_PAGE_FAULT) |
-			      (1U << CAUSE_STORE_PAGE_FAULT);
+			      (1U << CAUSE_STORE_PAGE_FAULT)|
+			      (1U << CAUSE_SW_CHECK_EXCP);
 
 	/*
 	 * If hypervisor extension available then we only handle hypervisor
-- 
2.44.0


