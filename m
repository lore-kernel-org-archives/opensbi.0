From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Dec 2022 23:55:25 +0800
Subject: [PATCH v2 4/6] lib: fix fdt_parse_plicsw_node()
In-Reply-To: <20221128091420.30391-5-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com> <20221128091420.30391-5-heinrich.schuchardt@canonical.com>
Message-ID: <CAEUhbmUptF8GjoijS4j5fiRY1+L=4z3RP8FGR0pZ7_NTBzvd-g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 5:16 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> cpu_offset and cpu_intc_offset must be int to detect failed invocations of
> fdt_node_offset_by_phandle() or fdt_parent_offset().
>
> After determining cpu_offset we have to check this value and not
> cpu_intc_offset.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
>         check correct variable
> ---
>  lib/utils/fdt/fdt_helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

