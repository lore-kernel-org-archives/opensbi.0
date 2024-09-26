From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Sep 2024 11:37:38 +0530
Subject: [PATCH 07/12] lib: sbi: Simplify halt broadcast logic
In-Reply-To: <20240830154929.3971790-8-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com> <20240830154929.3971790-8-samuel.holland@sifive.com>
Message-ID: <CAAhSdy2Ch80xLvKb5iiAVW3NfGnASxvXFkE608KkECwh+TS5rw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 9:19?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Use the IPI .update callback to exclude the local hart. This allows
> reusing the normal logic for broadcasting an IPI to all active harts.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  lib/sbi/sbi_ipi.c    | 10 ++++++++++
>  lib/sbi/sbi_system.c | 11 +----------
>  2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 505aafd8..0cffa0af 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -208,6 +208,15 @@ void sbi_ipi_clear_smode(void)
>         csr_clear(CSR_MIP, MIP_SSIP);
>  }
>
> +static int sbi_ipi_update_halt(struct sbi_scratch *scratch,
> +                              struct sbi_scratch *remote_scratch,
> +                              u32 remote_hartindex, void *data)
> +{
> +       /* Never send a halt IPI to the local hart. */
> +       return scratch == remote_scratch ?
> +               SBI_IPI_UPDATE_BREAK : SBI_IPI_UPDATE_SUCCESS;
> +}
> +
>  static void sbi_ipi_process_halt(struct sbi_scratch *scratch)
>  {
>         sbi_hsm_hart_stop(scratch, true);
> @@ -215,6 +224,7 @@ static void sbi_ipi_process_halt(struct sbi_scratch *scratch)
>
>  static struct sbi_ipi_event_ops ipi_halt_ops = {
>         .name = "IPI_HALT",
> +       .update = sbi_ipi_update_halt,
>         .process = sbi_ipi_process_halt,
>  };
>
> diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
> index c068b725..f3c49bbd 100644
> --- a/lib/sbi/sbi_system.c
> +++ b/lib/sbi/sbi_system.c
> @@ -65,20 +65,11 @@ bool sbi_system_reset_supported(u32 reset_type, u32 reset_reason)
>
>  void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
>  {
> -       ulong hbase = 0, hmask;
> -       u32 cur_hartid = current_hartid();
>         struct sbi_domain *dom = sbi_domain_thishart_ptr();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
>         /* Send HALT IPI to every hart other than the current hart */
> -       while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &hmask)) {
> -               if ((hbase <= cur_hartid)
> -                         && (cur_hartid < hbase + BITS_PER_LONG))
> -                       hmask &= ~(1UL << (cur_hartid - hbase));
> -               if (hmask)
> -                       sbi_ipi_send_halt(hmask, hbase);
> -               hbase += BITS_PER_LONG;
> -       }
> +       sbi_ipi_send_halt(0, -1UL);
>
>         /* Stop current HART */
>         sbi_hsm_hart_stop(scratch, false);
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

