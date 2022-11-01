From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Nov 2022 12:11:21 +0800
Subject: [PATCH RFC v1 1/1] lib: sbi: add support for debug triggers
In-Reply-To: <20221031211859.910439-1-geomatsi@gmail.com>
References: <20221031211859.910439-1-geomatsi@gmail.com>
Message-ID: <CAEUhbmWDqCtb9ZifTTq2yPR=H_5a70msprvcWAyU3QKDLdMS2w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Sergey,

On Tue, Nov 1, 2022 at 5:20 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> RISC-V Debug specification includes Sdtrig ISA extension.
> This extension describes Trigger Module. Triggers can cause
> a breakpoint exception, entry into Debug Mode, or a trace
> action without having to execute a special instruction. For
> native debugging triggers can be used to implement hardware
> breakpoints and watchpoints.
>
> Software support for RISC-V hardware triggers consists of the
> following major components:
> - U-mode: gdb support for setting hw breakpoints/watchpoints
> - S/VS-mode: hardware breakpoints framework in Linux kernel

Do you have WIP patches for gdb and Linux kernel?

> - M-mode: SBI firmware code to handle triggers
>
> SBI Debug Trigger extension proposal (draft v4) has been posted
> by Anup Patel to lists.riscv.org tech-debug mailing list:
>
> https://lists.riscv.org/g/tech-debug/topic/92375492

I believe this patch won't be merged until the SBI spec has been ratified?

>
> This patch provides initial implementation of SBI Debug
> Trigger Extension in OpenSBI library based on the
> suggested extension proposal.
>
> Initial implementation has the following limitations:
> - only mcontrol6 trigger type is supported

I would suggest add type 2 trigger support too, since it's the one
that SiFive FU540/740 supports.

> - no support for chained triggers
> - trigger update supports only address change
>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> ---
>  include/sbi/riscv_dbtr.h          |  78 ++++++
>  include/sbi/riscv_encoding.h      |   1 +
>  include/sbi/sbi_dbtr.h            |  79 ++++++
>  include/sbi/sbi_ecall_interface.h |  10 +
>  lib/sbi/Kconfig                   |   4 +
>  lib/sbi/objects.mk                |   3 +
>  lib/sbi/sbi_dbtr.c                | 404 ++++++++++++++++++++++++++++++
>  lib/sbi/sbi_ecall_dbtr.c          |  68 +++++
>  lib/sbi/sbi_init.c                |   9 +
>  9 files changed, 656 insertions(+)
>  create mode 100644 include/sbi/riscv_dbtr.h
>  create mode 100644 include/sbi/sbi_dbtr.h
>  create mode 100644 lib/sbi/sbi_dbtr.c
>  create mode 100644 lib/sbi/sbi_ecall_dbtr.c
>

Regards,
Bin

