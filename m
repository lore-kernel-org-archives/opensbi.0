From: Anup Patel <anup@brainfault.org>
Date: Sun, 6 Aug 2023 10:16:33 +0530
Subject: [PATCH] gitignore: allow gitignore to ignore most dot file
In-Reply-To: <IA1PR20MB4953AEE6EF8603D78B892479BB0AA@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953AEE6EF8603D78B892479BB0AA@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy0mQqAqqb0sHiAQAcZkHStYe8MKySV0hw9da0Hy2AygXw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 1, 2023 at 5:11?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Nowadays, most of the editor use files or directories begin with dot to
> store some settings. So let git ignore these files and directories to
> reduce potential mistakes.
>
> Add dot match to ignore any editor file and there are two exceptions:
> - .gitignore
> - .clang-format
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Changed from RFC:
> 1. fix typo
>
> Note:
> 1. AFAIK, the vim swap file is also begin with dot.
> 2. the patch also covers the patch `gitignore: add VSCode workspace dir`
> so that patch is not needed anymore.
> ---
>  .gitignore | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/.gitignore b/.gitignore
> index c11afd3..fbba52e 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,3 +1,10 @@
> +# ignore anything begin with dot
> +.*
> +
> +# exceptions we need even begin with dot
> +!.clang-format
> +!.gitignore
> +
>  # Object files
>  *.o
>  *.a
> @@ -10,4 +17,3 @@ install/
>  # Development friendly files
>  tags
>  cscope*
> -*.swp
> --
> 2.41.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

