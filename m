From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Dec 2022 00:10:15 +0800
Subject: [PATCH 4/4] scripts/create-binary-archive.sh: remove andes/ae350
 build directory
In-Reply-To: <20221128083046.6799-5-peterlin@andestech.com>
References: <20221128083046.6799-1-peterlin@andestech.com> <20221128083046.6799-5-peterlin@andestech.com>
Message-ID: <CAEUhbmUciAkZnkzBf-gedTgzB3f_j5F9xucSdcBBdx72RfZWXQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 4:34 PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> The andes-specific files have been moved to generic platform so we
> can drop this line.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  scripts/create-binary-archive.sh | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

