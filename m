From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Nov 2024 17:57:37 +0530
Subject: [PATCH v3 1/2] platform: ensure enough heap size with debug
 triggers extension
In-Reply-To: <20241111022737.336991-2-inochiama@gmail.com>
References: <20241111022737.336991-1-inochiama@gmail.com> <20241111022737.336991-2-inochiama@gmail.com>
Message-ID: <CAAhSdy1xbHm4bZoP1eGn2xTqJOi1-UuXgdb7LDjm4qqfJiVfoA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 11, 2024 at 7:58?AM Inochi Amaoto <inochiama@gmail.com> wrote:
>
> DBTR introduce a big heap allocation to store hart state, this is
> allocated percpu and needs big space when CPU number is high.
>
> Increase the percpu part to fix this problem, and decrease the
> fixed part to avoid too big heap size.
>
> Fixes: 97f234f (lib: sbi: Introduce the SBI debug triggers extension support)
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Xiang W <wxjstz@126.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_platform.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index d7af309..3e21a62 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -150,7 +150,7 @@ struct sbi_platform_operations {
>
>  /** Platform default heap size */
>  #define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)     \
> -                                       (0x8000 + 0x800 * (__num_hart))
> +                                       (0x8000 + 0x1000 * (__num_hart))
>
>  /** Representation of a platform */
>  struct sbi_platform {
> --
> 2.47.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

