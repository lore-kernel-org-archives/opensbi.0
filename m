From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Mon,  1 Jul 2024 15:11:01 +0100
Subject: [PATCH 4/4] docs: writing tests: update cleaning instructions
In-Reply-To: <20240701141101.20227-1-ben.dooks@codethink.co.uk>
References: <20240701141101.20227-1-ben.dooks@codethink.co.uk>
Message-ID: <20240701141101.20227-5-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ivan Orlov <ivan.orlov0322@gmail.com>

After the changes introduced by the previous patches are applied, there
is no need of the manual removal of the `build/` directory every time
new test is added. Running `make clean` should be enough to regenerate
the carray-related files.

Update the documentation correspondingly.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 docs/writing_tests.md | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/docs/writing_tests.md b/docs/writing_tests.md
index 0fd15d6..cee4c4d 100644
--- a/docs/writing_tests.md
+++ b/docs/writing_tests.md
@@ -57,9 +57,7 @@ carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += string_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_string_test.o
 ```
 
-If you compiled OpenSBI with CONFIG_SBIUNIT enabled before, you may need to
-manually remove the build folder in order to regenerate the carray files:
-`rm -rf build/`.
+Now, run `make clean` in order to regenerate the carray-related files.
 
 Recompile OpenSBI with the CONFIG_SBIUNIT option enabled and run it in QEMU.
 You will see something like this:
-- 
2.37.2.352.g3c44437643


