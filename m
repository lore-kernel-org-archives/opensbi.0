From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Sep 2024 17:57:36 +0530
Subject: [PATCH] docs: Remove github PR as an option
In-Reply-To: <20240829-doc_pr_fix-v1-1-a123ea4cf769@rivosinc.com>
References: <20240829-doc_pr_fix-v1-1-a123ea4cf769@rivosinc.com>
Message-ID: <CAAhSdy1ixaCjH5G=Bvq-SET1Gs22katbwB04F1kBEOtQjjBupg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 6:34?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> OpenSBI development workflow is mailing list based from the
> beginning. Initially, github PRs were added as an option but it turned
> out that it is not feasible to support both github PR and mailing list
> based workflows. Hence, all the PRs has been redirected to use the
> mailing list from a long time. In fact, it is source of confusion to
> have both options.
>
> Update the documentation to reflect the reality.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  docs/contributing.md | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/docs/contributing.md b/docs/contributing.md
> index 78d909e474ca..4d08c6473855 100644
> --- a/docs/contributing.md
> +++ b/docs/contributing.md
> @@ -1,17 +1,15 @@
>  OpenSBI Contribution Guideline
>  ==============================
>
> -All contributions to OpenSBI can be sent in the following ways:
> -1. Email patches to the OpenSBI mailing list at `opensbi at lists.infradead.org`
> -2. GitHub Pull Requests (PRs) to the [OpenSBI main repository]
> +All contributions to OpenSBI must be sent via email patches to the OpenSBI
> +mailing list at `opensbi at lists.infradead.org`
>
>  To join the OpenSBI mailing list, please visit the [OpenSBI infradead page].
>
> -The OpenSBI maintainers prefer patches via the OpenSBI mailing list
> -(option 1 above) so that they are visible to a wider audience. All
> -accepted patches on the OpenSBI mailing list will be taken by any of
> -the OpenSBI maintainers and merged into the [OpenSBI main repository]
> -using GitHub PRs.
> +The mailing list based patch approach is preferred over github PRs so that they
> +are visible to a wider audience. All accepted patches on the OpenSBI mailing
> +list will be taken by one of the OpenSBI maintainers and merged into the
> +[OpenSBI main repository].
>
>  All contributed work must follow the following rules:
>  1. OpenSBI code should be written in accordance to the [Linux coding style].
> @@ -33,9 +31,6 @@ riscv/opensbi repository. Instead, prefer using a fork of the riscv/opensbi main
>  repository and branches within that fork to create pull requests.
>  7. A maintainer cannot merge his own pull requests in the riscv/opensbi main
>  repository.
> -8. A pull request must get at least one review from a maintainer.
> -9. A pull request must spend at least 24 hours in review to allow for other
> -developers to review.
>
>  -----------------------------------------------------------------------
>
>
> ---
> base-commit: c4940a9517486413cd676fc8032bb55f9d4e2778
> change-id: 20240829-doc_pr_fix-886dcb124632
> --
> Regards,
> Atish patra
>

