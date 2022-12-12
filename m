From: Samuel Holland <samuel@sholland.org>
Date: Mon, 12 Dec 2022 00:57:34 -0600
Subject: [PATCH v3 4/5] lib: utils/irqchip: plic: Fix the off-by-one error
 in context save/restore helpers
In-Reply-To: <20221211065424.806478-4-bmeng@tinylab.org>
References: <20221211065424.806478-1-bmeng@tinylab.org>
 <20221211065424.806478-4-bmeng@tinylab.org>
Message-ID: <bf5bb572-085e-6591-bfa1-641cbdd44bda@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/11/22 00:54, Bin Meng wrote:
> plic->num_src holds the number of interrupt sources without interrupt
> source 0 but the interrupt enable register includes a bit for the
> interrupt source 0 in the first word.

On the other hand, it is not really feasible to exclude the first bit
here, so maybe it makes sense to leave patch 1 as it is for consistency.

> Fixes: 415ecf28f7ad ("lib: irqchip/plic: Add context save/restore helpers")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - new patch: lib: utils/irqchip: plic: Fix the off-by-one error in context save/restore helpers
> 
>  lib/utils/irqchip/plic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>


