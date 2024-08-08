From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Aug 2024 11:03:56 +0530
Subject: [PATCH v3 2/3] lib: sbi: Allocate from beginning of heap blocks
In-Reply-To: <20240807181719.244099-3-gregorhaas1997@gmail.com>
References: <20240807181719.244099-1-gregorhaas1997@gmail.com> <20240807181719.244099-3-gregorhaas1997@gmail.com>
Message-ID: <CAAhSdy10TPFcF10UUZ5iccnNgR3YQWFz4GrvpZJnVQWDh6GyiQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 7, 2024 at 11:47?PM Gregor Haas <gregorhaas1997@gmail.com> wrote:
>
> In the next commit, we'll add a new sbi_memalign() function. In order to
> allocate aligned memory, we'll sometimes need to allocate from the middle of a
> heap block, effectively splitting it in two. Allocating from the beginning of a
> heap block in the nonaligned case more closely matches this behavior, reducing
> the complexity of understanding the heap implementation.
>
> Signed-off-by: Gregor Haas <gregorhaas1997@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  lib/sbi/sbi_heap.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
> index e43d77c..cc4893d 100644
> --- a/lib/sbi/sbi_heap.c
> +++ b/lib/sbi/sbi_heap.c
> @@ -63,8 +63,9 @@ void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size)
>                         n = sbi_list_first_entry(&hpctrl->free_node_list,
>                                                  struct heap_node, head);
>                         sbi_list_del(&n->head);
> -                       n->addr = np->addr + np->size - size;
> +                       n->addr = np->addr;
>                         n->size = size;
> +                       np->addr += size;
>                         np->size -= size;
>                         sbi_list_add_tail(&n->head, &hpctrl->used_space_list);
>                         ret = (void *)n->addr;
> --
> 2.45.2
>

