From: Anup Patel <anup@brainfault.org>
Date: Sat, 10 Dec 2022 21:54:30 +0530
Subject: [PATCH v2] scripts: use env to invoke bash
In-Reply-To: <20221209061335.1326839-1-hchauhan@ventanamicro.com>
References: <20221209061335.1326839-1-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3SfVWKe-HvsynXAbiM7vSMmieqZHgVMYArJNu+ycUk=w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 9, 2022 at 11:43 AM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Not all systems have bash at a fixed location like /bin/bash.
> FreeBSD, for example, would typically have it at /usr/local/bin/bash.
> When building OpenSBI on freebsd system, the build breaks.
>
> Its advisable to use: #!/usr/bin/env bash
>
> [v2] In this version:
> * Change remaining two scripts to use env

The change log should be after the "---" line below for a
single patch otherwise it becomes part of the commit description.

>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  scripts/carray.sh                | 2 +-
>  scripts/create-binary-archive.sh | 2 +-
>  scripts/d2c.sh                   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/carray.sh b/scripts/carray.sh
> index 0c52bd6..13f9d36 100755
> --- a/scripts/carray.sh
> +++ b/scripts/carray.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>
>  function usage()
>  {
> diff --git a/scripts/create-binary-archive.sh b/scripts/create-binary-archive.sh
> index 261a45a..63781e1 100755
> --- a/scripts/create-binary-archive.sh
> +++ b/scripts/create-binary-archive.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>
>  function usage()
>  {
> diff --git a/scripts/d2c.sh b/scripts/d2c.sh
> index 33a3ccf..c411fcd 100755
> --- a/scripts/d2c.sh
> +++ b/scripts/d2c.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
>
>  function usage()
>  {
> --
> 2.38.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

