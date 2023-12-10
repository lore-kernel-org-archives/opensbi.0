From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 10 Dec 2023 13:40:52 +0530
Subject: [PATCH] lib: sbi_hsm: Put the resume_pending hart in the
 interruptible hart mask
In-Reply-To: <20231201095147.1791731-1-nick.hu@sifive.com>
References: <20231201095147.1791731-1-nick.hu@sifive.com>
Message-ID: <CAK9=C2XPMMzBAeW20SDZhsj492t+gJT1Kdjh75cHAeZD=EeTsQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 1, 2023 at 3:22?PM Nick Hu <nick.hu@sifive.com> wrote:
>
> Current interruptible hart mask doesn't include the hart which HSM state
> is SBI_HSM_STATE_RESUME_PENDING. So when there is a request to send an
> IPI to the hart which is in the resume process, this hart would miss the
> IPI forever. Put the SBI_HSM_STATE_RESUME_PENDING hart in the
> interruptible hart mask to fix the issue.
>
> Signed-off-by: Nick Hu <nick.hu@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hsm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 147f954..3d60ceb 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -128,7 +128,8 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
>
>                 hstate = __sbi_hsm_hart_get_state(hbase + i);
>                 if (hstate == SBI_HSM_STATE_STARTED ||
> -                   hstate == SBI_HSM_STATE_SUSPENDED)
> +                   hstate == SBI_HSM_STATE_SUSPENDED ||
> +                   hstate == SBI_HSM_STATE_RESUME_PENDING)
>                         *out_hmask |= hmask;
>         }
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

