From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Nov 2021 10:42:46 +0530
Subject: [PATCH] lib: sbi: Fix missing space
In-Reply-To: <20211125100016.31773-1-nikita.shubin@maquefel.me>
References: <20211125100016.31773-1-nikita.shubin@maquefel.me>
Message-ID: <CAAhSdy3cE7138XLaCuHmK9dt81LgujaNBkdBveYkvP6raC_ZkA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 25, 2021 at 3:30 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Fix missing space in sbi_hart_pmp_configure
> error printing.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 76ed678..d9a15d9 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -226,7 +226,7 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>                         pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
>                 else {
>                         sbi_printf("Can not configure pmp for domain %s", dom->name);
> -                       sbi_printf("because memory region address %lx or size %lx is not in range\n",
> +                       sbi_printf(" because memory region address %lx or size %lx is not in range\n",
>                                     reg->base, reg->order);
>                 }
>         }
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

