From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Mar 2024 10:58:52 +0530
Subject: [PATCH] lib: sbi_domain: Fix PMP condition for addresses
In-Reply-To: <20240227200743.22661-1-cmax@mailbox.org>
References: <20240227200743.22661-1-cmax@mailbox.org>
Message-ID: <CAAhSdy3NLBLbFQps0QtQj5q3ZeAb+V51XH1rbHyCbVihEYoomQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 28, 2024 at 1:38?AM <cmax@mailbox.org> wrote:
>
> From: max <cmax@mailbox.org>
>
> In order to put an address/size into an NAPOT PMP region, the address
> needs to be aligned to the size shifted two to the right.
>
> Example:
> fw_start: 0x80040000
> fw_size:  0x00040000
> PMP address: 0x80040000 | (0x00040000 >> 2)
> fw_size is valid, but not in the current implementation

We are creating two separate PMP regions for FW:
1) Read-only (Text + RO-data)
    Base: fw_start
    Size: fw_rw_offset
2) Read-write (Data + Stack + Scratch + Heap)
    Base: fw_start + fw_rw_offset
    Size: fw_size - fw_rw_offset

Due to above, fw_rw_offset MUST be non-zero value and power-of-2
Also, fw_start has to be aligned to the fw_rw_offset size.

>
> Signed-off-by: max <cmax@mailbox.org>
> ---
>  lib/sbi/sbi_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 4e9f742..94ee717 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -749,7 +749,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>                 return SBI_EINVAL;
>         }
>
> -       if ((scratch->fw_start & (scratch->fw_rw_offset - 1)) != 0) {
> +       if ((scratch->fw_start & ((scratch->fw_rw_offset >> 2) - 1)) != 0) {

For sure, this change breaks the alignment check on fw_start.

>                 sbi_printf("%s: fw_start and fw_rw_offset not aligned\n",
>                            __func__);
>                 return SBI_EINVAL;
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

