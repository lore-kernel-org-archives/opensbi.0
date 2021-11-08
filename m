From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Nov 2021 11:20:46 +0800
Subject: [PATCH v4 11/11] lib: utils: Rename the prefix in PMU DT
 properties
In-Reply-To: <20211105220527.2771269-12-atish.patra@wdc.com>
References: <20211105220527.2771269-1-atish.patra@wdc.com>
 <20211105220527.2771269-12-atish.patra@wdc.com>
Message-ID: <CAEUhbmXtcabjQXcs-3vFuQyY3qto8zPUF6p1kh3SQgq+0FJmgQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 6, 2021 at 6:06 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> As per the DT schema rules, the prefix should be vendor. As the PMU
> properties are generic for all vendors, change the prefix to riscv
> instead of pmu.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  docs/pmu_support.md     | 12 ++++++------
>  lib/utils/fdt/fdt_pmu.c | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

