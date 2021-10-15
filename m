From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 15 Oct 2021 12:47:19 -0700
Subject: [PATCH 1/1] lib: sbi: system reset with invalid parameters
In-Reply-To: <20211015134221.35427-1-heinrich.schuchardt@canonical.com>
References: <20211015134221.35427-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAOnJCUKD7VLsgwM=1OCRu8gbDBz_LRiVSUF532tSgSO+thCaVw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 15, 2021 at 7:12 AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The SBI specification requires that sbi_system_reset() returns
> SBI_ERR_INVALID_PARAM if reset_type or reset_reason are not valid.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  lib/sbi/sbi_ecall_replace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_ecall_replace.c b/lib/sbi/sbi_ecall_replace.c
> index 5d24565..93f44da 100644
> --- a/lib/sbi/sbi_ecall_replace.c
> +++ b/lib/sbi/sbi_ecall_replace.c
> @@ -151,7 +151,7 @@ static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
>                 case SBI_SRST_RESET_TYPE_WARM_REBOOT:
>                         break;
>                 default:
> -                       return SBI_ENOTSUPP;
> +                       return SBI_EINVAL;
>                 }
>
>                 switch (regs->a1) {
> @@ -159,7 +159,7 @@ static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
>                 case SBI_SRST_RESET_REASON_SYSFAIL:
>                         break;
>                 default:
> -                       return SBI_ENOTSUPP;
> +                       return SBI_EINVAL;
>                 }
>
>                 if (sbi_system_reset_supported(regs->a0, regs->a1))
> --
> 2.32.0
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

