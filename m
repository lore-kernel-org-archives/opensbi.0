From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Tue, 23 Apr 2024 16:52:42 +0100
Subject: [PATCH 0/3] Add two tests and improve SBIUnit
Message-ID: <20240423155245.14541-1-ivan.orlov0322@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series intriduces two more tests for OpenSBI:

- spinlocks test (for functions from `riscv_locks.h`)
- atomics test (for functions from `riscv_atomic.h`)

Also, it adds a functionality of defining the init function for the
test suite. It allows us to initialize global variables used in the
multiple test cases (see the atomic test in this patch series).


Ivan Orlov (3):
  lib: tests: Add test suite init function
  lib: tests: Add test for atomic_t
  lib: tests: Add test for spinlocks

 include/sbi/sbi_unit_test.h       |   2 +
 lib/sbi/tests/objects.mk          |   6 ++
 lib/sbi/tests/riscv_atomic_test.c | 143 ++++++++++++++++++++++++++++++
 lib/sbi/tests/riscv_locks_test.c  |  41 +++++++++
 lib/sbi/tests/sbi_unit_test.c     |   3 +
 5 files changed, 195 insertions(+)
 create mode 100644 lib/sbi/tests/riscv_atomic_test.c
 create mode 100644 lib/sbi/tests/riscv_locks_test.c

-- 
2.34.1


