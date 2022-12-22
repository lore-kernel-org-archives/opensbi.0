From: Wei Liang Lim <weiliang.lim@starfivetech.com>
Date: Thu, 22 Dec 2022 16:44:40 +0800
Subject: [PATCH v5 0/4] generic/starfive: Enable Starfive JH7110 platform preferred cold boot HART implementation
Message-ID: <20221222084444.224301-1-weiliang.lim@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is patchset to enable Starfive JH7110 platform preferred cold boot HART implementation.
User has the option to specify preferred cold boot HART in the device tree. If unspecified, the existing lottery mechanism will be used.

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


