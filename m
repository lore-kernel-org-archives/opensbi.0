From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 24 Mar 2025 17:15:57 +0100
Subject: [PATCH 1/6] lib: sbi: sse: Update SSE event ids
In-Reply-To: <20250317105426.631243-2-cleger@rivosinc.com>
References: <20250317105426.631243-1-cleger@rivosinc.com>
 <20250317105426.631243-2-cleger@rivosinc.com>
Message-ID: <20250324-74773cdccf197e68d71582b8@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025 at 11:54:19AM +0100, Cl?ment L?ger wrote:
> The latest specification added new high priority RAS events and renamed
> the PMU to PMU_OVERFLOW.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  include/sbi/sbi_ecall_interface.h | 44 ++++++++++++++++++++++++-------
>  lib/sbi/sbi_pmu.c                 |  4 +--
>  lib/sbi/sbi_sse.c                 |  8 +++---
>  3 files changed, 42 insertions(+), 14 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

