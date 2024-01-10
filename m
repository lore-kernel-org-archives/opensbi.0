From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Jan 2024 11:11:00 +0530
Subject: [PATCH v3 0/8] Introduce support for SBI Debug Trigger Extension
In-Reply-To: <20240109170020.1731282-1-hchauhan@ventanamicro.com>
References: <20240109170020.1731282-1-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3WbcLHE2y8McpT6P5fHUgsb4mRCcVwrZNm-58rVarabQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 9, 2024 at 11:45?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> RISC-V Debug specification includes Sdtrig ISA extension
> which describes Trigger Module. Triggers can cause
> a breakpoint exception or trace action without execution
> of a special instruction. They can be used to implement
> hardware breakpoints and watchpoints for native debugging.
>
> The SBI Debug Trigger extension v6 can be found at:
> https://lists.riscv.org/g/tech-debug/topic/99825362#1302
>
> This patch is an initial implementation of SBI Debug Trigger
> Extension(v6) in OpenSBI. It is based on similar patchset
> from Sergey Matyukevich.
> (http://lists.infradead.org/pipermail/opensbi/2022-October/003531.html)
>
> The following features are supported:
> * mcontrol, mcontrol6 triggers
> * Breakpoint and trace actions
>
> Linux Kernel Branch (Breakpoint driver support):
> https://github.com/hschauhan/riscv-linux/tree/sdtrig-v6
>
> NOTE: Chained triggers are not supported
>
> Changes from v2:
>   - Detection of sdtrig support (via trap and ISA string)
>   - Removed redundant functions (sdtrig supports and get total triggers)
>   - Removed check for S-mode
>   - Skip the debug trigger probing if already probed for CPU (warm boot)
>
> Changes from v1:
>   - Rebased to latest OpenSBI master
>   - Other cosmetic changes as per the comments
>
> Himanshu Chauhan (8):
>   include: sbi: Introduce common endianess conversion macro
>   include: sbi: Add TINFO debug trigger CSR
>   include: sbi: Introduce debug trigger register encodings
>   lib: sbi: Detect support of debug triggers
>   lib: sbi: Introduce the SBI debug triggers extension support
>   include: sbi: Add SBI debug trigger extension related defines
>   lib: sbi: Implement SBI debug trigger extension
>   lib: sbi: Print number of debug triggers found

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi/riscv_dbtr.h          | 249 ++++++++++
>  include/sbi/riscv_encoding.h      |   1 +
>  include/sbi/sbi_byteorder.h       |  10 +
>  include/sbi/sbi_dbtr.h            | 128 ++++++
>  include/sbi/sbi_ecall_interface.h |  11 +
>  include/sbi/sbi_hart.h            |   2 +
>  lib/sbi/Kconfig                   |   4 +
>  lib/sbi/objects.mk                |   4 +
>  lib/sbi/sbi_dbtr.c                | 739 ++++++++++++++++++++++++++++++
>  lib/sbi/sbi_ecall_dbtr.c          |  73 +++
>  lib/sbi/sbi_hart.c                |   4 +
>  lib/sbi/sbi_init.c                |  11 +
>  12 files changed, 1236 insertions(+)
>  create mode 100644 include/sbi/riscv_dbtr.h
>  create mode 100644 include/sbi/sbi_dbtr.h
>  create mode 100644 lib/sbi/sbi_dbtr.c
>  create mode 100644 lib/sbi/sbi_ecall_dbtr.c
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

