From: Joel Stanley <joel@jms.id.au>
Date: Wed,  5 Feb 2025 14:14:52 +1030
Subject: [PATCH 3/3] README: Remove comment about boolin toolchains being 64-bit only
In-Reply-To: <20250205034454.3464-1-joel@jms.id.au>
References: <20250205034454.3464-1-joel@jms.id.au>
Message-ID: <20250205034454.3464-4-joel@jms.id.au>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As of January 2025 they have riscv32-ilp32d and riscv64-lp64d:

 https://toolchains.bootlin.com/releases_riscv32-ilp32d.html
 https://toolchains.bootlin.com/releases_riscv64-lp64d.html

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 README.md | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/README.md b/README.md
index db816c5d0d57..2795cc1a5ff0 100644
--- a/README.md
+++ b/README.md
@@ -115,9 +115,6 @@ address with appropriate alignment. Bare-metal GNU toolchains (e.g.
 *riscv64-unknown-elf-gcc*) cannot be used. *Clang/LLVM* can still generate PIE
 images if a bare-metal triple is used (e.g. *-target riscv64-unknown-elf*).
 
-Please note that only a 64-bit version of the toolchain is available in
-the Bootlin toolchain repository for now.
-
 In addition to a toolchain, OpenSBI also requires the following packages on
 the host:
 
-- 
2.47.2


