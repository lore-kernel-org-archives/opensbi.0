From: Bo Gan <ganboing@gmail.com>
Date: Wed, 8 Nov 2023 00:09:52 -0800
Subject: [PATCH] lib: sbi: Remove xchg/cmpxchg implemented via lr/sc
In-Reply-To: <20231108032859.159198-1-wxjstz@126.com>
References: <20231108032859.159198-1-wxjstz@126.com>
Message-ID: <d50c455f-fb4c-4e63-c256-61af74cf8c9b@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/7/23 7:28 PM, Xiang W wrote:
> lr/sc is part of the A extension. If the A extension is not supported,
> lr/sc cannot be used. So remove xchg/cmpxchg.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>   lib/sbi/riscv_atomic.c | 106 ++---------------------------------------
>   1 file changed, 4 insertions(+), 102 deletions(-)
>
> diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
> index 528686f..a143218 100644
> --- a/lib/sbi/riscv_atomic.c
> +++ b/lib/sbi/riscv_atomic.c
> @@ -12,6 +12,10 @@
>   #include <sbi/riscv_atomic.h>
>   #include <sbi/riscv_barrier.h>
>   +#ifndef __riscv_atomic
> +#error "opensbi strongly relies on the A extension of RISC-V"
> +#endif
> +
>   long atomic_read(atomic_t *atom)
>   {
Hi Xiang,

I like this patch. I'm new to OpenSBI mailing list, but I've been studying JH7110 (U74) for a while.
I just want to add one more thing. Even if A extension is supported, we might still not able to use
lr/sc. The U74MC has 1 S7 (M/U nommu) core and 4 U7 core (M/S/U). In the U74MC core complex manual
https://starfivetech.com/uploads/u74mc_core_complex_manual_21G1.pdf, Chapter 3.6 states that the S7
core does not have data cache, and LR/SC will generate a precise access exception, thus the only way
for S7 and U7 to synchronize is amo.

My advise is, if for any reason, that we decided to keep lr/sc, perhaps we can consider make it an
optional feature that by default disable, but can be enabled at build time -- to make everyone happy.

Bo

