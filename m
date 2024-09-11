From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 12 Sep 2024 00:59:25 +0800
Subject: [PATCH v3 1/1] Makefile: enable --gc-sections
In-Reply-To: <272cb6e3f54b13f6a21319a9c1f0a1d7c5dd83fa.1725521174.git.zhangcola2003@gmail.com>
References: <cover.1725521174.git.zhangcola2003@gmail.com> <272cb6e3f54b13f6a21319a9c1f0a1d7c5dd83fa.1725521174.git.zhangcola2003@gmail.com>
Message-ID: <CAEUhbmVJfw9q3=79NF=hym-x6unLdO9bk=N1aHo_75KGtWf6tQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 5, 2024 at 5:31?PM Kele Zhang <zhangcola2003@gmail.com> wrote:
>
> The --gc-sections option enables the linker to perform garbage
> collection of unreferenced code and data, thereby reducing the binary
> size.
>
> The -ffunction-sections option will place each function into a separate
> section, so it is necessary to add .text.* to the linker script.
>
> Signed-off-by: Kele Zhang <zhangcola2003@gmail.com>
> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  Makefile             | 15 +++++++++------
>  firmware/fw_base.ldS |  1 +
>  2 files changed, 10 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

