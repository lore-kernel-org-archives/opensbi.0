From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 10:49:19 +0530
Subject: [PATCH v5 06/15] include: Add a list empty check function
In-Reply-To: <20210710161816.632364-7-atish.patra@wdc.com>
References: <20210710161816.632364-1-atish.patra@wdc.com>
 <20210710161816.632364-7-atish.patra@wdc.com>
Message-ID: <CAAhSdy0hH1LbOvZPpv54Av9bRT319KdfZU121UY4aoCnJ5S7YA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 9:48 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Implement a list helper function that checks for empty lists.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_list.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/sbi/sbi_list.h b/include/sbi/sbi_list.h
> index 1174ad274c54..b1178dfc9b8e 100644
> --- a/include/sbi/sbi_list.h
> +++ b/include/sbi/sbi_list.h
> @@ -43,6 +43,17 @@ static inline void __sbi_list_add(struct sbi_dlist *new,
>         next->prev = new;
>  }
>
> +/**
> + * Checks if the list is empty or not.
> + * @param head List head
> + *
> + * Retruns TRUE if list is empty, FALSE otherwise.
> + */
> +static inline bool sbi_list_empty(struct sbi_dlist *head)
> +{
> +       return head->next == head;
> +}
> +
>  /**
>   * Adds the new node after the given head.
>   * @param new New node that needs to be added to list.
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

