From: Xiang W <wxjstz@126.com>
Date: Thu,  6 Jun 2024 17:17:12 +0800
Subject: [PATCH 0/4] Initialize the console as early as possible
Message-ID: <20240606091723.896477-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Initializing the console as early as possible can output more useful
information. This series of patches is used to initialize the console
as early as possible.

This series of patches is based on a previous patch
http://lists.infradead.org/pipermail/opensbi/2024-May/006960.html

Xiang W (4):
  include: sbi_utils: fixup fdt_get_address
  lib: sbi: Add domains_init to sbi_console_device
  lib: utils/serial: add domains_init for 8250
  lib: sbi: Initialize the console as early as possible

 include/sbi/sbi_console.h           |  3 +++
 include/sbi_utils/fdt/fdt_helper.h  |  4 +++-
 include/sbi_utils/serial/uart8250.h |  1 +
 lib/sbi/sbi_domain.c                | 10 ++++++++++
 lib/sbi/sbi_init.c                  |  8 ++++----
 lib/utils/serial/uart8250.c         | 28 +++++++++++++++++++---------
 6 files changed, 40 insertions(+), 14 deletions(-)

-- 
2.43.0


