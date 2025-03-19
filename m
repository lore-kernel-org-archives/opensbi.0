From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 19 Mar 2025 09:42:14 -0500
Subject: [PATCH] lib: sbi: Remove unnecessary SBI_INIT_LIST_HEAD
In-Reply-To: <20250319123944.505756-1-wxjstz@126.com>
References: <20250319123944.505756-1-wxjstz@126.com>
Message-ID: <c3994b39-c4eb-4423-a50b-3a8c5efd100b@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-03-19 7:39 AM, Xiang W wrote:
> No need to initialise the nodes to be added to the linked list
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_ecall.c         | 1 -
>  lib/sbi/sbi_heap.c          | 1 -
>  lib/sbi/sbi_mpxy.c          | 1 -
>  lib/utils/fdt/fdt_fixup.c   | 1 -
>  lib/utils/mailbox/mailbox.c | 2 --
>  5 files changed, 6 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


