From: Evgenii Shatokhin <e.shatokhin@yadro.com>
Date: Mon, 6 Mar 2023 00:22:44 +0300
Subject: [PATCH v3 0/3] lib: sbi: Prevent system hang when bringing up secondary harts
Message-ID: <20230305212247.494912-1-e.shatokhin@yadro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The boot hart can race with the secondary harts when it tries to bring them
up at startup time. This results in occasional system hangs at boot, which
can be reproduced in QEMU with a Linux guest, even with '-machine virt'.

When the Linux kernel needs to bring up the non-boot harts, the boot hart
enters opensbi via a ecall and eventually gets to sbi_hsm_hart_start().
Other (secondary) harts are spinning in the while loop in
sbi_hsm_hart_wait() at that moment:

	/* Wait for state transition requested by sbi_hsm_hart_start() */
	while (atomic_read(&hdata->state) != SBI_HSM_STATE_START_PENDING) {
		wfi();
	};

sbi_hsm_hart_start() sets the secondary hart's state to 
SBI_HSM_STATE_START_PENDING first and checks the previous value of the
state. This makes sure no other hart would try to modify the secondary
hart's scratch area in the meantime.

The boot hart then reads the init count of the secondary hart and sets the
address it should eventually jump to, as well as other data:

	init_count = sbi_init_count(hartid);
	rscratch->next_arg1 = arg1;
	rscratch->next_addr = saddr;
	rscratch->next_mode = smode;

Then, the boot hart sends IPI to the secondary hart, so that it would stop
spinning in the loop above and would continue.

However, as we observed during the test runs for our systems, the secondary
harts could leave the loop in sbi_hsm_hart_wait() as soon as their state is
set to SBI_HSM_STATE_START_PENDING. As a result, the following situation is
possible:


Boot hart (#0)                        Secondary hart (#1)
runs Linux startup code               waits in sbi_hsm_hart_wait()
sbi_ecall(SBI_EXT_HSM,
          SBI_EXT_HSM_HART_START,
          ...)
enters sbi_hsm_hart_start()
sets state to START_PENDING
                                      leaves sbi_hsm_hart_wait()
                                      runs to the end of init_warmboot()
                                      returns to scratch->next_addr
                                      (next_addr can be garbage here)

sets next_addr, etc. for hart #1
(no good: hart #1 has already left)

sends IPI to hart #1
(no good either)
                   (system might hang or crash)

This can be reproduced easier, if one inserts a delay into
sbi_hsm_hart_start() right before "init_count = sbi_init_count(hartid);".
In our case, "sbi_timer_mdelay(10)" was enough for the issue to manifest
each time.

The patch series fixes 2 issues:

1. The data required for the secondary hart to continue (next_addr, etc.)
are prepared after it state is set to SBI_HSM_STATE_START_PENDING, which can
be too late.

2. Since commit 50d4fde1c5a4 ("lib: Remove redundant sbi_platform_ipi_clear()
calls"), the IPI sent from the boot hart in wake_coldboot_harts() is never
cleared in the secondary harts. So, they enter sbi_hsm_hart_wait() with
already pending IPIs and do not wait for new ones.

In both cases, the secondary hart might leave the "wfi" loop as soon as its
state is set to SBI_HSM_STATE_START_PENDING, leading to the race described
above.

Changes in v3:

* Added a patch with refactoring suggested by Anup Patel.

* Moved updates of the target hart's scratch area before setting the state.
Used a more readable ticket-based synchronization to prevent other harts
from messing with that scratch area.

* Added comments about memory ordering.

Changes in v2:

* Added a per-hart variable to properly synchronize the boot hart and the
  secondary hart. This should be safer than just waiting for any IPI in
  sbi_hsm_hart_wait(), because the hart might, in theory, get an IPI
  unrelated to sbi_hsm_hart_start().

* Updated the description of the second patch: clearing of the pending IPIs
  is no longer needed to prevent the race. Now, it rather allows avoiding
  a potentially inefficient busy-wait.

Regards,
Evgenii





