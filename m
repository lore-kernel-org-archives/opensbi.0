From: Icenowy Zheng <uwu@icenowy.me>
Date: Mon, 12 Dec 2022 16:22:35 +0800
Subject: [PATCH v2 0/3] T-Head C9xx CLINT support
Message-ID: <20221212082238.265281-1-uwu@icenowy.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset tries to add support for T-Head C9xx's CLINT to OpenSBI.

For MSWI part, the T-Head CLINT is fully compatible with the SiFive one,
so it's just simply adding a compatible string.

For MTIMER part, it's first needed to implement a quirk for
MTIME-less timer (thus only MTIMECMP is present), then the compatible
string is added and bound to the quirk.

To instantiate such a T-Head flavored CLINT via DT, this patchset
depends on DT bindings declared in [1].

[1] https://www.spinics.net/lists/kernel/msg4597447.html

Icenowy Zheng (3):
  lib: utils/ipi: mswi: add T-Head C9xx CLINT compatible
  lib: utils/timer: mtimer: add a quirk for lacking mtime register
  lib: utils/timer: mtimer: add T-Head C9xx CLINT compatible

 lib/utils/ipi/fdt_ipi_mswi.c       |  1 +
 lib/utils/timer/aclint_mtimer.c    | 11 ++++++---
 lib/utils/timer/fdt_timer_mtimer.c | 36 +++++++++++++++++++++---------
 3 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.38.1


