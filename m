From: Joel Stanley <joel@jms.id.au>
Date: Wed,  5 Feb 2025 14:14:51 +1030
Subject: [PATCH 2/3] README: Update toolchain section to mention PIE requirement
In-Reply-To: <20250205034454.3464-1-joel@jms.id.au>
References: <20250205034454.3464-1-joel@jms.id.au>
Message-ID: <20250205034454.3464-3-joel@jms.id.au>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since commit 76d7e9b8ee72 ("firmware: remove copy-base relocation"), the
Makefile enforces PIE support.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 README.md | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/README.md b/README.md
index 84b11b79956d..db816c5d0d57 100644
--- a/README.md
+++ b/README.md
@@ -108,13 +108,12 @@ LLVM/Clang toolchain due to LLVM's ability to support multiple backends in the
 same binary, so is often an easy way to obtain a working cross-compilation
 toolchain.
 
-Basically, we prefer toolchains with Position Independent Executable (PIE)
-support like *riscv64-linux-gnu-gcc*, *riscv64-unknown-freebsd-gcc*, or
-*Clang/LLVM* as they generate PIE firmware images that can run at arbitrary
-address with appropriate alignment. If a bare-metal GNU toolchain (e.g.
-*riscv64-unknown-elf-gcc*) is used, static linked firmware images are
-generated instead. *Clang/LLVM* can still generate PIE images if a bare-metal
-triple is used (e.g. *-target riscv64-unknown-elf*).
+Toolchains with Position Independent Executable (PIE) support like
+*riscv64-linux-gnu-gcc*, *riscv64-unknown-freebsd-gcc*, or *Clang/LLVM* are
+required in order to generate PIE firmware images that can run at arbitrary
+address with appropriate alignment. Bare-metal GNU toolchains (e.g.
+*riscv64-unknown-elf-gcc*) cannot be used. *Clang/LLVM* can still generate PIE
+images if a bare-metal triple is used (e.g. *-target riscv64-unknown-elf*).
 
 Please note that only a 64-bit version of the toolchain is available in
 the Bootlin toolchain repository for now.
-- 
2.47.2


