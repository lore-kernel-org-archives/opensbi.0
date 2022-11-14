From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Nov 2022 21:52:22 +0800
Subject: [RFC PATCH 2/3] lib: sbi: Add sbi_nputs() function
In-Reply-To: <20221110170016.1477865-3-apatel@ventanamicro.com>
References: <20221110170016.1477865-1-apatel@ventanamicro.com> <20221110170016.1477865-3-apatel@ventanamicro.com>
Message-ID: <CAEUhbmX=BBOs=MzA37uvbzGdu=+DFueQ8ZCW=jS3DHvT4K9oog@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 11, 2022 at 1:03 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add new sbi_nputs() which help us print a fixed number of characters
> from a physical memory location.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_console.h |  2 ++
>  lib/sbi/sbi_console.c     | 10 ++++++++++
>  2 files changed, 12 insertions(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

