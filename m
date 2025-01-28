From: Chao-ying Fu <icebergfu@gmail.com>
Date: Tue, 28 Jan 2025 04:48:32 -0800
Subject: [PATCH] Convert hartid to hart index to get scratch.
In-Reply-To: <20250109233241.2491-1-cfu@mips.com>
References: <20250109233241.2491-1-cfu@mips.com>
Message-ID: <CAM1rFzGcvhhmE5hEP-006N1OSqPvNbWE9txZppSQG8FAS4n+9w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025 at 4:07?PM Chao-ying Fu <icebergfu@gmail.com> wrote:
>
> Hartid may not be sequential, so we need to use index to get scratch.
> ---
>  lib/utils/ipi/aclint_mswi.c     | 2 +-
>  lib/utils/timer/aclint_mtimer.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
> index 9e55078..e22903f 100644
> --- a/lib/utils/ipi/aclint_mswi.c
> +++ b/lib/utils/ipi/aclint_mswi.c
> @@ -87,7 +87,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
>
>         /* Update MSWI pointer in scratch space */
>         for (i = 0; i < mswi->hart_count; i++) {
> -               scratch = sbi_hartid_to_scratch(mswi->first_hartid + i);
> +               scratch = sbi_hartindex_to_scratch(sbi_hartid_to_hartindex(mswi->first_hartid) + i);
>                 /*
>                  * We don't need to fail if scratch pointer is not available
>                  * because we might be dealing with hartid of a HART disabled
> diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> index 3db3c3b..eb80f24 100644
> --- a/lib/utils/timer/aclint_mtimer.c
> +++ b/lib/utils/timer/aclint_mtimer.c
> @@ -206,7 +206,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
>
>         /* Update MTIMER pointer in scratch space */
>         for (i = 0; i < mt->hart_count; i++) {
> -               scratch = sbi_hartid_to_scratch(mt->first_hartid + i);
> +               scratch = sbi_hartindex_to_scratch(sbi_hartid_to_hartindex(mt->first_hartid) + i);
>                 /*
>                  * We don't need to fail if scratch pointer is not available
>                  * because we might be dealing with hartid of a HART disabled
> --
> 2.47.1
>
Any feedback about this patch?
Without this patch, OpenSBI may use a wrong hartid that doesn't exist
in a platform.
Thanks!

