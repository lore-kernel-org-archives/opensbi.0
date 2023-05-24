From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 May 2023 13:00:00 +0530
Subject: [RFC PATCH 0/2] lib: reset: thead: Correct dts naming convention
In-Reply-To: <20230523094649.4100554-1-guoren@kernel.org>
References: <20230523094649.4100554-1-guoren@kernel.org>
Message-ID: <CAAhSdy1f90DsYUYOf6NkH+-zJ_Vu-quYHkzLMV9xa28W8EKEVw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 23, 2023 at 3:17?PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Correct the naming convention to fit Linux kernel upstream rule.
>
> Link: https://lore.kernel.org/linux-riscv/CAJF2gTRG5edPnVmhMtv67OANpOynL0br0wcrQCave88_KkyZcg at mail.gmail.com/

PATCH1 fine so that can be taken but for PATCH2 we should
wait for  DT bindings to be accepted.

Regards,
Anup

>
> Guo Ren (2):
>   lib: reset: thead: Remove unnecessary fence operations
>   lib: reset: thead: Correct the naming convention of dts
>
>  docs/platform/thead-c9xx.md           | 21 ++++------
>  lib/utils/reset/fdt_reset_thead.c     | 58 +++++++++++++--------------
>  lib/utils/reset/fdt_reset_thead_asm.S |  2 -
>  3 files changed, 35 insertions(+), 46 deletions(-)
>
> --
> 2.36.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

