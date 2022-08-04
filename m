From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Aug 2022 09:51:17 +0200
Subject: [PATCH 2/5] lib: sbi_trap: Save mstatus[h].GVA in trap->gva
In-Reply-To: <TYYP286MB14395B93ADC0013820B8228CC69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439C5C64BCF8E9DB7883772C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20220804031706.2197187-1-dramforever@live.com>
 <TYYP286MB14395B93ADC0013820B8228CC69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <20220804075117.566h2ogozvflotad@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 04, 2022 at 11:17:03AM +0800, Vivian Wang wrote:
> The machine mode GVA field is available if the hypervisor extension is
> implemented, and indicates if mtval is a guest virtual address. Add a
> gva field to sbi_trap_info for this, and in __sbi_expected_trap_hext,
> save mstatus[h].GVA to it, so that gva indicates if tval is a guest
> virtual address. If the hypervisor extension is not implemented, always
> set gva to 0.
> 
> Signed-off-by: Vivian Wang <dramforever@live.com>
> ---
>  include/sbi/sbi_trap.h      |  6 +++++-
>  lib/sbi/sbi_expected_trap.S | 17 +++++++++++++++--
>  2 files changed, 20 insertions(+), 3 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

