From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 11:09:51 +0800
Subject: [PATCH v3 04/11] lib: sbi: Delegate PMU counter overflow
 interrupt to S mode
In-Reply-To: <20211102150959.492991-5-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
 <20211102150959.492991-5-atish.patra@wdc.com>
Message-ID: <CAEUhbmWfxrELK0k5aF_T935khjy8ddJ+7b6RCxZBf76WtPDQWw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 2, 2021 at 11:11 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> OpenSBI doesn't handle PMU counters for now. Delete the overflow counter to

Delegate, not Delete

> S-mode always.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  include/sbi/riscv_encoding.h | 2 ++
>  lib/sbi/sbi_hart.c           | 3 +++
>  2 files changed, 5 insertions(+)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

