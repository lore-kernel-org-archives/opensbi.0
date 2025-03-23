From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Mar 2025 09:52:33 +0530
Subject: [PATCH v2 4/4] lib: sbi: sbi_init: Allocate MPXY state for each domain
In-Reply-To: <20250225011640.949660-5-alvinga@andestech.com>
References: <20250225011640.949660-1-alvinga@andestech.com> <20250225011640.949660-5-alvinga@andestech.com>
Message-ID: <CAAhSdy3KuUNYB2UOpGXDb3hC3N8-gV8ts5bwsQFJ3Xuvpxu1nA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025 at 6:47?AM Alvin Chang <alvinga@andestech.com> wrote:
>
> Each domain need its own shared memory region. Adjust the
> sbi_mpxy_init() after sbi_domain_finalize() so OpenSBI
> can populate domains from device-tree and allocate their
> own MPXY state.

Even if MXPY shared memory is per-domain, it is the supervisor
software running inside the domain that will set up the MPXY
shared memory and there is no role of OpenSBI here.

This patch is not needed.

Regards,
Anup

>
> Signed-off-by: Yong Li <yong.li@intel.com>
> Tested-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> Tested-by: Alvin Chang <alvinga@andestech.com>
> Reviewed-by: Alvin Chang <alvinga@andestech.com>
> ---
>  lib/sbi/sbi_init.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 62c3268..e144e61 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -313,12 +313,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>                 sbi_hart_hang();
>         }
>
> -       rc = sbi_mpxy_init(scratch);
> -       if (rc) {
> -               sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
> -               sbi_hart_hang();
> -       }
> -
>         /*
>          * Note: Finalize domains after HSM initialization
>          * Note: Finalize domains before HART PMP configuration so
> @@ -331,6 +325,16 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>                 sbi_hart_hang();
>         }
>
> +       /*
> +        * Note: Each domain needs its own MPXY shared memory region.
> +        * Note: Initialize the MPXY after sbi_domain_finalize().
> +        */
> +       rc = sbi_mpxy_init(scratch);
> +       if (rc) {
> +               sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
> +               sbi_hart_hang();
> +       }
> +
>         /*
>          * Note: Platform final initialization should be after finalizing
>          * domains so that it sees correct domain assignment and PMP
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

