From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Oct 2023 17:06:01 +0530
Subject: [PATCH 1/1] lib: sbi: fix sbi_domain_get_assigned_hartmask()
In-Reply-To: <20230927141451.51052-1-heinrich.schuchardt@canonical.com>
References: <20230927141451.51052-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy1O7XVowJ6KmAXCxqqq9sXpq6rO1U_1xCv09st+s=1vUw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 27, 2023 at 7:45?PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> '1' is a 32 bit integer. When shifting it by more than 31 bits it becomes
> zero and we get an incorrect return value.
>
> Addresses-Coverity-ID: 1568356 Bad bit shift operation
> Fixes: 296e70d69da7 ("lib: sbi: Extend sbi_hartmask to support both hartid and hartindex")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index b1f485d..fd4a296 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -76,7 +76,7 @@ ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
>         ulong ret = 0;
>         for (int i = 0; i < 8 * sizeof(ret); i++) {
>                 if (sbi_domain_is_assigned_hart(dom, hbase + i))
> -                       ret |= 1 << i;
> +                       ret |= 1UL << i;
>         }
>
>         return ret;
> --
> 2.40.1
>

