From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Nov 2024 17:57:10 +0530
Subject: include: sbi: Fix typo error
In-Reply-To: <26d04436b267d54453d1c055641dc0247edf8c36.1729667906.git.runmin.zhang@ingenic.com>
References: <26d04436b267d54453d1c055641dc0247edf8c36.1729667906.git.runmin.zhang@ingenic.com>
Message-ID: <CAAhSdy3x9QPTStQx750+Ccf7Ecuxrxee8egTDTtA6r-eE9dD0Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 23, 2024 at 1:10?PM Zhang Runmin <runmin.zhang@ingenic.com> wrote:
>
> From: Zhang RunMin <runmin.zhang@ingenic.com>
>

Please don't leave patch description empty. This time I have added
a single sentence at the time of merging this patch.

> Signed-off-by: Zhang RunMin <runmin.zhang@ingenic.com>

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup
> ---
>  include/sbi/sbi_scratch.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 9ae4f89..f3c2175 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -22,7 +22,7 @@
>  #define SBI_SCRATCH_FW_RW_OFFSET               (2 * __SIZEOF_POINTER__)
>  /** Offset of fw_heap_offset member in sbi_scratch */
>  #define SBI_SCRATCH_FW_HEAP_OFFSET             (3 * __SIZEOF_POINTER__)
> -/** Offset of fw_heap_size_offset member in sbi_scratch */
> +/** Offset of fw_heap_size member in sbi_scratch */
>  #define SBI_SCRATCH_FW_HEAP_SIZE_OFFSET                (4 * __SIZEOF_POINTER__)
>  /** Offset of next_arg1 member in sbi_scratch */
>  #define SBI_SCRATCH_NEXT_ARG1_OFFSET           (5 * __SIZEOF_POINTER__)
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

