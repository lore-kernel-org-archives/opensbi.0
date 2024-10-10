From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 10 Oct 2024 14:30:58 +0530
Subject: [PATCH v2 9/9] docs: Remove hartindex_to_context_table from domain_support.md
In-Reply-To: <20241010090058.179381-1-apatel@ventanamicro.com>
References: <20241010090058.179381-1-apatel@ventanamicro.com>
Message-ID: <20241010090058.179381-10-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hartindex_to_context_table field is no longer part of sbi_domain
so remove related documentation from domain_support.md.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 docs/domain_support.md | 2 --
 1 file changed, 2 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 1a400685..93186c4a 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -41,7 +41,6 @@ has following details:
 * **name** - Name of this domain
 * **assigned_harts** - HARTs assigned to this domain
 * **possible_harts** - HARTs possible in this domain
-* **hartindex_to_context_table** - Contexts corresponding to possible HARTs
 * **regions** - Array of memory regions terminated by a memory region
   with order zero
 * **boot_hartid** - HART id of the HART booting this domain. The domain
@@ -81,7 +80,6 @@ following manner:
   platform support
 * **possible_harts** - All valid HARTs of a RISC-V platform are possible
   HARTs of the ROOT domain
-* **hartindex_to_context_table** - Contexts corresponding to ROOT domain's possible HARTs
 * **regions** - Two memory regions available to the ROOT domain:
   **A)** A memory region to protect OpenSBI firmware from S-mode and U-mode
   **B)** A memory region of **order=__riscv_xlen** allowing S-mode and
-- 
2.43.0


