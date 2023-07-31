From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 31 Jul 2023 09:20:54 +0800
Subject: [RFC PATCH] gitignore: allow gitignore to ignore most dot file
In-Reply-To: <IA1PR20MB495312A830387CB43CF96A60BB07A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495312A830387CB43CF96A60BB07A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAEUhbmWhj2u-rcvTqEpjeiZW-AZPVgCAA3O_Yp7i85yu5TAwDA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 29, 2023 at 5:49?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Nowdays, most of the editor use files or directories begin with dot to

typo: Nowadays

> store some settings. So let git ignore these files and directories to
> reduce potential mistakes.
>
> Add dot match to ignore any editor file and there are two exceptions:
> - .gitignore
> - .clang-format
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
> Note:
> 1. AFAIK, the vim swap file is also begin with dot.
> 2. the patch also covers the patch `gitignore: add VSCode workspace dir`
> so that patch is not needed anymore.
> ---
>  .gitignore | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

