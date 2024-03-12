From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 12 Mar 2024 11:55:52 -0500
Subject: [PATCH v2 05/10] lib: sbi: Simplify parameters of misaligned and
 access fault handlers
In-Reply-To: <20240312102804.1436376-6-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-6-apatel@ventanamicro.com>
Message-ID: <6e2fbd8c-a0bd-4d1e-b20b-374a7863895c@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-03-12 5:27 AM, Anup Patel wrote:
> The struct sbi_trap_context already has the information needed by
> misaligned load/store and access fault load/store handlers so directly
> pass struct sbi_trap_context pointer to these functions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_trap_ldst.h | 12 +++----
>  lib/sbi/sbi_trap.c          |  8 ++---
>  lib/sbi/sbi_trap_ldst.c     | 67 ++++++++++++++++++-------------------
>  3 files changed, 40 insertions(+), 47 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


