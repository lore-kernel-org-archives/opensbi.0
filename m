From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Mon, 21 Mar 2022 10:45:25 +0530
Subject: [RFC PATCH v1 0/3] RISC-V Smstateen support
Message-ID: <20220321051528.20143-1-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for the Smstateen specification which provides
a mechanism to plug potential covert channels which are opened by extensions
which add to processor state that may not get context-switched. Currently
access to AIA registers and *envcfg registers is controlled via
smstateen.

Mayuresh Chitale (3):
  lib: sbi: Add Smstateen extension defines
  lib: sbi: Detect Smstateen CSRs at boot-time
  lib: sbi: configure mstateen

 include/sbi/riscv_encoding.h | 37 ++++++++++++++++++++++++++++++++++++
 include/sbi/sbi_hart.h       |  4 +++-
 lib/sbi/sbi_hart.c           | 29 +++++++++++++++++++++++++++-
 3 files changed, 68 insertions(+), 2 deletions(-)

-- 
2.17.1


