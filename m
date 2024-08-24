From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Aug 2024 13:13:02 +0530
Subject: [PATCH v3 1/2] util: atcsmu.c: fix typo "%s/hard/hart/"
In-Reply-To: <20240801072632.2402741-1-ycliang@andestech.com>
References: <20240801072632.2402741-1-ycliang@andestech.com>
Message-ID: <CAAhSdy3Bn3cS992z-i6+4vGQ4-7=bkGppocvUZqk5kcyXrtE0g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 1, 2024 at 12:56?PM Leo Yu-Chi Liang <ycliang@andestech.com> wrote:
>
> %s/hard/hart
>
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/sys/atcsmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/utils/sys/atcsmu.c b/lib/utils/sys/atcsmu.c
> index 8ddd88d5..676c91f4 100644
> --- a/lib/utils/sys/atcsmu.c
> +++ b/lib/utils/sys/atcsmu.c
> @@ -84,7 +84,7 @@ inline int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr,
>
>         if (reset_vector != (u64)wakeup_addr) {
>                 sbi_printf(
> -                       "hard%d (PCS%d): Failed to program the reset vector.\n",
> +                       "hart%d (PCS%d): Failed to program the reset vector.\n",
>                         hartid, hartid + 3);
>                 return SBI_EFAIL;
>         } else
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

