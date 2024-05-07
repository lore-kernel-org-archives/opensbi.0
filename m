From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 May 2024 17:36:56 +0530
Subject: [PATCH 0/7] lib: sbi: sse: fixes after review
In-Reply-To: <20240409100216.263256-1-cleger@rivosinc.com>
References: <20240409100216.263256-1-cleger@rivosinc.com>
Message-ID: <CAAhSdy2h=YatsK07UkgP+A3pwdB+EF7CZvZhiPBo=hDGttX5ZQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 9, 2024 at 3:32?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> This small series addresses a few comments from Samuel that were made
> after the series was merged.
>
> Cl?ment L?ger (7):
>   lib: sbi: sse: fix typos, comments and spacing errors
>   lib: sbi: sse: rename sse_hart_unlock() to sse_enabled_event_unlock()
>   lib: sbi: sse: simplify 32bits overflow check
>   lib: sbi: sse: remove superfluous sbi_list_empty() check
>   lib: sbi: sse: call enable callback before sending IPI
>   lib: sbi: sse: use PRV_S instead of hardcoded value for mode
>   lib: sbi: sse: check handler entry to belong to supervisor mode

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi/sbi_ecall_interface.h | 24 +++++++-------
>  lib/sbi/sbi_sse.c                 | 53 ++++++++++++++++---------------
>  2 files changed, 40 insertions(+), 37 deletions(-)
>
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

