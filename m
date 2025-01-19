From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 17:02:36 -0600
Subject: [PATCH 06/12] lib: utils: Drop notifications from MPXY RPMI
 mailbox client
In-Reply-To: <20250116155651.103782-7-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-7-apatel@ventanamicro.com>
Message-ID: <56774da1-9b01-43f6-b4ff-219e1523fbb0@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-01-16 9:56 AM, Anup Patel wrote:
> Currently, the common MPXY RPMI mailbox client does not support
> notifications so no need for dummy notifications support.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h |  1 -
>  lib/utils/mpxy/fdt_mpxy_rpmi_clock.c        |  1 -
>  lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 10 ----------
>  3 files changed, 12 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


