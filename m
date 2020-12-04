From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 3 Dec 2020 22:17:42 -0800
Subject: [PATCH 06/11] lib: sbi: Override domain boot HART when coldboot
 HART assigned to it
In-Reply-To: <20201121094756.4154728-7-anup.patel@wdc.com>
References: <20201121094756.4154728-1-anup.patel@wdc.com>
 <20201121094756.4154728-7-anup.patel@wdc.com>
Message-ID: <CAOnJCUJg4Ys-xqfVveLk9Ejrzehfx-B7_12VuJuqVRXWkerc6A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 21, 2020 at 2:52 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> If coldboot HART is assigned to a domain then we should use coldboot
> HART as the boot HART of the domain. This allows coldboot HART to
> continue boot sequence even when it is assigned to some non-root domain.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/sbi/sbi_domain.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index ecb098c..1b50604 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -395,6 +395,17 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
>                                                 &tdom->assigned_harts);
>                         hartid_to_domain_table[i] = dom;
>                         sbi_hartmask_set_hart(i, &dom->assigned_harts);
> +
> +                       /*
> +                        * If cold boot HART is assigned to this domain then
> +                        * override boot HART of this domain.
> +                        */
> +                       if (i == cold_hartid &&
> +                           dom->boot_hartid != cold_hartid) {
> +                               sbi_printf("Domain%d Boot HARTID forced to"
> +                                          " %d\n", dom->index, cold_hartid);
> +                               dom->boot_hartid = cold_hartid;
> +                       }
>                 }
>         }
>
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

