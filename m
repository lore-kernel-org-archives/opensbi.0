From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 29 Nov 2022 15:51:33 +0800
Subject: [PATCH 1/1] firmware: Minor optimization for relocate
In-Reply-To: <20221129035407.28946-2-zhangdongdong@eswincomputing.com>
References: <20221129035407.28946-1-zhangdongdong@eswincomputing.com> <20221129035407.28946-2-zhangdongdong@eswincomputing.com>
Message-ID: <CAEUhbmUiAn=gqTq1m-A-+9jKZRmCCvRPT=k7QHEA4a293onRpA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 29, 2022 at 11:57 AM Dongdong Zhang
<zhangdongdong@eswincomputing.com> wrote:
>
> The t3 register stores the address of _load_end. If relocation is not required, it is unnecessary to calculate the address of _load_end.

nits: commit messages should be written like about 70 characters per line.

>
> This can reduce the operation time of two instructions.
>
> Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
> ---
>  firmware/fw_base.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

