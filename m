From: Xiang W <wxjstz@126.com>
Date: Tue, 15 Feb 2022 00:48:02 +0800
Subject: [PATCH 2/3] lib: sbi: verbose sbi_domain_root_add_memregion
In-Reply-To: <20220211111155.16121-3-nikita.shubin@maquefel.me>
References: <20220211111155.16121-1-nikita.shubin@maquefel.me>
 <20220211111155.16121-3-nikita.shubin@maquefel.me>
Message-ID: <36673ab226c7c3e44e91275c9d80c4d4936ea852.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-02-11???? 14:11 +0300?Nikita Shubin???
> From: Nikita Shubin <n.shubin@yadro.com>
> 
> Be more verbose on region confict, print addresses in conflict.
> 
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
Look good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?include/sbi/sbi_domain.h | 4 +++-
> ?lib/sbi/sbi_domain.c???? | 8 ++++++--
> ?2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index 15e3a53..b90f59c 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -174,7 +174,9 @@ int sbi_domain_register(struct sbi_domain *dom,
> ? * Add a memory region to the root domain
> ? * @param reg pointer to the memory region to be added
> ? *
> - * @return 0 on success and negative error code on failure
> + * @return 0 on success
> + * @return SBI_EALREADY if memory region conflicts with existing
> + * @return SBI_EINVAL otherwise
> ? */
> ?int sbi_domain_root_add_memregion(const struct sbi_domain_memregion
> *reg);
> ?
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index a1ac1bb..4e4c1e1 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -471,8 +471,12 @@ int sbi_domain_root_add_memregion(const struct
> sbi_domain_memregion *reg)
> ?
> ????????/* Check for conflicts */
> ????????sbi_domain_for_each_memregion(&root, nreg) {
> -???????????????if (is_region_conflict(reg, nreg))
> -???????????????????????return SBI_EINVAL;
> +???????????????if (is_region_conflict(reg, nreg)) {
> +???????????????????????sbi_printf("%s: is_region_conflict check
> failed"
> +???????????????????????" 0x%lx conflicts existing 0x%lx\n", __func__,
> +????????????????????????????????? reg->base, nreg->base);
> +???????????????????????return SBI_EALREADY;
> +???????????????}
> ????????}
> ?
> ????????/* Append the memregion to root memregions */
> -- 
> 2.31.1
> 
> 



