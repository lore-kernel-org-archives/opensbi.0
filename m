From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Dec 2022 23:55:31 +0800
Subject: [PATCH v2 6/6] lib: fix fdt_parse_aclint_node()
In-Reply-To: <20221128091420.30391-7-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com> <20221128091420.30391-7-heinrich.schuchardt@canonical.com>
Message-ID: <CAEUhbmWmiZHLPRke3ntbwbNut4LH8VaZx5duyAy+FtDGrB1rXQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 5:15 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> After determining cpu_offset we have to check this variable and not
> cpu_intc_offset.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
>         new patch
> ---
>  lib/utils/fdt/fdt_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

