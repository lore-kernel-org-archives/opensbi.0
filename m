From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed,  1 Jul 2020 15:07:08 +0200
Subject: [PATCH] README.md: fix markdown link formatting
Message-ID: <20200701130708.15818-1-tklauser@distanz.ch>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Consistently use reference-style markdown links in the README. This
won't show the URL next to the linked text for the [Github] and [U-Boot]
links and link the text "Bootlin toolchain repository" instead of
showing it verbatim with the URL next to it.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 README.md | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index 8958343b1555..bd41ba3a1b69 100644
--- a/README.md
+++ b/README.md
@@ -45,7 +45,7 @@ between:
    executing in VS-mode.
 
 The *RISC-V SBI specification* is maintained as an independent project by the
-RISC-V Foundation on [Github] (https://github.com/riscv/riscv-sbi-doc).
+RISC-V Foundation on [Github].
 
 The goal of the OpenSBI project is to provide an open-source reference
 implementation of the RISC-V SBI specifications for platform-specific firmwares
@@ -69,7 +69,7 @@ platform-dependent hardware manipulation functions. For all supported platforms,
 OpenSBI also provides several runtime firmware examples built using the platform
 *libplatsbi.a*. These example firmwares can be used to replace the legacy
 *riscv-pk* bootloader (aka BBL) and enable the use of well-known bootloaders
-such as [U-Boot] (https://git.denx.de/u-boot.git).
+such as [U-Boot].
 
 Supported SBI version
 ---------------------
@@ -97,8 +97,7 @@ Required Toolchain
 
 OpenSBI can be compiled natively or cross-compiled on a x86 host. For
 cross-compilation, you can build your own toolchain or just download
-a prebuilt one from the
-[Bootlin toolchain repository] (https://toolchains.bootlin.com/).
+a prebuilt one from the [Bootlin toolchain repository].
 
 Please note that only a 64-bit version of the toolchain is available in
 the Bootlin toolchain repository for now.
@@ -269,6 +268,7 @@ make I=<install_directory> install_docs
 
 [Github]: https://github.com/riscv/riscv-sbi-doc
 [U-Boot]: https://www.denx.de/wiki/U-Boot/SourceCode
+[Bootlin toolchain repository]: https://toolchains.bootlin.com/
 [COPYING.BSD]: COPYING.BSD
 [SPDX]: http://spdx.org/licenses/
 [Contribution Guideline]: docs/contributing.md
-- 
2.27.0


