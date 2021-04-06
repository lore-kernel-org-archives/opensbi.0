From: Christoph Muellner <cmuellner@linux.com>
Date: Tue,  6 Apr 2021 03:53:51 +0200
Subject: [PATCH v3 0/3] spinlocks: Replace test-and-set locks by ticket locks
Message-ID: <20210406015354.332780-1-cmuellner@linux.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series replaces the test-and-set spinlock
implementation of OpenSBI with ticket locks.

Test-and-set locks don't provide fairness and are non-deterministic
(w.r.t. the prediction of the future holder of a lock).
This can be a performance problem in case of lock contention
(e.g. consumers continuously steal the lock from a single producer).

Let's change the implementation to use ticket locks, which guarantee
a fair locking order (FIFO ordering).

Ticket locks have two counters 'owner' and 'next'.
The counter 'owner' holds the ticket number of the current lock owner.
The counter 'next' holds the latest free ticket number.

The lock is free if both counters are equal. To acquire the lock, the
'next' counter is atomically incremented (fetch-and-inc) to obtain a
new ticket. The counter 'owner' is then polled until it becomes equal
to the new ticket. To release a lock, one atomically increments the
'owner' counter.

This patchset has been tested on RV64 and RV32 against self-written
unit tests (to ensure the 16-bit overflow is correct) and against
the Linux kernel (by exchanging the kernel's spinlock implementation
with the one from this patchset).

Note, that RISC-V lacks sub-word atomics, therefore we need to
circumvent this limitation with additional instructions.

v3:
* Replace LR/SC sequence by AMOADD in spin_lock()
* Add cover letter

v2:
* Fixing RV32 support
* Address comments from Jessica

Christoph Muellner (3):
  include: types: Add __aligned(x) to define the minimum alignement
  spinlocks: Allow direct initialization via SPIN_LOCK_INIT()
  spinlocks: Replace test-and-set locks by ticket locks

 include/sbi/riscv_locks.h | 33 ++++++++++++-------
 include/sbi/sbi_types.h   |  1 +
 lib/sbi/riscv_locks.c     | 67 +++++++++++++++++++++++++++++----------
 lib/sbi/sbi_fifo.c        |  2 +-
 4 files changed, 74 insertions(+), 29 deletions(-)

-- 
2.30.2


