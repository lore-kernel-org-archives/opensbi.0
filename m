From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 15 Sep 2024 16:15:29 -0500
Subject: [PATCH] include: sbi: Don't unconditionally define
 '__always_inline'
In-Reply-To: <20240915160426.1136309-1-apatel@ventanamicro.com>
References: <20240915160426.1136309-1-apatel@ventanamicro.com>
Message-ID: <a7a2bccf-8903-41f2-b4ee-a38e3ab53bfb@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-15 11:04 AM, Anup Patel wrote:
> From: Elyes Haouas <ehaouas@noos.fr>
> 
> Update __always_inline macro define to fix opensbi upstream
> build for coreboot.
> Refer, https://qa.coreboot.org/job/coreboot-gerrit/257449/testReport/junit/(root)/clang/EMULATION_QEMU_RISCV_RV64_/
> 
> Closes: https://github.com/riscv-software-src/opensbi/issues/366
> Signed-off-by: Elyes Haouas <ehaouas@noos.fr>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_types.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
> index def88bba..a9943d29 100644
> --- a/include/sbi/sbi_types.h
> +++ b/include/sbi/sbi_types.h
> @@ -69,7 +69,10 @@ typedef uint64_t		be64_t;
>  #define __packed		__attribute__((packed))
>  #define __noreturn		__attribute__((noreturn))
>  #define __aligned(x)		__attribute__((aligned(x)))
> +
> +#ifndef __always_inline
>  #define __always_inline	inline __attribute__((always_inline))
> +#endif

If we're concerned about an existing definition behaving differently, we could
unconditionally #undef __always_inline instead. But I expect any existing
definition to be equivalent, so:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  
>  #define likely(x) __builtin_expect((x), 1)
>  #define unlikely(x) __builtin_expect((x), 0)


