From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Dec 2023 10:49:39 +0530
Subject: [PATCH] lib: sbi_tlb: Check tlb_range_flush_limit only once per request
In-Reply-To: <20231208203532.3640005-1-samuel.holland@sifive.com>
References: <20231208203532.3640005-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy22y9Gnhqx+Fer653J75pnJPDAEPF6piPx9GiTFn6+YKg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 9, 2023 at 2:05?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> The tlb_update() callback is called for each destination hart.
> Move the size check earlier, so it is executed only once.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Applied this patch to the riscv/opensbi

Thanks,
Anup

> ---
>
>  lib/sbi/sbi_tlb.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> index dad95088..d3ed56df 100644
> --- a/lib/sbi/sbi_tlb.c
> +++ b/lib/sbi/sbi_tlb.c
> @@ -327,16 +327,6 @@ static int tlb_update(struct sbi_scratch *scratch,
>         struct sbi_tlb_info *tinfo = data;
>         u32 curr_hartid = current_hartid();
>
> -       /*
> -        * If address range to flush is too big then simply
> -        * upgrade it to flush all because we can only flush
> -        * 4KB at a time.
> -        */
> -       if (tinfo->size > tlb_range_flush_limit) {
> -               tinfo->start = 0;
> -               tinfo->size = SBI_TLB_FLUSH_ALL;
> -       }
> -
>         /*
>          * If the request is to queue a tlb flush entry for itself
>          * then just do a local flush and return;
> @@ -385,6 +375,16 @@ int sbi_tlb_request(ulong hmask, ulong hbase, struct sbi_tlb_info *tinfo)
>         if (!tinfo->local_fn)
>                 return SBI_EINVAL;
>
> +       /*
> +        * If address range to flush is too big then simply
> +        * upgrade it to flush all because we can only flush
> +        * 4KB at a time.
> +        */
> +       if (tinfo->size > tlb_range_flush_limit) {
> +               tinfo->start = 0;
> +               tinfo->size = SBI_TLB_FLUSH_ALL;
> +       }
> +
>         tlb_pmu_incr_fw_ctr(tinfo);
>
>         return sbi_ipi_send_many(hmask, hbase, tlb_event, tinfo);
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

