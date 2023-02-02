From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Thu,  2 Feb 2023 10:14:24 +0530
Subject: [PATCH v2 0/3] Add endianness conversion support
Message-ID: <20230202044427.1253816-1-rpathak@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds a new header which defines the generic
endianness conversion functions.
These new functions replaces the existing byte-swapping
functions defined in libfdt_env.h

New typedefs - leX_t/beX_t and use them in existing
libfdt_env.h

Changelog - v2:
- Added new patch for typedefs related to endianness

Rahul Pathak (3):
  include: Add support for byteorder/endianness conversion
  lib: utils/fdt: Use byteorder conversion functions in libfdt_env.h
  include: types: Add typedefs for endianness

 include/sbi/sbi_byteorder.h   | 57 +++++++++++++++++++++++++++++++++++
 include/sbi/sbi_types.h       |  7 +++++
 lib/utils/libfdt/libfdt_env.h | 35 ++++++++-------------
 3 files changed, 77 insertions(+), 22 deletions(-)
 create mode 100644 include/sbi/sbi_byteorder.h

-- 
2.34.1


