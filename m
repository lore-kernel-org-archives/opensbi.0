From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Dec 2024 12:06:37 +0530
Subject: [RFC 2/5] add ~ files to .gitignore
In-Reply-To: <20241202110336.332490-3-ben.dooks@codethink.co.uk>
References: <20241202110336.332490-1-ben.dooks@codethink.co.uk> <20241202110336.332490-3-ben.dooks@codethink.co.uk>
Message-ID: <CAAhSdy2AMwdDsryD+upRkAf8cBHtgyr_7-KDrmCn_DQ9WEyC4Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 2, 2024 at 4:39?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Ignore temporary files, and avoid accidentally adding them
> to a commit.
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index 424302b..94caeb9 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -19,3 +19,4 @@ install/
>  # Development friendly files
>  tags
>  cscope*
> +*~
> --
> 2.37.2.352.g3c44437643
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

