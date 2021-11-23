From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 17:54:15 +0530
Subject: [PATCH] lib: sbi: Fix spelling of "address" in sbi_domain.c
In-Reply-To: <20211123122309.607757-1-anup.patel@wdc.com>
References: <20211123122309.607757-1-anup.patel@wdc.com>
Message-ID: <CAAhSdy2d7-E19r35hRjHaySt+rwNk5f3eXEDq0NOqe+sF7LF7A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 23, 2021 at 5:53 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> From: Vagrant Cascadian <vagrant@debian.org>
>
> Fix a spelling typo in error print.
>
> Signed-off-by: Vagrant Cascadian <vagrant@debian.org>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 33d7ad5..b60915c 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -295,7 +295,7 @@ static int sanitize_domain(const struct sbi_platform *plat,
>         /* Check next address and next mode*/
>         if (!sbi_domain_check_addr(dom, dom->next_addr, dom->next_mode,
>                                    SBI_DOMAIN_EXECUTE)) {
> -               sbi_printf("%s: %s next booting stage addres 0x%lx can't "
> +               sbi_printf("%s: %s next booting stage address 0x%lx can't "
>                            "execute\n", __func__, dom->name, dom->next_addr);
>                 return SBI_EINVAL;
>         }
> --
> 2.25.1
>

