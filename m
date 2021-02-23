From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 23 Feb 2021 15:40:00 -0800
Subject: [RFC PATCH 04/10] lib: sbi: Remove redundant
 sbi_hsm_hart_started() function
In-Reply-To: <20210221085321.180602-5-anup.patel@wdc.com>
References: <20210221085321.180602-1-anup.patel@wdc.com>
 <20210221085321.180602-5-anup.patel@wdc.com>
Message-ID: <CAOnJCUJ97rAxkEc3=en=VsrsNuVGjO8KU0DY+b26vsvbafbX2Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 21, 2021 at 12:54 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sbi_hsm_hart_started() function is only used by sbi_hsm_hart_stop()
> for checking state of calling HART and current domain assignment.
>
> The atomic_cmpxchg() called by sbi_hsm_hart_stop() will check state of
> calling hart anyway and domain assignment can be checked by other domain
> function such as sbi_domain_is_assigned_hart().
>
> This means sbi_hsm_hart_started() is redundant and can be removed.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/sbi/sbi_hsm.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index a81b821..732c400 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -54,14 +54,6 @@ int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
>         return __sbi_hsm_hart_get_state(hartid);
>  }
>
> -static bool sbi_hsm_hart_started(const struct sbi_domain *dom, u32 hartid)
> -{
> -       if (sbi_hsm_hart_get_state(dom, hartid) == SBI_HSM_STATE_STARTED)
> -               return TRUE;
> -       else
> -               return FALSE;
> -}
> -
>  /**
>   * Get ulong HART mask for given HART base ID
>   * @param dom the domain to be used for output HART mask
> @@ -248,10 +240,11 @@ int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
>  {
>         int oldstate;
>         u32 hartid = current_hartid();
> +       const struct sbi_domain *dom = sbi_domain_thishart_ptr();
>         struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
>                                                             hart_data_offset);
>
> -       if (!sbi_hsm_hart_started(sbi_domain_thishart_ptr(), hartid))
> +       if (dom && !sbi_domain_is_assigned_hart(dom, hartid))
>                 return SBI_EINVAL;
>

Do we need  sbi_domain_is_assigned_hart given that hartid is current
hartid and the domain is retrieved directly from
hartid_to_domain_table.

>         oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STARTED,
> --
> 2.25.1
>

Thanks for the cleanup. What should be the correct error code returned
from sbi_hsm_hart_stop if the current state is not STARTED ?
it will be SBI_EDENIED(-4) but the spec says SBI_ERR_FAILED (-1)

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

