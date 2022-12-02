From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Dec 2022 23:55:14 +0800
Subject: [PATCH v2 1/6] lib: simplify fdt_parse_plmt_node()
In-Reply-To: <20221128091420.30391-2-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com> <20221128091420.30391-2-heinrich.schuchardt@canonical.com>
Message-ID: <CAEUhbmUkf3HG5vmgTgdeGcJHf=_oRg7iDMW_cKLuS9Xi9XZpww@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 5:16 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> We should not check !plmt_base || !plmt_size twice.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> v2:
>         Reviewed-by added
> ---
>  lib/utils/fdt/fdt_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

