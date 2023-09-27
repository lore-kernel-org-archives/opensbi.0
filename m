From: Xiang W <wxjstz@126.com>
Date: Wed, 27 Sep 2023 23:00:05 +0800
Subject: [PATCH 1/1] lib: sbi: fix sbi_domain_get_assigned_hartmask()
In-Reply-To: <20230927141451.51052-1-heinrich.schuchardt@canonical.com>
References: <20230927141451.51052-1-heinrich.schuchardt@canonical.com>
Message-ID: <fb34ab6e28eb46898c12609ac65d7387bd4c57a5.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-09-27???? 16:14 +0200?Heinrich Schuchardt???
> '1' is a 32 bit integer. When shifting it by more than 31 bits it becomes
> zero and we get an incorrect return value.
> 
> Addresses-Coverity-ID: 1568356 Bad bit shift operation
> Fixes: 296e70d69da7 ("lib: sbi: Extend sbi_hartmask to support both hartid and hartindex")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/sbi/sbi_domain.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index b1f485d..fd4a296 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -76,7 +76,7 @@ ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
> ?	ulong ret = 0;
> ?	for (int i = 0; i < 8 * sizeof(ret); i++) {
> ?		if (sbi_domain_is_assigned_hart(dom, hbase + i))
> -			ret |= 1 << i;
> +			ret |= 1UL << i;
> ?	}
> ?
> ?	return ret;
> -- 
> 2.40.1
> 
> 


