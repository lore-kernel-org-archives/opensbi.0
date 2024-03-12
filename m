From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 12 Mar 2024 11:56:36 -0500
Subject: [PATCH v2 09/10] lib: sbi: Pass trap context pointer to
 sbi_ecall_handler()
In-Reply-To: <20240312102804.1436376-10-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-10-apatel@ventanamicro.com>
Message-ID: <68040b53-71fb-4710-9480-402a4911c37c@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-03-12 5:28 AM, Anup Patel wrote:
> To be consistent with other trap handlers, pass trap context pointer
> to sbi_ecall_handler().
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_ecall.h | 4 ++--
>  lib/sbi/sbi_ecall.c     | 3 ++-
>  lib/sbi/sbi_trap.c      | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


