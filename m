From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 12 Mar 2024 11:56:14 -0500
Subject: [PATCH v2 06/10] lib: sbi: Simplify parameters of
 sbi_illegal_insn_handler()
In-Reply-To: <20240312102804.1436376-7-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-7-apatel@ventanamicro.com>
Message-ID: <23092955-7829-4a8c-a442-cb01a0e412d4@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-03-12 5:28 AM, Anup Patel wrote:
> The struct sbi_trap_context already has the information needed by
> sbi_illegal_insn_handler() so directly pass struct sbi_trap_context
> pointer to this function.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_illegal_insn.h |  4 ++--
>  lib/sbi/sbi_illegal_insn.c     | 14 +++++++-------
>  lib/sbi/sbi_trap.c             |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


