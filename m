From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Feb 2024 20:50:37 +0530
Subject: [PATCH 1/1] lib: sbi_hsm: Restor hart state to stop when fails to start
In-Reply-To: <20240219071406.41703-1-joshua.yeong@starfivetech.com>
References: <20240219071406.41703-1-joshua.yeong@starfivetech.com>
Message-ID: <CAAhSdy1zL015JgM=TqeVK-nnird_mTgW=TmZttPk5WiGFhnSug@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 19, 2024 at 12:44?PM Joshua Yeong
<joshua.yeong@starfivetech.com> wrote:
>
> Hart state should change back to hart stop when hsm_device_hart_start()
> or sbi_ipi_raw_send() fails to perform hart start.
>
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hsm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 3d60ceb..be48d64 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -360,6 +360,10 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
>
>         if (!rc)
>                 return 0;
> +
> +       /* If it fails to start, change hart state back to stop */
> +       __sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_START_PENDING,
> +                                   SBI_HSM_STATE_STOPPED);
>  err:
>         hsm_start_ticket_release(hdata);
>         return rc;
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

