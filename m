From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Sat, 28 Jan 2023 13:16:15 +0530
Subject: [PATCH 0/2] Add endianness conversion support
Message-ID: <20230128074617.1917265-1-rpathak@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds a new header which defines the generic
endianness conversion functions.
These new functions replaces the existing byte-swapping
functions defined in libfdt_env.h

Rahul Pathak (2):
  include: Add support for byteorder/endianness conversion
  lib: utils/fdt: Use byteorder conversion functions in libfdt_env.h

 include/sbi/sbi_byteorder.h   | 57 +++++++++++++++++++++++++++++++++++
 lib/utils/libfdt/libfdt_env.h | 29 ++++++------------
 2 files changed, 67 insertions(+), 19 deletions(-)
 create mode 100644 include/sbi/sbi_byteorder.h

-- 
2.34.1


