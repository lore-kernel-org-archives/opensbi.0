From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jan 2025 10:49:34 +0530
Subject: [PATCH v6 4/7] include: lib: add a simple simply linked list implementation
In-Reply-To: <20250110131557.3261411-5-cleger@rivosinc.com>
References: <20250110131557.3261411-1-cleger@rivosinc.com> <20250110131557.3261411-5-cleger@rivosinc.com>
Message-ID: <CAAhSdy2UuRBsQp9B11ht-zuqDt2OtNDw-XzAuct4XGn7K_TG8w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Typo in patch subject "simple simply".

On Fri, Jan 10, 2025 at 6:55?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> Add a simple linked list implementation when double linked list are not
> needed. This allows to easily have statically defined linked list that
> can be extended at runtime.
>
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

Otherwise, it looks good to me. I will take care of the above
comment at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_slist.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 include/sbi/sbi_slist.h
>
> diff --git a/include/sbi/sbi_slist.h b/include/sbi/sbi_slist.h
> new file mode 100644
> index 00000000..e4b83cfd
> --- /dev/null
> +++ b/include/sbi/sbi_slist.h
> @@ -0,0 +1,33 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Simple simply-linked list library.
> + *
> + * Copyright (c) 2025 Rivos Inc.
> + *
> + * Authors:
> + *   Cl?ment L?ger <cleger@rivosinc.com>
> + */
> +
> +#ifndef __SBI_SLIST_H__
> +#define __SBI_SLIST_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +#define SBI_SLIST_HEAD_INIT(_ptr)      (_ptr)
> +#define SBI_SLIST_HEAD(_lname, _stype) struct _stype *_lname
> +#define SBI_SLIST_NODE(_stype) SBI_SLIST_HEAD(next, _stype)
> +#define SBI_SLIST_NODE_INIT(_ptr) .next = _ptr
> +
> +#define SBI_INIT_SLIST_HEAD(_head) (_head) = NULL
> +
> +#define SBI_SLIST_ADD(_ptr, _head) \
> +do { \
> +       (_ptr)->next = _head; \
> +       (_head) = _ptr; \
> +} while (0)
> +
> +#define SBI_SLIST_FOR_EACH_ENTRY(_ptr, _head) \
> +       for (_ptr = _head; _ptr; _ptr = _ptr->next)
> +
> +#endif
> --
> 2.47.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

