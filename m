From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 18 Jul 2022 19:20:24 +0200
Subject: [PATCH 0/4] lib: utils/serial: Collection of UART code improvements
Message-ID: <20220718172028.2006166-1-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series is a collection of changes I made while reviewing the UART
code. I've compile tested it and boot it on QEMU (which of course only
tests uart8250). I did also pass in a DTB with 0 for 'current-speed' in
the UART node and nothing interesting happened, so I guess that's good.

Andrew Jones (4):
  lib: utils/fdt: Factor out common uart node code
  lib: utils/serial: Initialize platform_uart_data to zero
  lib: serial: Clean up coding style in sifive-uart.c
  lib: utils/serial: Ensure baudrate is non-zero before using

 lib/utils/fdt/fdt_helper.c                  | 131 ++++++--------------
 lib/utils/serial/fdt_serial_gaisler.c       |   2 +-
 lib/utils/serial/fdt_serial_shakti.c        |   2 +-
 lib/utils/serial/fdt_serial_sifive.c        |   2 +-
 lib/utils/serial/fdt_serial_uart8250.c      |   2 +-
 lib/utils/serial/fdt_serial_xlnx_uartlite.c |   2 +-
 lib/utils/serial/gaisler-uart.c             |   2 +-
 lib/utils/serial/shakti-uart.c              |   8 +-
 lib/utils/serial/sifive-uart.c              |  13 +-
 lib/utils/serial/uart8250.c                 |   7 +-
 platform/fpga/openpiton/platform.c          |   2 +-
 11 files changed, 66 insertions(+), 107 deletions(-)

-- 
2.36.1


