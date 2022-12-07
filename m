From: Xiang W <wxjstz@126.com>
Date: Thu, 08 Dec 2022 00:45:41 +0800
Subject: [PATCH 1/3] lib: fix is_region_valid()
In-Reply-To: <20221207140751.9135-2-heinrich.schuchardt@canonical.com>
References: <20221207140751.9135-1-heinrich.schuchardt@canonical.com>
	 <20221207140751.9135-2-heinrich.schuchardt@canonical.com>
Message-ID: <872b8692141f26a7cb02eeed034dfa55b091b451.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-12-07???? 15:07 +0100?Heinrich Schuchardt???
> For 'reg->order == __riscv_xlen' the term 'BIT(reg->order)' is undefined.
> 
> Addresses-Coverity-ID: 1529706 ("Bad bit shift operation")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> ?lib/sbi/sbi_domain.c | 9 +++++----
> ?1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 3302213..52ae1a1 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -146,11 +146,12 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
> ????????if (reg->order < 3 || __riscv_xlen < reg->order)
> ????????????????return FALSE;
> ?
> -???????if (reg->order == __riscv_xlen && reg->base != 0)
> -???????????????return FALSE;
> -
> -???????if (reg->base & (BIT(reg->order) - 1))
> +???????if (reg->order == __riscv_xlen) {
> +???????????????if (reg->base != 0)
> +???????????????????????return FALSE;
> +???????} else if (reg->base & (BIT(reg->order) - 1)) {
> ????????????????return FALSE;
> +???????}
> ?
> ????????return TRUE;
> ?}
> -- 
> 2.37.2
> 
> 
suggestion?

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 3302213..3205595 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -149,7 +149,7 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
        if (reg->order == __riscv_xlen && reg->base != 0)
                return FALSE;
 
-       if (reg->base & (BIT(reg->order) - 1))
+       if (reg->order < __riscv_xlen && (reg->base & (BIT(reg->order) - 1)))
                return FALSE;
 
        return TRUE;

Regards,
Xiang W


