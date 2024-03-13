From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Wed, 13 Mar 2024 15:01:56 +0000
Subject: [PATCH 0/2] Move tests to the 'tests' directory
Message-ID: <20240313150158.204455-1-ivan.orlov0322@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As it was suggested by Anup Patel <anup@brainfault.org>, the tests
should be moved to the separate directory `lib/sbi/tests`. This patch
series puts the test-related code into the right place and updates the
documentation correspondingly.

Ivan Orlov (2):
  lib: tests: Move tests to a separate directory
  docs/writing_tests: Update tests paths

 Makefile                                  |  2 ++
 docs/writing_tests.md                     | 21 ++++++++++-----------
 lib/sbi/objects.mk                        |  6 ------
 lib/sbi/sbi_console.c                     |  2 +-
 lib/sbi/tests/objects.mk                  |  6 ++++++
 lib/sbi/{ => tests}/sbi_bitmap_test.c     |  0
 lib/sbi/{ => tests}/sbi_console_test.c    |  0
 lib/sbi/{ => tests}/sbi_unit_test.c       |  0
 lib/sbi/{ => tests}/sbi_unit_tests.carray |  0
 9 files changed, 19 insertions(+), 18 deletions(-)
 create mode 100644 lib/sbi/tests/objects.mk
 rename lib/sbi/{ => tests}/sbi_bitmap_test.c (100%)
 rename lib/sbi/{ => tests}/sbi_console_test.c (100%)
 rename lib/sbi/{ => tests}/sbi_unit_test.c (100%)
 rename lib/sbi/{ => tests}/sbi_unit_tests.carray (100%)

-- 
2.34.1


