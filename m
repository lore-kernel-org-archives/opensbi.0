From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 5 Sep 2022 15:06:49 +0200
Subject: [PATCH 1/2] lib: sbi_trap: Add helper to get GVA in sbi_trap_regs
In-Reply-To: <OSZP286MB1435D1AC5E6B71A83041BE1DC67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
References: <OSZP286MB1435E0C79F99B144BC99F8F2C67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
 <OSZP286MB1435D1AC5E6B71A83041BE1DC67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <20220905130649.ne65vtlu6wk5dn4i@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 02, 2022 at 11:48:34PM +0800, Vivian Wang wrote:
> The GVA bit is in mstatus on RV64, and in mstatush in RV32. Refactor
> code handling this in sbi_trap_handler into a helper function to extract
> GVA from sbi_trap_regs, so that future code accessing GVA can be
> XLEN-agnostic.
> 
> Signed-off-by: Vivian Wang <dramforever@live.com>
> ---
>  include/sbi/sbi_trap.h | 18 ++++++++++++++++++
>  lib/sbi/sbi_trap.c     | 14 +-------------
>  2 files changed, 19 insertions(+), 13 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

