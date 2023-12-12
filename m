From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 12 Dec 2023 08:58:31 +0000
Subject: [PATCH v3 0/4] Add some programming improvements
Message-ID: <20231212085835.26824-1-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In earlier versions, this patchset included the Svadu extension
enablement. However, based on Anup's suggestion for backward
compatibility, it's advisable to utilize the FWFT SBI extension to
enable the Svade extension from S mode rather than unconditionally
enabling it in OpenSBI. Consequently, I've removed the Svadu patch
from this series. I will send a separate patch to activate the Svadu
extension once we have the FWFT SBI extension.

---
v3:
- Remove the Svadu patch
- Rebase to the latest OpenSBI

v2:
- Rearrange the patches to do the code refactoring first before adding
  new features
- Suggested by Anup and Atish, detect extensions from DT instead of
  menvcfg CSR
- Enable access to some extensions through menvcfg CSR if they are
  present in the device tree.

Yong-Xuan Wang (4):
  lib: sbi: Improve the code of privilege mode and extensions detection
  lib: sbi: Refactor the code for enable extensions in menvfg CSR
  lib: sbi: Using one array to define the name of extensions
  lib: sbi: Detect extensions from the ISA string in DT

 include/sbi/riscv_encoding.h |   5 -
 include/sbi/sbi_hart.h       |  13 +++
 lib/sbi/sbi_hart.c           | 220 +++++++++++++----------------------
 lib/utils/fdt/fdt_helper.c   |   6 +-
 4 files changed, 96 insertions(+), 148 deletions(-)

-- 
2.17.1


