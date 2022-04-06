From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed,  6 Apr 2022 22:27:38 +0530
Subject: [PATCH v3 0/3] RISC-V Smstateen support
Message-ID: <20220406165741.663-1-mchitale@ventanamicro.com>
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

Changes in v3:
- Fix RV32 compilation issue

Changes in v2:
- Rebase on latest master branch
- Fix indentation issue

Mayuresh Chitale (3):
  lib: sbi: Add Smstateen extension defines
  lib: sbi: Detect Smstateen CSRs at boot-time
  lib: irqchip/imsic: configure mstateen

 include/sbi/riscv_encoding.h | 44 ++++++++++++++++++++++++++++++++++++
 include/sbi/sbi_hart.h       |  4 +++-
 lib/sbi/sbi_hart.c           | 31 +++++++++++++++++++++++++
 3 files changed, 78 insertions(+), 1 deletion(-)

-- 
2.17.1


