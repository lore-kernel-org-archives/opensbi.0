From: Anup Patel <anup@brainfault.org>
Date: Sat, 17 Dec 2022 10:49:11 +0530
Subject: [PATCH v3 0/3] generic/starfive: Enable Starfive JH7110 platform
 preferred boot hart implementation
In-Reply-To: <20221212054018.169408-1-weiliang.lim@starfivetech.com>
References: <20221212054018.169408-1-weiliang.lim@starfivetech.com>
Message-ID: <CAAhSdy1vEvSepUwe6ZnXHLKFSDikyjoa9CR=KYboEmbS3tsyQw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 11:11 AM Wei Liang Lim
<weiliang.lim@starfivetech.com> wrote:
>
> This is patchset to enable Starfive JH7110 platform preferred boot hart implementation.
>
> Anup Patel (2):
>   lib: sbi: Allow platform to influence cold boot HART selection
>   platform: generic: Allow platform_override to select cold boot HART
>
> Wei Liang Lim (1):
>   generic/starfive: Add Starfive JH7110 platform implementation

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi/sbi_platform.h                   | 20 +++++++++++++++
>  lib/sbi/sbi_init.c                           |  7 +++--
>  platform/generic/Kconfig                     |  4 +++
>  platform/generic/configs/defconfig           |  1 +
>  platform/generic/include/platform_override.h |  1 +
>  platform/generic/platform.c                  |  9 +++++++
>  platform/generic/starfive/jh7110.c           | 27 ++++++++++++++++++++
>  platform/generic/starfive/objects.mk         |  6 +++++
>  8 files changed, 73 insertions(+), 2 deletions(-)
>  create mode 100644 platform/generic/starfive/jh7110.c
>  create mode 100644 platform/generic/starfive/objects.mk
>
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

