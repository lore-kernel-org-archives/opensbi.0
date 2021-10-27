From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 27 Oct 2021 17:22:03 +0200
Subject: [PATCH v4 0/3] lib: sbi: error handling in fdt_reset_init()
Message-ID: <20211027152206.68913-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A failure to initialize a reset driver should not stop booting. Yet we
should print an error message in such a case. This requires to move
the initialization of reset drivers to after sbi_console_init() and to
move printing the probed drivers to after the final initialization.

With the series applied the output including an error message will
look like:

    ...
    Domain0 Next Arg1         : 0x0000000080299f10
    Domain0 Next Mode         : S-mode
    Domain0 SysReset          : yes

    fdt_reset_init: da9063-reset init failed, -1001
    Platform Name             : SiFive HiFive Unmatched A00
    Platform Features         : medeleg
    Platform HART Count       : 5
    Platform IPI Device       : aclint-mswi
    Platform Timer Device     : aclint-mtimer @ 1000000Hz
    Platform Console Device   : sifive_uart
    Platform HSM Device       : ---
    Platform Reboot Device    : ---
    Platform Shutdown Device  : gpio-reset
    ...

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
 lib/sbi/sbi_init.c                  |  4 ++--
 lib/utils/reset/fdt_reset.c         | 13 ++++++-------
 platform/generic/platform.c         | 15 +++++----------
 4 files changed, 19 insertions(+), 20 deletions(-)

-- 
2.32.0


