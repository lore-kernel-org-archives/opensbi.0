From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Sun, 29 Oct 2023 00:49:56 +0200
Subject: [RFC 0/3] Enable access to seed CSR in S-mode
Message-ID: <20231028224959.95465-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Zkr ISA extension (ratified Nov 2021) introduced the seed CSR. It
provides an interface to a physical entropy source.

Machine mode has always access to the CSR, supervisor, and user mode
only if the corresponding bits sseed and useed are set in mseccfg.

With this series S-mode access to the seed register is enabled if the
Zkr extension is present. U-mode access is disabled.

QEMU 8.1.2 seems to have a bug:

The mseccfg register can only be accessed when setting cpu flag x-epmp=on.
The Privileged Architecture does not foresee this.

Heinrich Schuchardt (3):
  include: sbi: macros for mseccfg.sseed and .useed
  lib: sbi: Add Zkr in hart extensions
  lib: sbi: enable seed access in S-mode

 include/sbi/riscv_encoding.h |  4 ++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/sbi_hart.c           | 15 +++++++++++++++
 lib/utils/fdt/fdt_helper.c   |  1 +
 4 files changed, 22 insertions(+)

-- 
2.40.1


