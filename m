From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Jul 2021 09:20:16 +0800
Subject: [PATCH v3] README: Update toolchain information
Message-ID: <20210712012016.29362-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Recent FW_PIC=y changes actually require toolchains with PIE support
and it is on by default. Existing doc uses a GNU bare-metal toolchain
as examples but it does not support PIE.

Replace references of bare-metal toolchain prefix with Linux toolchain
prefix everywhere in documentation.

Also indicate that "riscv64-unknown-freebsd-" as an alternative to
"riscv64-linux-" GNU toolchain.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v3:
- Use "riscv*-linux-gnu-" intead of "riscv*-linux"

Changes in v2:
- Include "riscv64-unknown-freebsd-" as an alternative

 README.md | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/README.md b/README.md
index b296f00..9fdf097 100644
--- a/README.md
+++ b/README.md
@@ -104,6 +104,14 @@ LLVM/Clang toolchain due to LLVM's ability to support multiple backends in the
 same binary, so is often an easy way to obtain a working cross-compilation
 toolchain.
 
+Basically, we prefer toolchains with Position Independent Executable (PIE)
+support like *riscv64-linux-gnu-gcc*, *riscv64-unknown-freebsd-gcc*, or
+*Clang/LLVM* as they generate PIE firmware images that can run at arbitrary
+address with appropriate alignment. If a bare-metal GNU toolchain (e.g.
+*riscv64-unknown-elf-gcc*) is used, static linked firmware images are
+generated instead. *Clang/LLVM* can still generate PIE images if a bare-metal
+triple is used (e.g. *-target riscv64-unknown-elf*).
+
 Please note that only a 64-bit version of the toolchain is available in
 the Bootlin toolchain repository for now.
 
@@ -116,7 +124,7 @@ architecture than RISC-V.
 
 For cross-compiling, the environment variable *CROSS_COMPILE* must be defined
 to specify the name prefix of the RISC-V compiler toolchain executables, e.g.
-*riscv64-unknown-elf-* if the gcc executable used is *riscv64-unknown-elf-gcc*.
+*riscv64-linux-gnu-* if the gcc executable used is *riscv64-linux-gnu-gcc*.
 
 To build *libsbi.a* simply execute:
 ```
@@ -192,16 +200,16 @@ Building 32-bit / 64-bit OpenSBI Images
 ---------------------------------------
 By default, building OpenSBI generates 32-bit or 64-bit images based on the
 supplied RISC-V cross-compile toolchain. For example if *CROSS_COMPILE* is set
-to *riscv64-unknown-elf-*, 64-bit OpenSBI images will be generated. If building
+to *riscv64-linux-gnu-*, 64-bit OpenSBI images will be generated. If building
 32-bit OpenSBI images, *CROSS_COMPILE* should be set to a toolchain that is
-pre-configured to generate 32-bit RISC-V codes, like *riscv32-unknown-elf-*.
+pre-configured to generate 32-bit RISC-V codes, like *riscv32-linux-gnu-*.
 
 However it's possible to explicitly specify the image bits we want to build with
 a given RISC-V toolchain. This can be done by setting the environment variable
 *PLATFORM_RISCV_XLEN* to the desired width, for example:
 
 ```
-export CROSS_COMPILE=riscv64-unknown-elf-
+export CROSS_COMPILE=riscv64-linux-gnu-
 export PLATFORM_RISCV_XLEN=32
 ```
 
@@ -235,7 +243,7 @@ valid triple.
 These can also be mixed; for example using a GCC cross-compiler but LLVM
 binutils would be:
 ```
-make CC=riscv64-unknown-elf-gcc LLVM=1
+make CC=riscv64-linux-gnu-gcc LLVM=1
 ```
 
 These variables must be passed for all the make invocations described in this
-- 
2.25.1


