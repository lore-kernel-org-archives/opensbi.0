From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Aug 2024 08:50:11 +0530
Subject: [PATCH v4 3/3] lib: sbi: Implement aligned memory allocators
In-Reply-To: <20240809031638.89146-4-gregorhaas1997@gmail.com>
References: <20240809031638.89146-1-gregorhaas1997@gmail.com> <20240809031638.89146-4-gregorhaas1997@gmail.com>
Message-ID: <CAAhSdy1Egv+6oSh42uLVFhYgjmsG-Y3o_x+QeeWZ=69MCt6APA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 9, 2024 at 8:46?AM Gregor Haas <gregorhaas1997@gmail.com> wrote:
>
> This change adds a simple implementation of sbi_aligned_alloc(), for future use
> in allocating aligned memory for SMMTT tables.
>
> Signed-off-by: Gregor Haas <gregorhaas1997@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_heap.h |  9 +++++
>  lib/sbi/sbi_heap.c     | 75 ++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 78 insertions(+), 6 deletions(-)
>
> diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
> index 9a67090..a4b3f0c 100644
> --- a/include/sbi/sbi_heap.h
> +++ b/include/sbi/sbi_heap.h
> @@ -31,6 +31,15 @@ static inline void *sbi_malloc(size_t size)
>         return sbi_malloc_from(&global_hpctrl, size);
>  }
>
> +/** Allocate aligned from heap area */
> +void *sbi_aligned_alloc_from(struct sbi_heap_control *hpctrl,
> +                            size_t alignment,size_t size);
> +
> +static inline void *sbi_aligned_alloc(size_t alignment, size_t size)
> +{
> +       return sbi_aligned_alloc_from(&global_hpctrl, alignment, size);
> +}
> +
>  /** Zero allocate from heap area */
>  void *sbi_zalloc_from(struct sbi_heap_control *hpctrl, size_t size);
>
> diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
> index cc4893d..6d08e44 100644
> --- a/lib/sbi/sbi_heap.c
> +++ b/lib/sbi/sbi_heap.c
> @@ -37,27 +37,67 @@ struct sbi_heap_control {
>
>  struct sbi_heap_control global_hpctrl;
>
> -void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size)
> +static void *alloc_with_align(struct sbi_heap_control *hpctrl,
> +                             size_t align, size_t size)
>  {
>         void *ret = NULL;
> -       struct heap_node *n, *np;
> +       struct heap_node *n, *np, *rem;
> +       unsigned long lowest_aligned;
> +       size_t pad;
>
>         if (!size)
>                 return NULL;
>
> -       size += HEAP_ALLOC_ALIGN - 1;
> -       size &= ~((unsigned long)HEAP_ALLOC_ALIGN - 1);
> +       size += align - 1;
> +       size &= ~((unsigned long)align - 1);
>
>         spin_lock(&hpctrl->lock);
>
>         np = NULL;
>         sbi_list_for_each_entry(n, &hpctrl->free_space_list, head) {
> -               if (size <= n->size) {
> +               lowest_aligned = ROUNDUP(n->addr, align);
> +               pad = lowest_aligned - n->addr;
> +
> +               if (size + pad <= n->size) {
>                         np = n;
>                         break;
>                 }
>         }
> -       if (np) {
> +       if (!np)
> +               goto out;
> +
> +       if (pad) {
> +               if (sbi_list_empty(&hpctrl->free_node_list)) {
> +                       goto out;
> +               }
> +
> +               n = sbi_list_first_entry(&hpctrl->free_node_list,
> +                                        struct heap_node, head);
> +               sbi_list_del(&n->head);
> +
> +               if ((size + pad < np->size) &&
> +                   !sbi_list_empty(&hpctrl->free_node_list)) {
> +                       rem = sbi_list_first_entry(&hpctrl->free_node_list,
> +                                                  struct heap_node, head);
> +                       sbi_list_del(&rem->head);
> +                       rem->addr = np->addr + (size + pad);
> +                       rem->size = np->size - (size + pad);
> +                       sbi_list_add_tail(&rem->head,
> +                                         &hpctrl->free_space_list);
> +               } else if (size + pad != np->size) {
> +                       /* Can't allocate, return n */
> +                       sbi_list_add(&n->head, &hpctrl->free_node_list);
> +                       ret = NULL;
> +                       goto out;
> +               }
> +
> +               n->addr = lowest_aligned;
> +               n->size = size;
> +               sbi_list_add_tail(&n->head, &hpctrl->used_space_list);
> +
> +               np->size = pad;
> +               ret = (void *)n->addr;
> +       } else {
>                 if ((size < np->size) &&
>                     !sbi_list_empty(&hpctrl->free_node_list)) {
>                         n = sbi_list_first_entry(&hpctrl->free_node_list,
> @@ -76,11 +116,34 @@ void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size)
>                 }
>         }
>
> +out:
>         spin_unlock(&hpctrl->lock);
>
>         return ret;
>  }
>
> +void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size)
> +{
> +       return alloc_with_align(hpctrl, HEAP_ALLOC_ALIGN, size);
> +}
> +
> +void *sbi_aligned_alloc_from(struct sbi_heap_control *hpctrl,
> +                            size_t alignment, size_t size)
> +{
> +       if (alignment < HEAP_ALLOC_ALIGN)
> +               alignment = HEAP_ALLOC_ALIGN;
> +
> +       /* Make sure alignment is power of two */
> +       if ((alignment & (alignment - 1)) != 0)
> +               return NULL;
> +
> +       /* Make sure size is multiple of alignment */
> +       if (size % alignment != 0)
> +               return NULL;
> +
> +       return alloc_with_align(hpctrl, alignment, size);
> +}
> +
>  void *sbi_zalloc_from(struct sbi_heap_control *hpctrl, size_t size)
>  {
>         void *ret = sbi_malloc_from(hpctrl, size);
> --
> 2.45.2
>

