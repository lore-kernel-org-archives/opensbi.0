From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 Dec 2022 12:38:50 -0800
Subject: [PATCH] docs: pmu: Update the pmu doc with removal of mcountinhbit restriction
Message-ID: <20221222203850.2592975-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since commit b28f070, it is possible for platforms to run perf monitoring
even if mcountinhibit is not supported. Sampling still won't be possible
though as it requires sscofpmf extension.

Update the docs to remove the restriction.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 docs/pmu_support.md | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/pmu_support.md b/docs/pmu_support.md
index 1db36fc..c74ef5f 100644
--- a/docs/pmu_support.md
+++ b/docs/pmu_support.md
@@ -6,9 +6,6 @@ capability of performance analysis tools such as perf if SBI PMU extension is
 enabled. The OpenSBI implementation makes the following assumptions about the
 hardware platform.
 
- * MCOUNTINHIBIT CSR must be implemented in the hardware. Otherwise, SBI PMU
-extension will not be enabled.
-
  * The platform must provide information about PMU event to counter mapping
 via device tree or platform specific hooks. Otherwise, SBI PMU extension will
 not be enabled.
-- 
2.25.1


