From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Sep 2021 15:33:14 +0800
Subject: [PATCH 1/5] lib: utils/fdt: Add fdt_parse_timebase_frequency()
 function
In-Reply-To: <20210915092128.1029868-2-anup.patel@wdc.com>
References: <20210915092128.1029868-1-anup.patel@wdc.com>
 <20210915092128.1029868-2-anup.patel@wdc.com>
Message-ID: <CAEUhbmXjhTV4xdP_C6E9NWSnSWctx5vBDBBY8jjKKZXvNG5ajQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 15, 2021 at 5:22 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add fdt_parse_timebase_frequency() function which can be used
> by ACLINT mtimer driver and platform code to get timebase frequency.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi_utils/fdt/fdt_helper.h |  2 ++
>  lib/utils/fdt/fdt_helper.c         | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

