From: Joel Stanley <joel@jms.id.au>
Date: Wed,  5 Feb 2025 14:14:50 +1030
Subject: [PATCH 1/3] README: Any arch host can be used to cross compile
In-Reply-To: <20250205034454.3464-1-joel@jms.id.au>
References: <20250205034454.3464-1-joel@jms.id.au>
Message-ID: <20250205034454.3464-2-joel@jms.id.au>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Verified by cross compiling from an arm64 host.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index cbae73ae5e6f..84b11b79956d 100644
--- a/README.md
+++ b/README.md
@@ -99,7 +99,7 @@ capable enough to bring up all other non-booting harts using HSM extension.
 Required Toolchain and Packages
 -------------------------------
 
-OpenSBI can be compiled natively or cross-compiled on a x86 host. For
+OpenSBI can be compiled natively or cross-compiled on a host machine. For
 cross-compilation, you can build your own toolchain, download a prebuilt one
 from the [Bootlin toolchain repository] or install a distribution-provided
 toolchain; if you opt to use LLVM/Clang, most distribution toolchains will
-- 
2.47.2


