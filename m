From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Nov 2021 09:29:23 +0800
Subject: [PATCH v5 12/12] lib: sbi: Fix initial value mask while updating
 the counters
In-Reply-To: <20211108185307.389145-13-atish.patra@wdc.com>
References: <20211108185307.389145-1-atish.patra@wdc.com>
 <20211108185307.389145-13-atish.patra@wdc.com>
Message-ID: <CAEUhbmU6j+Oik04kX=gGYAgZ51MM5U1FQzdeX4A3eUAF=3i-fA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 9, 2021 at 2:54 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The first 32 bits of the initial value for the counter should be
> preserved while updating the mhpmcounter for 32bit.
>
> Fixes: 13d40f21d588e ("lib: sbi: Add PMU support")
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

