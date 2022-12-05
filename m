From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Dec 2022 10:45:04 +0530
Subject: [PATCH v2 0/6] lib: fixes for fdt functions
In-Reply-To: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy1GnbBA6831b07d5Ak0hLKp-LmC-dNFKmFnM6EravdWTQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Heinrich,

On Mon, Nov 28, 2022 at 2:44 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> * Use correct type for variables used in error checks
> * Check correct variables
> * Avoid duplicates checks
> * Don't assign values that are never used.
>
> v2:
>         check correct variables
>         fix fdt_parse_aclint_node() too
>
> Heinrich Schuchardt (6):
>   lib: simplify fdt_parse_plmt_node()
>   lib: simplify fdt_parse_plicsw_node()
>   lib: fix fdt_parse_plmt_node()
>   lib: fix fdt_parse_plicsw_node()
>   lib: simplify fdt_translate_address()
>   lib: fix fdt_parse_aclint_node()

Thanks for catching and fixing all these issues.

Applied this series to the riscv/opensbi repo.

Regards,
Anup

>
>  lib/utils/fdt/fdt_helper.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> --
> 2.37.2
>

