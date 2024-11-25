From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 25 Nov 2024 13:32:48 +0100
Subject: [PATCH 0/2] lib: sbi: fixes a few SSE errors
In-Reply-To: <20241125105303.1113607-1-cleger@rivosinc.com>
References: <20241125105303.1113607-1-cleger@rivosinc.com>
Message-ID: <20241125-8c773e1f79143df13c7e2e07@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 25, 2024 at 11:52:58AM +0100, Cl?ment L?ger wrote:
> While reviewing kvm-unit-tests, Andrew Jones found a few implementation
> errors. This small series fixes them.
> 
> Cl?ment L?ger (2):
>   lib: sbi: fix GLOBAL_PLAT_DEFINE
>   lib: sbi: sse: Fix a6 and a7 register content upon injection
> 
>  include/sbi/sbi_ecall_interface.h | 4 ++--
>  lib/sbi/sbi_sse.c                 | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> -- 
> 2.45.2
>

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

