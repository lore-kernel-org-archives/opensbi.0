From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 3 Dec 2020 15:54:57 -0800
Subject: [PATCH 02/11] lib: sbi: Fix typo in sbi_domain_finalize()
In-Reply-To: <20201121094756.4154728-3-anup.patel@wdc.com>
References: <20201121094756.4154728-1-anup.patel@wdc.com>
 <20201121094756.4154728-3-anup.patel@wdc.com>
Message-ID: <CAOnJCU+95dShx3E6soBUoq_z3A5rMBqvBFKxAU6Bo-ayr8dCNA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 21, 2020 at 2:52 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> There has been typo in automatic domain boot hart startup
> for non-root domains so this patch fixes it.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/sbi/sbi_domain.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index d4b82fe..4c98a1b 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -404,12 +404,12 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
>                 dhart = dom->boot_hartid;
>
>                 /* Ignore if boot HART not possible for this domain */
> -               if (!sbi_hartmask_test_hart(i, dom->possible_harts))
> +               if (!sbi_hartmask_test_hart(dhart, dom->possible_harts))
>                         continue;
>
>                 /* Ignore if boot HART assigned different domain */
>                 if (sbi_hartid_to_domain(dhart) != dom ||
> -                   !sbi_hartmask_test_hart(i, &dom->assigned_harts))
> +                   !sbi_hartmask_test_hart(dhart, &dom->assigned_harts))
>                         continue;
>
>                 /* Startup boot HART of domain */
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

