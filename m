From: Xiang W <wxjstz@126.com>
Date: Mon, 19 Apr 2021 11:55:04 +0800
Subject: [RFC 06/14] include: Add a list empty check function
In-Reply-To: <20210319221305.2138412-7-atish.patra@wdc.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
 <20210319221305.2138412-7-atish.patra@wdc.com>
Message-ID: <0299ea008e390fc1450952ba24d05566c1bbf076.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-03-19?? 15:12 -0700?Atish Patra???
> Implement a list helper function that checks for empty lists.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
Looks good to me.

Reviewed-by: Xiang W <wxjstz@126.com>

Regards,
Xiang W
> ---
>  include/sbi/sbi_list.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/sbi/sbi_list.h b/include/sbi/sbi_list.h
> index 1174ad274c54..b1178dfc9b8e 100644
> --- a/include/sbi/sbi_list.h
> +++ b/include/sbi/sbi_list.h
> @@ -43,6 +43,17 @@ static inline void __sbi_list_add(struct sbi_dlist
> *new,
>  	next->prev = new;
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
> +	return head->next == head;
> +}
> +
>  /**
>   * Adds the new node after the given head.
>   * @param new New node that needs to be added to list.
> -- 
> 2.25.1
> 
> 


