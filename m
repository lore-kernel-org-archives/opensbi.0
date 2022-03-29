From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Mar 2022 21:22:14 +0530
Subject: [PATCH 0/4] Configure Zicbo[m|z] and Svpbmt in menvcfg CSR
Message-ID: <20220329155218.118580-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Lower privilege modes (S and U) can use Zicbo[m|z] and Svpbmt extensions
only if these extensions are configured/enabled by M-mode firmware hence
this series.

The PATCH2 is adapted from Atish's Sstc series to avoid duplicate work.

These patches can be found in pbmt_cbo_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (3):
  include: Add defines for [m|h|s]envcfg CSRs
  lib: sbi: Enable Zicbo[m|z] extensions in the menvcfg CSR
  lib: sbi: Enable Svpbmt extension in the menvcfg CSR

Atish Patra (1):
  lib: sbi: Detect menvcfg CSR at boot time

 include/sbi/riscv_encoding.h | 27 +++++++++++++++++++
 include/sbi/sbi_hart.h       |  4 ++-
 lib/sbi/sbi_hart.c           | 52 +++++++++++++++++++++++++++++++++++-
 3 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.25.1


