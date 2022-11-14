From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Nov 2022 00:09:44 +0800
Subject: [PATCH v2] lib: utils/serial: Fix semihosting compile error using LLVM
In-Reply-To: <20221108121016.1441356-1-apatel@ventanamicro.com>
References: <20221108121016.1441356-1-apatel@ventanamicro.com>
Message-ID: <CAEUhbmXFRd4MgX6t7M5wnSiEQ-e8P8qJ2uTAti7mrwhVWQZBww@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 8, 2022 at 8:12 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We fix the following semihosting compile error observed using LLVM:
> lib/utils/serial/semihosting.c:158:12: error: result of comparison of constant -1 with expression of type 'char' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>                 ret = ch > -1 ? ch : -1;
>                       ~~ ^ ~~
>
> Fixes: 7f09fba86e43 ("lib: utils/serial: add semihosting support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/serial/semihosting.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

