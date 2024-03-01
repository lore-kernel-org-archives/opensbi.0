From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Fri,  1 Mar 2024 16:00:41 +0000
Subject: [PATCH v3 0/4] SBIUnit: cover OpenSBI with tests
Message-ID: <20240301160046.267814-1-ivan.orlov0322@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It is good when the code is covered with tests. Tests help us to keep
the code clean and avoid regressions. Also, a good test is always a nice
documentation for the code it covers.

This patch series introduces SBIUnit - the set of macros and functions
which simplify the unit test development for OpenSBI and automate tests
execution and evaluation.

This thing is mainly inspired by the KUnit framework from the Linux
Kernel, where the similar unit-test development tooling have been used
successfully for a pretty long time now. SBIUnit uses the same test
structure: multiple test cases are grouped together into the test
suites. SBIUnit also tries to reproduce the KUnit tests API while
allowing for some simplifications.

Another difference between the KUnit and SBIUnit is the location where
the tests are "stored". KUnit creates the ELF section in the kernel and
stores the pointers to all of the test suites there. SBIUnit takes
advantage of the 'carray' functionality of OpenSBI, keeping the pointers
to test suites in the auto-generated ".c" file. ELF section approach
could not be applied to SBIUnit, because OpenSBI could be used as a
static library when linking firmware. Use of a dedicated ELF section
would mean that all firmware linked with OpenSBI would need to have
this ELF section as well.

V1 -> V2:
- Add a cover letter
- Elaborate more on the differences between SBIUnit and KUnit
- Add a new patch adding a new entry to the 'clear' makefile target in
order to clear carray-generated files as well.

V2 -> V3:
- Drop the patch which modifies carray behavior (it will be included
into a separate patch series)
- (Patch-specific changes are described in the following patches)

Ivan Orlov (4):
  docs: Add documentation about tests and SBIUnit
  lib: Add SBIUnit testing macros and functions
  lib: tests: Add a test for sbi_bitmap
  lib: tests: Add sbi_console test

 docs/writing_tests.md         | 133 ++++++++++++++++++++++++++++++++++
 include/sbi/sbi_unit_test.h   |  71 ++++++++++++++++++
 lib/sbi/Kconfig               |   4 +
 lib/sbi/objects.mk            |   6 ++
 lib/sbi/sbi_bitmap_test.c     | 102 ++++++++++++++++++++++++++
 lib/sbi/sbi_console.c         |   4 +
 lib/sbi/sbi_console_test.c    | 101 ++++++++++++++++++++++++++
 lib/sbi/sbi_init.c            |   3 +
 lib/sbi/sbi_unit_test.c       |  43 +++++++++++
 lib/sbi/sbi_unit_tests.carray |   3 +
 10 files changed, 470 insertions(+)
 create mode 100644 docs/writing_tests.md
 create mode 100644 include/sbi/sbi_unit_test.h
 create mode 100644 lib/sbi/sbi_bitmap_test.c
 create mode 100644 lib/sbi/sbi_console_test.c
 create mode 100644 lib/sbi/sbi_unit_test.c
 create mode 100644 lib/sbi/sbi_unit_tests.carray

-- 
2.34.1


