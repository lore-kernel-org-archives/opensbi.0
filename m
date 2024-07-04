From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jul 2024 10:45:58 +0530
Subject: [PATCH] .github: Add repo lockdown GitHub workflow and update .gitignore
In-Reply-To: <20240624084201.4290-1-zhangdongdong@eswincomputing.com>
References: <20240624084201.4290-1-zhangdongdong@eswincomputing.com>
Message-ID: <CAAhSdy3UZrVH+fSVG57e+=g18_DvDC2R3Mt0rGm=tkDJCF+_1w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 24, 2024 at 2:12?PM <zhangdongdong@eswincomputing.com> wrote:
>
> From: Dongdong Zhang <zhangdongdong@eswincomputing.com>
>
> This commit adds a new GitHub Actions workflow for repository
> lockdown. The workflow triggers when a pull request is opened, and it
> notifies the contributor to use the OpenSBI mailing list for patch
> reviews.
>
> Additionally, the .gitignore file is updated to include the .github
> directory.
>
> Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>  .github/workflows/repo-lockdown.yml | 26 ++++++++++++++++++++++++++
>  .gitignore                          |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 .github/workflows/repo-lockdown.yml
>
> diff --git a/.github/workflows/repo-lockdown.yml b/.github/workflows/repo-lockdown.yml
> new file mode 100644
> index 0000000..80e32ed
> --- /dev/null
> +++ b/.github/workflows/repo-lockdown.yml
> @@ -0,0 +1,26 @@
> +name: 'Repo Lockdown'
> +
> +on:
> +  pull_request_target:
> +    types: opened
> +
> +permissions:
> +  pull-requests: write
> +
> +jobs:
> +  action:
> +    runs-on: ubuntu-latest
> +    steps:
> +      - uses: dessant/repo-lockdown at v4
> +        with:
> +          pr-comment: |
> +            We have mailing list based patch review so it would be great if you can send these patchs to OpenSBI mailing list.
> +
> +            You need to join OpenSBI mailing list using following link
> +            http://lists.infradead.org/mailman/listinfo/opensbi
> +
> +            Make sure you use "git send-email" to send the patches.
> +
> +            Thanks for your contribution to OpenSBI project.
> +          lock-pr: true
> +          close-pr: true
> \ No newline at end of file
> diff --git a/.gitignore b/.gitignore
> index fbba52e..a519d67 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -4,6 +4,7 @@
>  # exceptions we need even begin with dot
>  !.clang-format
>  !.gitignore
> +!.github
>
>  # Object files
>  *.o
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

