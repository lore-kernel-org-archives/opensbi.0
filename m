From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 10 Dec 2024 18:05:55 -0600
Subject: [PATCH v2 1/2] lib: utils/fdt_cppc_rpmi: Fix compile error with
 LLVM
In-Reply-To: <20241210052326.407237-2-apatel@ventanamicro.com>
References: <20241210052326.407237-1-apatel@ventanamicro.com>
 <20241210052326.407237-2-apatel@ventanamicro.com>
Message-ID: <83b75d8d-ff51-4e37-a07c-3aeee613c854@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-12-09 11:23 PM, Anup Patel wrote:
> The following error is observed when compiling fdt_cppc_rpmi
> driver using LLVM:
> 
> lib/utils/cppc/fdt_cppc_rpmi.c:87:3: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>    87 |                 u64 db_val_u64 = 0;
> 
> To fix the above issue, move the variable declaration at the
> start of function.
> 
> Fixes: 591a98bdd549 ("lib: utils/cppc: Add RPMI CPPC driver")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/cppc/fdt_cppc_rpmi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


