From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Aug 2024 13:13:14 +0530
Subject: [PATCH v3 2/2] util: atcsmu.c: modify sbi_printf() formatting
In-Reply-To: <20240801072632.2402741-2-ycliang@andestech.com>
References: <20240801072632.2402741-1-ycliang@andestech.com> <20240801072632.2402741-2-ycliang@andestech.com>
Message-ID: <CAAhSdy24XGnZs28quQDWMQCRNVKDCisVuGPjjgk-r=c_OyvoOg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 1, 2024 at 12:56?PM Leo Yu-Chi Liang <ycliang@andestech.com> wrote:
>
> From: Yu Chien Peter Lin <peterlin@andestech.com>
>
> Beautify multi-line printing.
>
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/sys/atcsmu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/lib/utils/sys/atcsmu.c b/lib/utils/sys/atcsmu.c
> index 676c91f4..2cba0eb7 100644
> --- a/lib/utils/sys/atcsmu.c
> +++ b/lib/utils/sys/atcsmu.c
> @@ -37,17 +37,15 @@ inline bool smu_support_sleep_mode(struct smu_data *smu, u32 sleep_mode,
>         switch (sleep_mode) {
>         case LIGHTSLEEP_MODE:
>                 if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_LIGHT_SLEEP) == 0) {
> -                       sbi_printf(
> -                               "SMU: hart%d (PCS%d) does not support light sleep mode\n",
> -                               hartid, hartid + 3);
> +                       sbi_printf("SMU: hart%d (PCS%d) does not support light sleep mode\n",
> +                                  hartid, hartid + 3);
>                         return false;
>                 }
>                 break;
>         case DEEPSLEEP_MODE:
>                 if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_DEEP_SLEEP) == 0) {
> -                       sbi_printf(
> -                               "SMU: hart%d (PCS%d) does not support deep sleep mode\n",
> -                               hartid, hartid + 3);
> +                       sbi_printf("SMU: hart%d (PCS%d) does not support deep sleep mode\n",
> +                                  hartid, hartid + 3);
>                         return false;
>                 }
>                 break;
> @@ -83,9 +81,8 @@ inline int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr,
>         reset_vector = ((u64)vec_hi << 32) | vec_lo;
>
>         if (reset_vector != (u64)wakeup_addr) {
> -               sbi_printf(
> -                       "hart%d (PCS%d): Failed to program the reset vector.\n",
> -                       hartid, hartid + 3);
> +               sbi_printf("hart%d (PCS%d): Failed to program the reset vector.\n",
> +                          hartid, hartid + 3);
>                 return SBI_EFAIL;
>         } else
>                 return 0;
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

