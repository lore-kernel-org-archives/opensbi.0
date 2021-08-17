From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 16 Aug 2021 17:22:05 -0700
Subject: [PATCH] lib: sbi: Fix bug in sbi_ecall_rfence that misses checking
In-Reply-To: <20210813123300.26085-1-Dd_nirvana@sjtu.edu.cn>
References: <20210813123300.26085-1-Dd_nirvana@sjtu.edu.cn>
Message-ID: <CAOnJCULR-KCvf4A8SZZB31A5_rfK-=Z-onW_Ypgp00o9eHWUVQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 13, 2021 at 5:34 AM Dong Du <Dd_nirvana@sjtu.edu.cn> wrote:
>
> In sbi_ecall_rfence_handler, it will compare the funcid with REMOTE_HFENCE_GVMA and
> REMOTE_HFENCE_VVMA_ASID.
> And then check whether the misa includes H-extension.
> This checking is incomplete which misses REMOTE_HFENCE_GVMA_VMID and REMOTE_HFENCE_VVMA.
> Fix the issue by updating the checking range.
>
> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> ---
>  lib/sbi/sbi_ecall_replace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_ecall_replace.c b/lib/sbi/sbi_ecall_replace.c
> index a7935d9..5d24565 100644
> --- a/lib/sbi/sbi_ecall_replace.c
> +++ b/lib/sbi/sbi_ecall_replace.c
> @@ -54,8 +54,8 @@ static int sbi_ecall_rfence_handler(unsigned long extid, unsigned long funcid,
>         struct sbi_tlb_info tlb_info;
>         u32 source_hart = current_hartid();
>
> -       if (funcid >= SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA &&
> -           funcid <= SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID)
> +       if (funcid >= SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID &&
> +           funcid <= SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA)
>                 if (!misa_extension('H'))
>                         return SBI_ENOTSUPP;
>
> --
> 2.31.1
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

