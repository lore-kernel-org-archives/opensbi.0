From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 24 Oct 2023 10:11:40 +0000
Subject: [PATCH v2 0/5] Add Svadu extension support
Message-ID: <20231024101145.32000-1-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series enables Svadu extension support by configuring the menvcfg
CSR and, if available, displays the Svadu extension in the boot log.

Additionally, we've made some programming improvements in
lib/sbi/sbi_hart.c and lib/utils/fdt/fdt_helper.c.

---
v2:
- Rearrange the patches to do the code refactoring first before adding
  new features
- Suggested by Anup and Atish, detect extensions from DT instead of
  menvcfg CSR
- Enable access to some extensions through menvcfg CSR if they are
  present in the device tree.

Yong-Xuan Wang (5):
  lib: sbi: Improve the code of privilege mode and extensions detection
  lib: sbi: Refactor the code for enable extensions in menvfg CSR
  lib: sbi: Using one array to define the name of extensions
  lib: sbi: Detect extensions from the ISA string in DT
  lib: sbi: Add support for Svadu extension

 include/sbi/riscv_encoding.h |   6 +-
 include/sbi/sbi_hart.h       |  15 +++
 lib/sbi/sbi_hart.c           | 226 +++++++++++++----------------------
 lib/utils/fdt/fdt_helper.c   |   5 +-
 4 files changed, 104 insertions(+), 148 deletions(-)

-- 
2.17.1


