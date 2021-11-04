From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 17:24:39 +0800
Subject: [PATCH v3 11/11] lib: utils: Rename the prefix in PMU DT
 properties
In-Reply-To: <20211102150959.492991-12-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
 <20211102150959.492991-12-atish.patra@wdc.com>
Message-ID: <CAEUhbmXq9oie+r7QVcefntwqdh==AxGn=FS794GN+b9YgGyNaw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 2, 2021 at 11:11 PM Atish Patra <atish.patra@wdc.com> wrote:
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

