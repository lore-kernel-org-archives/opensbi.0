From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 23 Feb 2021 15:00:26 -0800
Subject: [RFC PATCH 01/10] include: sbi: Simplify HSM state define names
In-Reply-To: <20210221085321.180602-2-anup.patel@wdc.com>
References: <20210221085321.180602-1-anup.patel@wdc.com>
 <20210221085321.180602-2-anup.patel@wdc.com>
Message-ID: <CAOnJCU+2fzPcVp-=JTm9-94rzjKVeDO4pHr1Cv__pjXr9HiU5g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 21, 2021 at 12:54 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We simplify HSM state define names so that these defines can directly
> replace SBI_HART_xyz defines used by SBI HSM implementation.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/sbi_ecall_interface.h | 8 ++++----
>  lib/sbi/sbi_hsm.c                 | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index 002c6f9..b272213 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -58,10 +58,10 @@
>  #define SBI_EXT_HSM_HART_STOP                  0x1
>  #define SBI_EXT_HSM_HART_GET_STATUS            0x2
>
> -#define SBI_HSM_HART_STATUS_STARTED            0x0
> -#define SBI_HSM_HART_STATUS_STOPPED            0x1
> -#define SBI_HSM_HART_STATUS_START_PENDING      0x2
> -#define SBI_HSM_HART_STATUS_STOP_PENDING       0x3
> +#define SBI_HSM_STATE_STARTED                  0x0
> +#define SBI_HSM_STATE_STOPPED                  0x1
> +#define SBI_HSM_STATE_START_PENDING            0x2
> +#define SBI_HSM_STATE_STOP_PENDING             0x3
>
>  /* SBI function IDs for SRST extension */
>  #define SBI_EXT_SRST_RESET                     0x0
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index e1b2b2c..1722280 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -39,16 +39,16 @@ int sbi_hsm_hart_state_to_status(int state)
>
>         switch (state) {
>         case SBI_HART_STOPPED:
> -               ret = SBI_HSM_HART_STATUS_STOPPED;
> +               ret = SBI_HSM_STATE_STOPPED;
>                 break;
>         case SBI_HART_STOPPING:
> -               ret = SBI_HSM_HART_STATUS_STOP_PENDING;
> +               ret = SBI_HSM_STATE_STOP_PENDING;
>                 break;
>         case SBI_HART_STARTING:
> -               ret = SBI_HSM_HART_STATUS_START_PENDING;
> +               ret = SBI_HSM_STATE_START_PENDING;
>                 break;
>         case SBI_HART_STARTED:
> -               ret = SBI_HSM_HART_STATUS_STARTED;
> +               ret = SBI_HSM_STATE_STARTED;
>                 break;
>         default:
>                 ret = SBI_EINVAL;
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

