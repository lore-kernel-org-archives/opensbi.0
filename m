From: Xiang W <wxjstz@126.com>
Date: Sat, 03 Jun 2023 23:59:55 +0800
Subject: [PATCH v2 1/1] lib: utils/ipi: buffer overrun
 aclint_mswi_cold_init
In-Reply-To: <20230529092720.20294-1-heinrich.schuchardt@canonical.com>
References: <20230529092720.20294-1-heinrich.schuchardt@canonical.com>
Message-ID: <bfa17717d010b036cd2ef5bfcc420116cb6a2163.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-05-29???? 11:27 +0200?Heinrich Schuchardt???
> The parameter checks in aclint_mswi_cold_init() don't guard against a
> buffer overrun.
> 
> mswi_hartid2data is defined as an array of SBI_HARTMASK_MAX_BITS entries.
> The current check allows
> 
> ??? mswi->hart_count = ACLINT_MSWI_MAX_HARTS
> ??? mswi->first_hartid = SBI_HARTMASK_MAX_BITS - 1.
> 
> With these values mswi_hartid2data will be accessed at index
> 
> ??? SBI_HARTMASK_MAX_BITS + SBI_HARTMASK_MAX_BITS - 2.
> 
> We have to check the sum of mswi->first_hartid and mswi->hart_count.
> 
> Furthermore mswi->hart_count = 0 would not make much sense.
> 
> Addresses-Coverity-ID: 1529705 ("Out-of-bounds write")
> Fixes: 5a049fe1d6a5 ("lib: utils/ipi: Add ACLINT MSWI library")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> v2:
> ????????add missing 'Fixes:'
> ---
> ?lib/utils/ipi/aclint_mswi.c | 4 ++--
> ?1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
> index 6b004cb..ac8570b 100644
> --- a/lib/utils/ipi/aclint_mswi.c
> +++ b/lib/utils/ipi/aclint_mswi.c
> @@ -75,8 +75,8 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
> ????????/* Sanity checks */
> ????????if (!mswi || (mswi->addr & (ACLINT_MSWI_ALIGN - 1)) ||
> ??????????? (mswi->size < (mswi->hart_count * sizeof(u32))) ||
> -?????????? (mswi->first_hartid >= SBI_HARTMASK_MAX_BITS) ||
> -?????????? (mswi->hart_count > ACLINT_MSWI_MAX_HARTS))
> +?????????? (mswi->first_hartid + mswi->hart_count > SBI_HARTMASK_MAX_BITS) ||
> +?????????? (!mswi->hart_count || mswi->hart_count > ACLINT_MSWI_MAX_HARTS))
> ????????????????return SBI_EINVAL;
> ?
> ????????/* Update MSWI hartid table */
> -- 
> 2.39.2
> 
> 


