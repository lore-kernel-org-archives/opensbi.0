From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 16 Dec 2024 15:48:22 -0600
Subject: [PATCH v4 1/5] lib: sbi: pmu: fix usage of sbi_pmu_irq_bit()
In-Reply-To: <20241216212144.3379890-2-cleger@rivosinc.com>
References: <20241216212144.3379890-1-cleger@rivosinc.com>
 <20241216212144.3379890-2-cleger@rivosinc.com>
Message-ID: <a1a66acb-aaaf-480e-b418-97ac06c61bad@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-12-16 3:21 PM, Cl?ment L?ger wrote:
> While sbi_pmu_irq_bit() was used to delegate irq to S-mode, LCOFIP usage
> was still hardcoded in various places. This lead to change the returned

typo: lead -> led

> value of sbi_pmu_irq_bit() to be a bit number rather than a bit mask
> since it returns an 'int' and we need to obtain the bit number itself to
> handle it in the IRQs handlers. Add a similar function to return the
> irq mask which can also be used where the mask is required rather than
> the bit itself.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  include/sbi/sbi_pmu.h                         |  3 ++
>  lib/sbi/sbi_hart.c                            |  2 +-
>  lib/sbi/sbi_pmu.c                             | 42 ++++++++++++-------
>  lib/sbi/sbi_trap.c                            | 15 ++++---
>  .../generic/include/thead/c9xx_encoding.h     |  1 -
>  platform/generic/thead/thead_c9xx_pmu.c       |  2 +-
>  6 files changed, 41 insertions(+), 24 deletions(-)

Looks great, thanks!

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


