From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Mon,  1 Jul 2024 15:10:57 +0100
Subject: [PATCH 0/4] Updated carray and other build improvements
Message-ID: <20240701141101.20227-1-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is an updated series which deals with some build issues such as
the carray file cleaning. This was originally submitted by Ivan Orlov
and has been updated post various discussions about how to do this.

This series now renames the carray .c files to .carray.c so they can be
found during cleaning and removed from the build directory. This seems
to be easier than trying to look through all the make files for the
carray code or to just remove all .c files in the build directory (which
could also be a bit dangerous if someone left a .c file in there)

ML: https://lists.infradead.org/pipermail/opensbi/2024-April/006740.html
Github: https://github.com/bendooks/opensbi/tree/bjdooks/ivan-build3

Ben Dooks (2):
  Makefile; change to using .carray.c for carray files
  Makefile: remove any .carray.c during clean

Ivan Orlov (2):
  scripts/carray.sh: Add comment to generated files
  docs: writing tests: update cleaning instructions

 Makefile                     | 8 +++++---
 docs/writing_tests.md        | 4 +---
 lib/sbi/objects.mk           | 2 +-
 lib/sbi/tests/objects.mk     | 2 +-
 lib/utils/gpio/objects.mk    | 2 +-
 lib/utils/i2c/objects.mk     | 2 +-
 lib/utils/ipi/objects.mk     | 2 +-
 lib/utils/irqchip/objects.mk | 2 +-
 lib/utils/regmap/objects.mk  | 2 +-
 lib/utils/reset/objects.mk   | 2 +-
 lib/utils/serial/objects.mk  | 2 +-
 lib/utils/timer/objects.mk   | 2 +-
 platform/generic/objects.mk  | 2 +-
 scripts/carray.sh            | 1 +
 14 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.37.2.352.g3c44437643


