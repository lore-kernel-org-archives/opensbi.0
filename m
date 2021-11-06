From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Sat,  6 Nov 2021 10:54:48 +0100
Subject: [PATCH v5 0/3] lib: sbi: error handling in fdt_reset_init()
Message-ID: <20211106095451.13200-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A failure to initialize a reset driver should not stop booting. Yet we
should print an error message in such a case. This requires to move
the initialization of reset drivers to after sbi_console_init() and to
move printing the probed drivers to after the final initialization.

v5:
	move sbi_boot_print_domains() too
v4:
	add a comment
v3:
	fix sign of SBI_ENODEV in fdt_reset_init()
v2:
	add error output

Heinrich Schuchardt (3):
  lib: sbi: move sbi_boot_print_general()
  platform: generic: move fdt_reset_init to final_init
  lib: sbi: error handling in fdt_reset_init()

 include/sbi_utils/reset/fdt_reset.h |  7 ++++++-
 lib/sbi/sbi_init.c                  |  8 ++++----
 lib/utils/reset/fdt_reset.c         | 13 ++++++-------
 platform/generic/platform.c         | 15 +++++----------
 4 files changed, 21 insertions(+), 22 deletions(-)

-- 
2.32.0


