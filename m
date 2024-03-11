From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Mar 2024 10:59:09 +0530
Subject: [PATCH v4 0/7] Allow platform to handle load/store faults
In-Reply-To: <1709692540-77803-1-git-send-email-ganboing@gmail.com>
References: <1709692540-77803-1-git-send-email-ganboing@gmail.com>
Message-ID: <CAAhSdy2t2A_sWW1EWsL39SP+BcW4SfrUHce8OOd7iEeXe9f=yg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 6, 2024 at 8:06?AM Bo Gan <ganboing@gmail.com> wrote:
>
> Sometimes a platform wants to trap-n-emulate special devices or filter
> access to physical devices. This patch makes sbi_trap_handler to call
> platform_ops.emulate_load/store and ask platform to fixup the fault.
>
> v4 changes:
> -  Addressed comments from Anup -- sbi_trap related details should
>    not be visable to platform code.
> -  Minor fixes -- splitting patches and renames suggested by Anup.
>
> v3 changes:
> -  Addressed comments from Anup by breaking down the patchset and
>    new sbi_platform_emulate_load/store helper functions.
> -  Reworked the return value of sbi_trap_ld/st_emulator to support
>    (>0) successful emulation (==0) trap_redirect (<0) real failure.
>
> v2 changes:
> -  Added const qualifier to *orig_trap on load/store fault handlers.
>    That addressed Xiang W's comment.
> -  Applied clang-format to changed lines.
>
> Bo Gan (7):
>   lib: sbi: rename sbi_misaligned_ldst.c to sbi_trap_ldst.c
>   include: sbi: rename sbi_misaligned_ldst.h to sbi_trap_ldst.h
>   lib: sbi: change prototype of sbi_trap_redirect
>   lib: sbi: change prototype of sbi_misaligned_load/store_handler
>   lib: sbi: abstract out insn decoding to unify mem fault handlers
>   include: sbi: add emulate_load/store handler to platform ops
>   lib: sbi: call platform load/store emulators

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi/sbi_misaligned_ldst.h                  |  23 ---
>  include/sbi/sbi_platform.h                         |  53 +++++
>  include/sbi/sbi_trap.h                             |   2 +-
>  include/sbi/sbi_trap_ldst.h                        |  35 ++++
>  lib/sbi/objects.mk                                 |   2 +-
>  lib/sbi/sbi_trap.c                                 |  38 ++--
>  lib/sbi/{sbi_misaligned_ldst.c => sbi_trap_ldst.c} | 213 +++++++++++++++------
>  7 files changed, 265 insertions(+), 101 deletions(-)
>  delete mode 100644 include/sbi/sbi_misaligned_ldst.h
>  create mode 100644 include/sbi/sbi_trap_ldst.h
>  rename lib/sbi/{sbi_misaligned_ldst.c => sbi_trap_ldst.c} (54%)
>
> --
> 2.7.4
>

