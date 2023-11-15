From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Nov 2023 09:03:44 +0530
Subject: [PATCH v2 0/4] platform: generic: Add Sophgo sg2042 support
In-Reply-To: <IA1PR20MB4953161DEC2C623255ECD357BBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <CAAhSdy1HRNAE6g1cTi_i3fRf1hJjp4oPfF-KnjPg77qq-yzivA@mail.gmail.com>
 <IA1PR20MB4953161DEC2C623255ECD357BBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy31_S5NHTAWQTWPjxfzWZGZHQsBgOLHqGdYHQ_TUB35tQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 15, 2023 at 4:51?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> >On Sun, Oct 8, 2023 at 5:46?PM Inochi Amaoto <inochiama@outlook.com> wrote:
> >>
> >> As the dts of sg2042 in the mainline kernel is considered as stable, it is
> >> time to port sg2042 soc.
> >>
> >> This patch depends other two series:
> >> 1. platform: generic: add T-HEAD th1520 soc support
> >> 2. lib: sbi: Add sub-regions check for sanitizing domain
> >>
> >> Link: https://lore.kernel.org/linux-riscv/cover.1696433229.git.unicorn_wang at outlook.com/
> >>
> >> Changed from v1:
> >> 1. make number of entries in tlb fifo auto deteted.
> >>
> >> Inochi Amaoto (4):
> >>   lib: utils/timer: mtimer: add separate T-Head C9xx CLINT mtimer
> >>     compatible
> >>   lib: utils/ipi: mswi: add separate T-Head C9xx CLINT mswi compatible
> >>   platform: Allow platform uses hart count as the size of tlb info
> >>   platform: generic: Add Sophgo sg2042 platform support
> >
> >There are unaddressed comments in this series. I assume there will
> >be a v3.
> >
>
> There is already a v3 version. but the patch is splitted since v3, as the
> aclint driver may evolve a lot.
>
> the latest version of each patch is:
> 1. the patch 1-2
> https://lists.infradead.org/pipermail/opensbi/2023-October/005736.html
> 2. the patch 3
> https://lists.infradead.org/pipermail/opensbi/2023-October/005719.html
> 3. the patch 4
> https://lists.infradead.org/pipermail/opensbi/2023-October/005760.html

I had applied v3 patches but accidentally replied to v2 series. Sorry
for the noise.

Regards,
Anup

>
> >Regards,
> >Anup
> >
> >>
> >>  lib/utils/ipi/fdt_ipi_mswi.c       |  1 +
> >>  lib/utils/timer/fdt_timer_mtimer.c |  2 +
> >>  platform/generic/Kconfig           |  6 +++
> >>  platform/generic/configs/defconfig |  1 +
> >>  platform/generic/platform.c        |  7 ++++
> >>  platform/generic/sophgo/objects.mk |  9 +++++
> >>  platform/generic/sophgo/sg2042.c   | 64 ++++++++++++++++++++++++++++++
> >>  7 files changed, 90 insertions(+)
> >>  create mode 100644 platform/generic/sophgo/objects.mk
> >>  create mode 100644 platform/generic/sophgo/sg2042.c
> >>
> >> --
> >> 2.42.0
> >>
> >>
> >> --
> >> opensbi mailing list
> >> opensbi at lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/opensbi
> >

