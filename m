From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 13 Sep 2024 13:08:59 -0500
Subject: [PATCH v2 4/6] lib: sbi: fwft: factorize menvcfg read/write
In-Reply-To: <20240913143419.3258868-5-cleger@rivosinc.com>
References: <20240913143419.3258868-1-cleger@rivosinc.com>
 <20240913143419.3258868-5-cleger@rivosinc.com>
Message-ID: <c17bb347-bd91-4b2e-9347-bd3fce23131d@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-13 9:34 AM, Cl?ment L?ger wrote:
> MENVCFG access will be used as well for double trap, landing pad and
> shadow stack fwft support. Factorize that in a common function.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  include/sbi/riscv_encoding.h |  3 +-
>  lib/sbi/sbi_fwft.c           | 62 +++++++++++++++++++++---------------
>  2 files changed, 38 insertions(+), 27 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


