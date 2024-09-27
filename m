From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Sep 2024 10:53:05 +0530
Subject: [PATCH] include: sbi: Don't unconditionally define '__always_inline'
In-Reply-To: <20240915160426.1136309-1-apatel@ventanamicro.com>
References: <20240915160426.1136309-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy1-Ayi9R1s6ejtDB4wsPGLZjM691c0+ocRweKTAcig+MA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 15, 2024 at 9:34?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Elyes Haouas <ehaouas@noos.fr>
>
> Update __always_inline macro define to fix opensbi upstream
> build for coreboot.
> Refer, https://qa.coreboot.org/job/coreboot-gerrit/257449/testReport/junit/(root)/clang/EMULATION_QEMU_RISCV_RV64_/
>
> Closes: https://github.com/riscv-software-src/opensbi/issues/366
> Signed-off-by: Elyes Haouas <ehaouas@noos.fr>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_types.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
> index def88bba..a9943d29 100644
> --- a/include/sbi/sbi_types.h
> +++ b/include/sbi/sbi_types.h
> @@ -69,7 +69,10 @@ typedef uint64_t             be64_t;
>  #define __packed               __attribute__((packed))
>  #define __noreturn             __attribute__((noreturn))
>  #define __aligned(x)           __attribute__((aligned(x)))
> +
> +#ifndef __always_inline
>  #define __always_inline        inline __attribute__((always_inline))
> +#endif
>
>  #define likely(x) __builtin_expect((x), 1)
>  #define unlikely(x) __builtin_expect((x), 0)
> --
> 2.43.0
>

