From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 1 Jul 2021 21:59:55 +0800
Subject: [RFC PATCH 1/4] lib: utils: reset: unify naming of 'sifive_test'
 device
In-Reply-To: <20210701073958.15558-2-green.wan@sifive.com>
References: <20210701073958.15558-1-green.wan@sifive.com>
 <20210701073958.15558-2-green.wan@sifive.com>
Message-ID: <CAEUhbmXp-S=ZLyk7HYgJ3ofZWgsCecSEt2Yw00VYwjY=du3jjA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 1, 2021 at 5:02 PM Green Wan <green.wan@sifive.com> wrote:
>
> Unify all the file and function names of 'sifive_test' device, to use
> the same prefix. This is also a preparatory patch for upcoming sifive
> reset device.
>
> Signed-off-by: Green Wan <green.wan@sifive.com>
> ---
>  lib/utils/reset/fdt_reset.c                                   | 4 ++--
>  .../reset/{fdt_reset_sifive.c => fdt_reset_sifive_test.c}     | 2 +-
>  lib/utils/reset/objects.mk                                    | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>  rename lib/utils/reset/{fdt_reset_sifive.c => fdt_reset_sifive_test.c} (94%)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

