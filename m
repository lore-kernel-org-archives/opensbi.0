From: Inochi Amaoto <inochiama@gmail.com>
Date: Fri, 10 Jan 2025 08:42:28 +0800
Subject: [PATCH] Work with hartid equal to or greater than
 SBI_HARTMASK_MAX_BITS.
In-Reply-To: <20250109230853.2440-1-cfu@mips.com>
References: <20250109230853.2440-1-cfu@mips.com>
Message-ID: <xg5stvhp7uqggy2mr3jtloueoqxyfjqezc3ohgrhyvpqmbgbpn@6qqfwuvw5gfm>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 09, 2025 at 03:08:53PM -0800, Chao-ying Fu wrote:
> Some platforms use hartid that is equal to greater than SBI_HARTMASK_MAX_BITS,
> so we should remove the check.
> ---
>  lib/utils/fdt/fdt_domain.c  | 3 ---
>  lib/utils/fdt/fdt_helper.c  | 9 ---------
>  platform/generic/platform.c | 3 ---
>  3 files changed, 15 deletions(-)
> 

Is there a specific platform to test this patch? This also applies
to your other patches.

Regards,
Inochi

