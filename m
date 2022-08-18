From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 18 Aug 2022 19:08:48 +0200
Subject: [PATCH] lib: sbi: Use the official extension name for AIA M-mode
 CSRs
In-Reply-To: <20220818150703.143168-1-apatel@ventanamicro.com>
References: <20220818150703.143168-1-apatel@ventanamicro.com>
Message-ID: <20220818170848.v5bpjzhcynyzvfea@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 18, 2022 at 08:37:03PM +0530, Anup Patel wrote:
> The arch review of AIA spec is completed and we now have official
> extension names for AIA: Smaia (M-mode AIA CSRs) and Ssaia (S-mode
> AIA CSRs).
> 
> Refer, section 1.6 of the latest AIA v0.3.1 stable specification at
> https://github.com/riscv/riscv-aia/releases/download/0.3.1-draft.32/riscv-interrupts-032.pdf)
> 
> Based on above, we update generic library to use "Smaia" extension
> name for AIA M-mode CSRs.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_hart.h | 4 ++--
>  lib/sbi/sbi_hart.c     | 8 ++++----
>  lib/sbi/sbi_trap.c     | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

