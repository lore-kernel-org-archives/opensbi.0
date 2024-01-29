From: Xiang W <wxjstz@126.com>
Date: Tue, 30 Jan 2024 01:08:41 +0800
Subject: [PATCH 2/3] include: sbi: rename sbi_misaligned_ldst.h to
 sbi_trap_ldst.h
In-Reply-To: <1706482388-533855-3-git-send-email-ganboing@gmail.com>
References: <1706482388-533855-1-git-send-email-ganboing@gmail.com>
	 <1706482388-533855-3-git-send-email-ganboing@gmail.com>
Message-ID: <9431d70bcc15e4596ea2fce873a8e8f54f4f22da.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-01-28???? 14:53 -0800?Bo Gan???
> Signed-off-by: Bo Gan <ganboing@gmail.com>

LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?include/sbi/{sbi_misaligned_ldst.h => sbi_trap_ldst.h} | 0
> ?lib/sbi/sbi_trap.c???????????????????????????????????? | 2 +-
> ?lib/sbi/sbi_trap_ldst.c??????????????????????????????? | 2 +-
> ?3 files changed, 2 insertions(+), 2 deletions(-)
> ?rename include/sbi/{sbi_misaligned_ldst.h => sbi_trap_ldst.h} (100%)
> 
> diff --git a/include/sbi/sbi_misaligned_ldst.h b/include/sbi/sbi_trap_ldst.h
> similarity index 100%
> rename from include/sbi/sbi_misaligned_ldst.h
> rename to include/sbi/sbi_trap_ldst.h
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index dbf307c..145db4b 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -17,7 +17,7 @@
> ?#include <sbi/sbi_illegal_insn.h>
> ?#include <sbi/sbi_ipi.h>
> ?#include <sbi/sbi_irqchip.h>
> -#include <sbi/sbi_misaligned_ldst.h>
> +#include <sbi/sbi_trap_ldst.h>
> ?#include <sbi/sbi_pmu.h>
> ?#include <sbi/sbi_scratch.h>
> ?#include <sbi/sbi_timer.h>
> diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
> index aa512de..be9a394 100644
> --- a/lib/sbi/sbi_trap_ldst.c
> +++ b/lib/sbi/sbi_trap_ldst.c
> @@ -11,7 +11,7 @@
> ?#include <sbi/riscv_encoding.h>
> ?#include <sbi/riscv_fp.h>
> ?#include <sbi/sbi_error.h>
> -#include <sbi/sbi_misaligned_ldst.h>
> +#include <sbi/sbi_trap_ldst.h>
> ?#include <sbi/sbi_pmu.h>
> ?#include <sbi/sbi_trap.h>
> ?#include <sbi/sbi_unpriv.h>


