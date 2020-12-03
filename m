From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 3 Dec 2020 15:57:19 -0800
Subject: [PATCH 04/11] lib: sbi: Auto start domain only if boot HART
 within limits
In-Reply-To: <20201121094756.4154728-5-anup.patel@wdc.com>
References: <20201121094756.4154728-1-anup.patel@wdc.com>
 <20201121094756.4154728-5-anup.patel@wdc.com>
Message-ID: <CAOnJCULubE+UouGSNX3mrgHnvMjE6U6iBGuxvLf+4yJG5_RVnA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 21, 2020 at 2:52 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sbi_domain_finalize() should auto start a domain only if the
> boot HART is withing limits (i.e. less than SBI_HARTMASK_MAX_BITS).
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/sbi/sbi_domain.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index ac920b8..ecb098c 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -403,6 +403,10 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
>                 /* Domain boot HART */
>                 dhart = dom->boot_hartid;
>
> +               /* Ignore of boot HART is off limits */
> +               if (SBI_HARTMASK_MAX_BITS <= dhart)
> +                       continue;
> +
>                 /* Ignore if boot HART not possible for this domain */
>                 if (!sbi_hartmask_test_hart(dhart, dom->possible_harts))
>                         continue;
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

