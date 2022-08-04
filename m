From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Aug 2022 09:50:30 +0200
Subject: [PATCH 1/5] include: Add mstatus[h].GVA encodings
In-Reply-To: <TYYP286MB1439864B586DF19ECB852514C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439C5C64BCF8E9DB7883772C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB1439864B586DF19ECB852514C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <20220804075030.zeg4tuf6dmy5yho7@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 04, 2022 at 11:17:02AM +0800, Vivian Wang wrote:
> The machine mode GVA field is in mstatus for RV64 and mstatush for RV32,
> and is available if the hypervisor extension is available. If an
> exception occurs, we may need to redirect the trap to HS-mode, in which
> case, hstatus.GVA should be set to same as the machine mode GVA bit.
> 
> Add MSTATUS_GVA for RV64, MSTATUSH_GVA for RV32, and their SHIFT
> encodings. The SHIFT index is helpful in assembly code, since field
> extraction can be implemented in only one register. In pseudocode:
> 
> - For RV32: gva = (mstatus >> MSTATUS_GVA_SHIFT) & 1;
> - For RV64: gva = (mstatush >> MSTATUSH_GVA_SHIFT) & 1;
> 
> Signed-off-by: Vivian Wang <dramforever@live.com>
> ---
>  include/sbi/riscv_encoding.h | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

