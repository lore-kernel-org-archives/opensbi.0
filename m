From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 10 Dec 2023 11:49:33 +0530
Subject: [PATCH] lib: sbi: skip wait_for_coldboot when coolboot done
In-Reply-To: <20231129135717.310197-1-wxjstz@126.com>
References: <20231129135717.310197-1-wxjstz@126.com>
Message-ID: <CAK9=C2VN2nOF7ro1SCUScMzi=sBuNxEHmSW_kof4oDSDBr1iMw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 29, 2023 at 7:27?PM Xiang W <wxjstz@126.com> wrote:
>
> When warmboot via HSM, coolboot has been completed and
> wait_for_coldboot can be skipped to speed up.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/sbi/sbi_init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index e723553..1f7f522 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -492,7 +492,8 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
>  {
>         int hstate;
>
> -       wait_for_coldboot(scratch, hartid);
> +       if (!__smp_load_acquire(&coldboot_done))
> +               wait_for_coldboot(scratch, hartid);

Better to have this check at the start of wait_for_coldboot()
implementation.

>
>         hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(), hartid);
>         if (hstate < 0)
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

