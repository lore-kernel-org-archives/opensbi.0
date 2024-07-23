From: Ben Zong-You Xie <ben717@andestech.com>
Date: Tue, 23 Jul 2024 15:57:24 +0800
Subject: [PATCH 0/4] Add Andes PMA related SBI calls
Message-ID: <20240723075728.587110-1-ben717@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Programmable physical memory attributes(PPMA) is a PMA-related feature for
Andes. PPMA allows dynamic adjustment of memory attributes in the runtime.
It contains a configurable amount of PMA entries implemented as CSRs to
control the attributes of memory locations in interest. For example, device
drivers can set memory regions as non-cacheable if necessary. For more
information, refer to the section 10.3 in [1].

This patch series adds three Andes PPMA SBI calls. These SBI calls provides
a way to dynamically set/reset memory attributes in the runtime. For more
technical details, see the individual commit messages.

[1] https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf

Ben Zong-You Xie (4):
  platform: generic: Kconfig: add the description for Andes PMA feature
  platform: generic: andes: add a new Andes SBI call to probe Andes PMA
    feature
  platform: generic: andes: add a new Andes SBI call to set up a PMA
    entry
  platform: generic: andes: add a new Andes SBI call to free a PMA entry

 platform/generic/Kconfig                   |   1 +
 platform/generic/andes/Kconfig             |   5 +
 platform/generic/andes/ae350.c             |   2 +
 platform/generic/andes/andes_pma.c         | 181 +++++++++++++++++++--
 platform/generic/andes/andes_sbi.c         |  18 +-
 platform/generic/include/andes/andes_pma.h |  43 ++++-
 6 files changed, 228 insertions(+), 22 deletions(-)

-- 
2.34.1


