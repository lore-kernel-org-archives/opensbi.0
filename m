From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 12 Nov 2022 00:49:14 -0800
Subject: [RFC PATCH 1/3] include: Add defines for SBI debug console extension
In-Reply-To: <20221110170016.1477865-2-apatel@ventanamicro.com>
References: <20221110170016.1477865-1-apatel@ventanamicro.com> <20221110170016.1477865-2-apatel@ventanamicro.com>
Message-ID: <CAOnJCUJ6seDva3+4i=KgAvOyyMm8zco9y7ORjHN6XMpw2W=5WQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 10, 2022 at 9:01 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add SBI debug console extension related defines/enum to the
> SBI ecall interface header.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_ecall_interface.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index a3f2bf4..1dd3874 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -29,6 +29,7 @@
>  #define SBI_EXT_HSM                            0x48534D
>  #define SBI_EXT_SRST                           0x53525354
>  #define SBI_EXT_PMU                            0x504D55
> +#define SBI_EXT_DBCN                           0x4442434E
>
>  /* SBI function IDs for BASE extension*/
>  #define SBI_EXT_BASE_GET_SPEC_VERSION          0x0
> @@ -230,6 +231,9 @@ enum sbi_pmu_ctr_type {
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>
> +/* SBI function IDs for DBCN extension */
> +#define SBI_EXT_DBCN_CONSOLE_PUTS              0x0
> +
>  /* SBI base specification related macros */
>  #define SBI_SPEC_VERSION_MAJOR_OFFSET          24
>  #define SBI_SPEC_VERSION_MAJOR_MASK            0x7f
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

