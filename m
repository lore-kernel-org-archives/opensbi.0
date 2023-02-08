From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Feb 2023 18:26:31 +0530
Subject: [PATCH v2 3/3] include: types: Add typedefs for endianness
In-Reply-To: <20230202044427.1253816-4-rpathak@ventanamicro.com>
References: <20230202044427.1253816-1-rpathak@ventanamicro.com> <20230202044427.1253816-4-rpathak@ventanamicro.com>
Message-ID: <CAAhSdy01EcPCQAYtF438J6ad4+rh9MeecGG+w6fyDHvCV6jm=g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 2, 2023 at 10:15 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> If any variable/memory-location follows certain
> endianness then its important to annotate it properly
> so that proper conversion can be done before read/write
> from that variable/memory.
>
> Also, use these new typedefs in libfdt_env.h for deriving
> its own custom fdtX_t types
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_types.h       | 7 +++++++
>  lib/utils/libfdt/libfdt_env.h | 6 +++---
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
> index 9c1fef3b8dc6..def88bbad2c3 100644
> --- a/include/sbi/sbi_types.h
> +++ b/include/sbi/sbi_types.h
> @@ -54,6 +54,13 @@ typedef unsigned long                virtual_size_t;
>  typedef unsigned long          physical_addr_t;
>  typedef unsigned long          physical_size_t;
>
> +typedef uint16_t               le16_t;
> +typedef uint16_t               be16_t;
> +typedef uint32_t               le32_t;
> +typedef uint32_t               be32_t;
> +typedef uint64_t               le64_t;
> +typedef uint64_t               be64_t;
> +
>  #define true                   1
>  #define false                  0
>
> diff --git a/lib/utils/libfdt/libfdt_env.h b/lib/utils/libfdt/libfdt_env.h
> index e5ad7698efca..6ebbae01b514 100644
> --- a/lib/utils/libfdt/libfdt_env.h
> +++ b/lib/utils/libfdt/libfdt_env.h
> @@ -38,9 +38,9 @@
>  #define strlen         sbi_strlen
>  #define strnlen                sbi_strnlen
>
> -typedef uint16_t FDT_BITWISE fdt16_t;
> -typedef uint32_t FDT_BITWISE fdt32_t;
> -typedef uint64_t FDT_BITWISE fdt64_t;
> +typedef be16_t FDT_BITWISE fdt16_t;
> +typedef be32_t FDT_BITWISE fdt32_t;
> +typedef be64_t FDT_BITWISE fdt64_t;
>
>  static inline uint16_t fdt16_to_cpu(fdt16_t x)
>  {
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

