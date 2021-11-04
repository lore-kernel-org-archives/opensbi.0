From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 16:51:06 +0800
Subject: [PATCH v3 09/11] lib: sbi: Counter info width should be zero
 indexed
In-Reply-To: <20211102150959.492991-10-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
 <20211102150959.492991-10-atish.patra@wdc.com>
Message-ID: <CAEUhbmW=TBs9myNe_nK4ov0GeWwZO+8L7uhqvBm-dCH3JATHZQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 2, 2021 at 11:11 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> The mhpm bits represent the number of bits available in mhpmcounter
> while counter width describes a zero indexed value. Fix the counter width
> calculation.
>

Fixes: 13d40f21d588 ("lib: sbi: Add PMU support")

> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

