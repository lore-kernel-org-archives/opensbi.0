From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Aug 2024 11:03:47 +0530
Subject: [PATCH v3 3/3] lib: sbi: Implement aligned memory allocators
In-Reply-To: <20240807181719.244099-4-gregorhaas1997@gmail.com>
References: <20240807181719.244099-1-gregorhaas1997@gmail.com> <20240807181719.244099-4-gregorhaas1997@gmail.com>
Message-ID: <CAAhSdy07MJHrKLKhDE4L5Se3vhmaS2y9-PjEhA2=daGZoVL7mA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 7, 2024 at 11:47?PM Gregor Haas <gregorhaas1997@gmail.com> wrote:
>
> This change adds a simple implementation of sbi_memalign(), for future use in
> allocating aligned memory for SMMTT tables.
>
> Signed-off-by: Gregor Haas <gregorhaas1997@gmail.com>
> ---
>  include/sbi/sbi_heap.h |  9 +++++
>  lib/sbi/sbi_heap.c     | 81 ++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 84 insertions(+), 6 deletions(-)
>
> diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
> index 9a67090..2103aef 100644
> --- a/include/sbi/sbi_heap.h
> +++ b/include/sbi/sbi_heap.h
> @@ -31,6 +31,15 @@ static inline void *sbi_malloc(size_t size)
>         return sbi_malloc_from(&global_hpctrl, size);
>  }
>
> +/** Allocate aligned from heap area */
> +void *sbi_memalign_from(struct sbi_heap_control *hpctrl, size_t alignment,
> +                       size_t size);
> +
> +static inline void *sbi_memalign(size_t alignment, size_t size)
> +{
> +       return sbi_memalign_from(&global_hpctrl, alignment, size);
> +}

The term "memalign" does not imply it is a memory allocation function.

I suggest the following names instead:
sbi_malloc_aligned_from()
sbi_malloc_aligned()

> +
>  /** Zero allocate from heap area */
>  void *sbi_zalloc_from(struct sbi_heap_control *hpctrl, size_t size);
>
> diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
> index cc4893d..ea73b54 100644
> --- a/lib/sbi/sbi_heap.c
> +++ b/lib/sbi/sbi_heap.c
> @@ -37,27 +37,70 @@ struct sbi_heap_control {
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
> +       uint64_t lowest_aligned;

Since this represents the lowest aligned address, the data type
should be "unsigned long".

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
> +       if (!np) {
> +               goto out;
> +       }

No need for {} here.

> +
> +       if (pad) {
> +               if (sbi_list_empty(&hpctrl->free_node_list)) {
> +                       goto out;
> +               }

No need for {} here.

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
> +
> +                       n->addr = lowest_aligned;
> +                       n->size = size;
> +                       np->size = pad;
> +                       sbi_list_add_tail(&n->head, &hpctrl->used_space_list);
> +                       ret = (void *)n->addr;
> +               } else if (size + pad == np->size) {
> +                       n->addr = lowest_aligned;
> +                       n->size = size;
> +                       np->size = pad;
> +                       ret = (void *)n->addr;
> +               } else {
> +                       // Can't allocate, return n

Use C-style comments.

> +                       sbi_list_add(&n->head, &hpctrl->free_node_list);
> +               }
> +       } else {
>                 if ((size < np->size) &&
>                     !sbi_list_empty(&hpctrl->free_node_list)) {
>                         n = sbi_list_first_entry(&hpctrl->free_node_list,
> @@ -76,11 +119,37 @@ void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size)
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
> +void *sbi_memalign_from(struct sbi_heap_control *hpctrl, size_t alignment,
> +                       size_t size)
> +{
> +       if(alignment < HEAP_ALLOC_ALIGN) {

Need a space between "if" and "(".

> +               alignment = HEAP_ALLOC_ALIGN;
> +       }

No need for {} here.

> +
> +       // Make sure alignment is power of two

Use C-style comments.

> +       if((alignment & (alignment - 1)) != 0) {

Need a space between "if" and "(".

> +               return NULL;
> +       }

No need for {} here.

> +
> +       // Make sure size is multiple of alignment

Use C-style comments.

> +       if(size % alignment != 0) {
> +               return NULL;
> +       }

No need for {} here.

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

Regards,
Anup

