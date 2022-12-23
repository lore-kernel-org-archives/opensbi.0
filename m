From: Wei Liang Lim <weiliang.lim@starfivetech.com>
Date: Fri, 23 Dec 2022 15:07:37 +0800
Subject: [PATCH v6 0/4] generic/starfive: Enable Starfive JH7110 platform preferred cold boot HART implementation
Message-ID: <20221223070741.236271-1-weiliang.lim@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is patchset to enable Starfive JH7110 platform preferred cold boot HART implementation.
User has the option to specify preferred cold boot HART in the device tree. If unspecified, the existing lottery mechanism will be used.

v5->v6:
- Minor changes on TRUE->true, FALSE->false.

v4->v5:
- Move FDT boot hart id reading from cold_boot_allowed() to fw_init()callback function.

v3->v4:
- Add implementation to allow user to specify preferred cold boot HART in the device tree. 
- If unspecified, the existing lottery mechanism will be used.

v3:
- Add Starfive JH7110 implementation.
- Anup's patches to allow platform specific selection of cold boot HART.

v2:
https://patchwork.ozlabs.org/project/opensbi/patch/20221202063845.14938-1-weiliang.lim at starfivetech.com/

v1:
https://patchwork.ozlabs.org/project/opensbi/patch/20221129052119.379830-1-weiliang.lim at starfivetech.com/

Anup Patel (2):
  lib: sbi: Allow platform to influence cold boot HART selection
  platform: generic: Allow platform_override to select cold boot HART

Wei Liang Lim (2):
  platform: generic: Allow platform_override to perform firmware init
  generic/starfive: Add Starfive JH7110 platform implementation

 include/sbi/sbi_platform.h                   | 20 +++++++++
 lib/sbi/sbi_init.c                           |  7 ++-
 platform/generic/Kconfig                     |  4 ++
 platform/generic/configs/defconfig           |  1 +
 platform/generic/include/platform_override.h |  2 +
 platform/generic/platform.c                  | 12 +++++
 platform/generic/starfive/jh7110.c           | 47 ++++++++++++++++++++
 platform/generic/starfive/objects.mk         |  6 +++
 8 files changed, 97 insertions(+), 2 deletions(-)
 create mode 100644 platform/generic/starfive/jh7110.c
 create mode 100644 platform/generic/starfive/objects.mk

-- 
2.25.1


