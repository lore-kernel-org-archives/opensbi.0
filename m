From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Dec 2022 23:55:28 +0800
Subject: [PATCH v2 5/6] lib: simplify fdt_translate_address()
In-Reply-To: <20221128091420.30391-6-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com> <20221128091420.30391-6-heinrich.schuchardt@canonical.com>
Message-ID: <CAEUhbmVjGbRSRANTFjhD0CMkf7iW=aSab2s72CQ1Ts5aJipE5Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 5:15 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Don't assign a value to offset which is never used.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> v2:
>         Reviewed-by added
> ---
>  lib/utils/fdt/fdt_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

