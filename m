From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 21 Nov 2022 17:29:12 +0800
Subject: [PATCH v2] firmware: payloads: Optimize usage of "ALIGN"
In-Reply-To: <20221121082622.1495-1-zhangleizheng@eswincomputing.com>
References: <20221121082622.1495-1-zhangleizheng@eswincomputing.com>
Message-ID: <CAEUhbmUs-7uyaXQGVh62B1F_F7bnKTw=sc5u-h6vVyOOCP4Jkw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 21, 2022 at 4:29 PM <zhangleizheng@eswincomputing.com> wrote:
>
> From: Leizheng Zhang <zhangleizheng@eswincomputing.com>
>
> Delete the redundant "ALIGN" and adjust the position of "ALIGN"
>
> Signed-off-by: Leizheng Zhang <zhangleizheng@eswincomputing.com>
> ---
>  firmware/fw_base.ldS           | 10 ++++------
>  firmware/payloads/test.elf.ldS | 12 +++++-------
>  2 files changed, 9 insertions(+), 13 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

