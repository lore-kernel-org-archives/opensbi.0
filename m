From: Daniel Schaefer <git@danielschaefer.me>
Date: Wed, 12 May 2021 19:07:12 +0800
Subject: spin_lock_check has different signatures
Message-ID: <d8f94296-67d5-dcc6-c6cb-001a4b86563a@danielschaefer.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

spin_lock_check has different signatures in the C and in the H file.

See lib/sbi/riscv_locks.c

bool spin_lock_check(spinlock_t *lock)

and include/sbi/riscv_locks.h

int spin_lock_check(spinlock_t *lock);

Some related functions also seem to return a value that should be boolean but are not.
Especially spin_lock_unlocked returns an int and is used as return value for spin_lock_check.

So spin_lock_check and spin_lock_unlocked should return bool.
spin_trylock probably also.

Cheers,
Daniel

