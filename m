From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 11 Jun 2021 08:34:25 +0000
Subject: [PATCH 1/1] lib: sbi_scratch: zero out scratch memory on all harts
In-Reply-To: <20210605122243.20277-1-xypron.glpk@gmx.de>
References: <20210605122243.20277-1-xypron.glpk@gmx.de>
Message-ID: <CO6PR04MB7812727DE8859D1915C919EB8D349@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: 05 June 2021 17:53
> To: opensbi at lists.infradead.org
> Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel <Anup.Patel@wdc.com>;
> Heinrich Schuchardt <xypron.glpk@gmx.de>
> Subject: [PATCH 1/1] lib: sbi_scratch: zero out scratch memory on all harts
> 
> In sbi_scratch_init() we determine the last hart. The index of the last hart
> cannot exceed SBI_HARTMASK_MAX_BITS - 1. We should not initialize
> last_hartid_having_scratch to a higher number to avoid buffer overflows
> when using this value before calling sbi_scratch_init().
> 
> When allocating scratch memory in sbi_scratch_alloc_offset() we zero out the
> allocated memory for all harts except for the last one. We should not skip the
> last hart.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Good catch.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
>  lib/sbi/sbi_scratch.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c index
> 7cf5b43..87b34c6 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -14,7 +14,7 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
> 
> -u32 last_hartid_having_scratch = SBI_HARTMASK_MAX_BITS;
> +u32 last_hartid_having_scratch = SBI_HARTMASK_MAX_BITS - 1;
>  struct sbi_scratch *hartid_to_scratch_table[SBI_HARTMASK_MAX_BITS] = {
> 0 };
> 
>  static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER; @@ -74,7 +74,7 @@
> done:
>  	spin_unlock(&extra_lock);
> 
>  	if (ret) {
> -		for (i = 0; i < sbi_scratch_last_hartid(); i++) {
> +		for (i = 0; i <= sbi_scratch_last_hartid(); i++) {
>  			rscratch = sbi_hartid_to_scratch(i);
>  			if (!rscratch)
>  				continue;
> --
> 2.30.2


