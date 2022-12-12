From: Wei Liang Lim <weiliang.lim@starfivetech.com>
Date: Mon, 12 Dec 2022 13:40:15 +0800
Subject: [PATCH v3 0/3] generic/starfive: Enable Starfive JH7110 platform preferred boot hart implementation
Message-ID: <20221212054018.169408-1-weiliang.lim@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is patchset to enable Starfive JH7110 platform preferred boot hart implementation.

Anup Patel (2):
  lib: sbi: Allow platform to influence cold boot HART selection
  platform: generic: Allow platform_override to select cold boot HART

Wei Liang Lim (1):
  generic/starfive: Add Starfive JH7110 platform implementation

 include/sbi/sbi_platform.h                   | 20 +++++++++++++++
 lib/sbi/sbi_init.c                           |  7 +++--
 platform/generic/Kconfig                     |  4 +++
 platform/generic/configs/defconfig           |  1 +
 platform/generic/include/platform_override.h |  1 +
 platform/generic/platform.c                  |  9 +++++++
 platform/generic/starfive/jh7110.c           | 27 ++++++++++++++++++++
 platform/generic/starfive/objects.mk         |  6 +++++
 8 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 platform/generic/starfive/jh7110.c
 create mode 100644 platform/generic/starfive/objects.mk

-- 
2.25.1


