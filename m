From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 16:59:42 +0530
Subject: [PATCH v3 0/3] lib: utils: Add T-HEAD C900 ACLINT
In-Reply-To: <IA1PR20MB495397CC87AD8A595B45131CBBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495397CC87AD8A595B45131CBBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy0rc4iQ4wV74prW2DOvrKV6kKW+8SGsYWDEYTp2R9y6pw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 16, 2023 at 2:35?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Add T-HEAD C900 ACLINT driver for sg2042
>
> This patch need a new "reg-names" based timer register parsing to get
> worked register. But this patch can be tested by manually setting regs
> in the DT and temporarily setting without_mtimer quirks.
>
> Link: https://lore.kernel.org/linux-riscv/6e48cbe5e60f9ada2fd1fe58e803e127f1a678e5.1696433229.git.unicorn_wang at outlook.com/
> Link: https://lore.kernel.org/linux-riscv/1f6b82a1864477a51db33d3f295889ff985b497b.1696433229.git.unicorn_wang at outlook.com/
>
> Changed from v2:
> 1. use new quirk to identify custom ACLINT
>
> Changed from v1:
> 1. function fix and comment cleanup.
>
> Changed from sg2042 v2:
> 1. Allow ACLINT has its own quirks
> 2. add new quirks for thead,c900-aclint-mtimer
>
> This patch is moved from the patch series of supporting sg2042 as it
> became complex.
> The original patch: platform: generic: Add Sophgo sg2042 support
>
> Inochi Amaoto (3):
>   lib: utils/timer: Allow ACLINT MTIMER driver to setup quirks
>   lib: utils/timer: mtimer: add separate T-Head C9xx CLINT mtimer
>     compatible
>   lib: utils/ipi: mswi: add separate T-Head C9xx CLINT mswi compatible

The "custom_aclint" flag in quirks was looking odd so I renamed it
to "is_clint" flag and did relevant changes at the time of merging this
series.

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  lib/utils/ipi/fdt_ipi_mswi.c       |  1 +
>  lib/utils/timer/fdt_timer_mtimer.c | 20 +++++++++++++++-----
>  2 files changed, 16 insertions(+), 5 deletions(-)
>
> --
> 2.42.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

