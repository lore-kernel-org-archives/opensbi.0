From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Sep 2024 12:06:59 +0530
Subject: [PATCH 09/12] lib: sbi: Use sbi_hartmask in sbi_hsm_hart_interruptible_mask()
In-Reply-To: <20240830154929.3971790-10-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com> <20240830154929.3971790-10-samuel.holland@sifive.com>
Message-ID: <CAAhSdy0MA9uR5djva31Hv6BF2MrJYAurd4sRy-F05RUF1cM_zg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 9:19?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This removes several hartid/hartindex conversions, as well as two loops
> through the mask for broadcast IPIs.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  include/sbi/sbi_domain.h | 11 +++++------
>  include/sbi/sbi_hsm.h    |  3 ++-
>  lib/sbi/sbi_domain.c     | 13 ++++++-------
>  lib/sbi/sbi_hsm.c        | 37 ++++++++++++++-----------------------
>  lib/sbi/sbi_ipi.c        | 32 +++++++++++++-------------------
>  5 files changed, 40 insertions(+), 56 deletions(-)
>
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index 2c905941..639f9e57 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -237,14 +237,13 @@ extern struct sbi_domain *domidx_to_domain_table[];
>  bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid);
>
>  /**
> - * Get ulong assigned HART mask for given domain and HART base ID
> + * Get the assigned HART mask for given domain
>   * @param dom pointer to domain
> - * @param hbase the HART base ID
> - * @return ulong possible HART mask
> - * Note: the return ulong mask will be set to zero on failure.
> + * @param mask the output hartmask to fill
> + * @return 0 on success and SBI_Exxx (< 0) on failure
>   */
> -ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
> -                                      ulong hbase);
> +int sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
> +                                    struct sbi_hartmask *mask);
>
>  /**
>   * Initialize a domain memory region based on it's physical
> diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
> index d8ca459d..e4b92c80 100644
> --- a/include/sbi/sbi_hsm.h
> +++ b/include/sbi/sbi_hsm.h
> @@ -10,6 +10,7 @@
>  #ifndef __SBI_HSM_H__
>  #define __SBI_HSM_H__
>
> +#include <sbi/sbi_hartmask.h>
>  #include <sbi/sbi_types.h>
>
>  /** Hart state managment device */
> @@ -75,7 +76,7 @@ bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
>  int __sbi_hsm_hart_get_state(u32 hartindex);
>  int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
>  int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
> -                                   ulong hbase, ulong *out_hmask);
> +                                   struct sbi_hartmask *mask);
>  void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch);
>  void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
>                                           u32 hartid);
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 374ac36b..58cd9aaa 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -77,20 +77,19 @@ bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
>         return ret;
>  }
>
> -ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
> -                                      ulong hbase)
> +int sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
> +                                    struct sbi_hartmask *mask)
>  {
>         ulong ret = 0;
>         struct sbi_domain *tdom = (struct sbi_domain *)dom;
>
> -       if (!dom)
> +       if (!dom) {
> +               sbi_hartmask_clear_all(mask);
>                 return 0;
> +       }
>
>         spin_lock(&tdom->assigned_harts_lock);
> -       for (int i = 0; i < 8 * sizeof(ret); i++) {
> -               if (sbi_hartmask_test_hartid(hbase + i, &tdom->assigned_harts))
> -                       ret |= 1UL << i;
> -       }
> +       *mask = tdom->assigned_harts;

We need to introduce sbi_hartmask_copy() and use it here.

>         spin_unlock(&tdom->assigned_harts_lock);
>
>         return ret;
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 5af3c4af..e25dd161 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -110,36 +110,27 @@ static void hsm_start_ticket_release(struct sbi_hsm_data *hdata)
>  }
>
>  /**
> - * Get ulong HART mask for given HART base ID
> + * Get the mask of harts which are valid IPI targets
>   * @param dom the domain to be used for output HART mask
> - * @param hbase the HART base ID
> - * @param out_hmask the output ulong HART mask
> + * @param mask the output hartmask to fill
>   * @return 0 on success and SBI_Exxx (< 0) on failure
> - * Note: the output HART mask will be set to zero on failure as well.
>   */
>  int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
> -                                   ulong hbase, ulong *out_hmask)
> +                                   struct sbi_hartmask *mask)
>  {
> -       int hstate;
> -       ulong i, hmask, dmask;
> -       u32 hartindex;
> +       int hstate, ret;
> +       u32 i;
>
> -       *out_hmask = 0;
> -       if (!sbi_hartid_valid(hbase))
> -               return SBI_EINVAL;
> +       ret = sbi_domain_get_assigned_hartmask(dom, mask);
> +       if (ret)
> +               return ret;
>
> -       dmask = sbi_domain_get_assigned_hartmask(dom, hbase);
> -       for (i = 0; i < BITS_PER_LONG; i++) {
> -               hmask = 1UL << i;
> -               if (!(dmask & hmask))
> -                       continue;
> -
> -               hartindex = sbi_hartid_to_hartindex(hbase + i);
> -               hstate = __sbi_hsm_hart_get_state(hartindex);
> -               if (hstate == SBI_HSM_STATE_STARTED ||
> -                   hstate == SBI_HSM_STATE_SUSPENDED ||
> -                   hstate == SBI_HSM_STATE_RESUME_PENDING)
> -                       *out_hmask |= hmask;
> +       sbi_hartmask_for_each_hartindex(i, mask) {
> +               hstate = __sbi_hsm_hart_get_state(i);
> +               if (hstate != SBI_HSM_STATE_STARTED &&
> +                   hstate != SBI_HSM_STATE_SUSPENDED &&
> +                   hstate != SBI_HSM_STATE_RESUME_PENDING)
> +                       sbi_hartmask_clear_hartindex(i, mask);
>         }
>
>         return 0;
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 0cffa0af..337ed175 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -111,31 +111,25 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
>  {
>         int rc = 0;
>         bool retry_needed;
> -       ulong i, m;
> -       struct sbi_hartmask target_mask = {0};
> +       ulong i;
> +       struct sbi_hartmask target_mask;
>         struct sbi_domain *dom = sbi_domain_thishart_ptr();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
>         /* Find the target harts */
> +       rc = sbi_hsm_hart_interruptible_mask(dom, &target_mask);
> +       if (rc)
> +               return rc;
> +
>         if (hbase != -1UL) {
> -               rc = sbi_hsm_hart_interruptible_mask(dom, hbase, &m);
> -               if (rc)
> -                       return rc;
> -               m &= hmask;
> -
> -               for (i = hbase; m; i++, m >>= 1) {
> -                       if (m & 1UL)
> -                               sbi_hartmask_set_hartid(i, &target_mask);
> -               }
> -       } else {
> -               hbase = 0;
> -               while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
> -                       for (i = hbase; m; i++, m >>= 1) {
> -                               if (m & 1UL)
> -                                       sbi_hartmask_set_hartid(i, &target_mask);
> -                       }
> -                       hbase += BITS_PER_LONG;
> +               struct sbi_hartmask tmp_mask = { 0 };
> +
> +               for (i = hbase; hmask; i++, hmask >>= 1) {
> +                       if (hmask & 1UL)
> +                               sbi_hartmask_set_hartid(i, &tmp_mask);
>                 }
> +
> +               sbi_hartmask_and(&target_mask, &target_mask, &tmp_mask);
>         }
>
>         /* Send IPIs */
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Otherwise, this patch looks good.

Regards,
Anup

