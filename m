From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Dec 2022 18:01:37 +0530
Subject: [PATCH 1/1] gitignore: add vim swap files
In-Reply-To: <20221203210415.113835-1-geomatsi@gmail.com>
References: <20221203210415.113835-1-geomatsi@gmail.com>
Message-ID: <CAAhSdy182WMuGOqGAhPDS7POONyxMRLJca59PSuYu6Yk+aa7eA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 4, 2022 at 2:34 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Please don't leave the commit description empty.

>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index 95692bb..c11afd3 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -10,3 +10,4 @@ install/
>  # Development friendly files
>  tags
>  cscope*
> +*.swp
> --
> 2.38.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

