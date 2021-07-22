From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Thu, 22 Jul 2021 12:53:57 +0200
Subject: [PATCH 0/2] lib: utils: support both of gpio-poweroff, gpio-reset
Message-ID: <20210722105359.18622-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic GPIO reset driver has two entries in the match table:
"gpio-poweroff", "gpio-reset". Only the first entry is considered by
fdt_reset_init().

Define "gpio-poweroff" and "gpio-reset" as compatibility strings of two
separate reset drivers. They still can share code.

Remove an unused variable.

Heinrich Schuchardt (2):
  lib: utils: remove unused variable in fdt_reset_init
  lib: utils: support both of gpio-poweroff, gpio-reset

 lib/utils/reset/fdt_reset.c      |  6 ++----
 lib/utils/reset/fdt_reset_gpio.c | 11 ++++++++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

--
2.30.2


