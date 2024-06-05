From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed,  5 Jun 2024 20:11:08 +0800
Subject: [PATCH v4 0/2] Add Svade and Svadu extensions support
Message-ID: <20240605121110.14784-1-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series enables Svade and Svadu extensions support by configuring the
menvcfg CSR. Both of them control the hardware behavior when the PTE A/D
bits need to be set. Regrading the mailing thread[1], we have 4 possible
combinations of these extensions in the device tree, OpenSBI should
modifiy DT to specify the current hardware behavior before we have SBI
FWFT extension. The 4 possibilities are:

1. Neither svade nor svadu in DT: default to svade.
2. Only svade in DT: use svade.
3. Only svadu in DT: use svadu.
4. Both svade and svadu in DT: default to svade.

This series also add a FDT fixup patch to remove Svadu when both
extensions are present in DT.

[1] https://lore.kernel.org/linux-kernel/20240527-e9845c06619bca5cd285098c at orel/T/#m29644eb88e241ec282df4ccd5199514e913b06ee

---
v4:
- Add the Svade and Svadu support
- Add a FDT fixup patch (Alexandre)

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



Yong-Xuan Wang (2):
  lib: sbi: Add support for Svade and Svadu extensions
  lib: utils/fdt: fixup DT when both Svade and Svadu are in DT

 include/sbi/riscv_encoding.h |  1 +
 include/sbi/sbi_hart.h       |  4 ++
 lib/sbi/sbi_hart.c           | 12 ++++++
 lib/utils/fdt/fdt_fixup.c    | 71 +++++++++++++++++++++++++++++++++++-
 4 files changed, 86 insertions(+), 2 deletions(-)

-- 
2.17.1


