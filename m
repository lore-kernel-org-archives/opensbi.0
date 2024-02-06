From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Feb 2024 12:53:28 +0530
Subject: [PATCH v3 01/10] firmware: fw_base.S: Improve loading u32
In-Reply-To: <20240117104212.1055737-2-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com> <20240117104212.1055737-2-wxjstz@126.com>
Message-ID: <CAAhSdy1bz0n=-7BAZ11rsTbUqtNpQ0a6iL4BMtRxSBrLRXbm=w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 17, 2024 at 4:12?PM Xiang W <wxjstz@126.com> wrote:
>
> lwu exists under the current rv64 and should also exist under the rv128
> in the future, so I modified the conditions of conditional compilation
> so that it can adapt to the future situation
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  firmware/fw_base.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index f7763f4..2f30d00 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -358,7 +358,7 @@ _scratch_init:
>         /* t0 = source FDT start address */
>         add     t0, a1, zero
>         /* t2 = source FDT size in big-endian */
> -#if __riscv_xlen == 64
> +#if __riscv_xlen > 32
>         lwu     t2, 4(t0)
>  #else
>         lw      t2, 4(t0)
> @@ -424,7 +424,7 @@ _start_warm:
>
>         /* Find HART count and HART stack size */
>         lla     a4, platform
> -#if __riscv_xlen == 64
> +#if __riscv_xlen > 32
>         lwu     s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
>         lwu     s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
>  #else
> @@ -440,7 +440,7 @@ _start_warm:
>         beqz    s9, 3f
>         li      a4, 0
>  1:
> -#if __riscv_xlen == 64
> +#if __riscv_xlen > 32
>         lwu     a5, (s9)
>  #else
>         lw      a5, (s9)
> @@ -527,7 +527,7 @@ _hartid_to_scratch:
>          * t2 -> Temporary
>          */
>         lla     t2, platform
> -#if __riscv_xlen == 64
> +#if __riscv_xlen > 32
>         lwu     t0, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(t2)
>         lwu     t2, SBI_PLATFORM_HART_COUNT_OFFSET(t2)
>  #else
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

