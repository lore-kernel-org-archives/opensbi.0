From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 30 Sep 2021 09:08:56 +0800
Subject: [PATCH V3] Makefile: Add build time and compiler info string.
In-Reply-To: <20210929180533.275413-1-tekkamanninja@gmail.com>
References: <20210929180533.275413-1-tekkamanninja@gmail.com>
Message-ID: <CAEUhbmU58kxBUMtTCByQC_5L4WQHj6bMU0jtFd5W_CDXEohzKw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 30, 2021 at 2:06 AM <tekkamanninja@gmail.com> wrote:
>
> From: Wei Fu <wefu@redhat.com>
>
> When we are doing opensbi development, we want to know the build time
> and compiler info for debug purpose.
> To enable this message, please add "BUILD_INFO=y" , like:
>
> ```
> make BUILD_INFO=y
> ```
>
> NOTE: `BUILD_INFO=y` will violate "reproducible builds".
> So it's ONLY for development and debug purpose, and should NOT be used
> in a product which follows "reproducible builds".
>
> Signed-off-by: Wei Fu <wefu@redhat.com>
> ---
>  Makefile           | 22 ++++++++++++++++++++++
>  README.md          | 23 +++++++++++++++++++++++
>  lib/sbi/sbi_init.c |  8 ++++++++
>  3 files changed, 53 insertions(+)
>

It looks my comments to v1 still remains unchanged

Regards,
Bin

