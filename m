From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 Sep 2022 15:36:26 +0530
Subject: [PATCH] include: Remove sideleg and sedeleg
In-Reply-To: <20220824145437.400746-1-rpathak@ventanamicro.com>
References: <20220824145437.400746-1-rpathak@ventanamicro.com>
Message-ID: <CAAhSdy0N6-9m7KaMZu9q2VJrtsOapL05NiULcauPiwVj0KB9hQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 24, 2022 at 8:25 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> sideleg and sedeleg csrs are not part of riscv isa spec
> anymore, these csrs were part of N extension which
> is removed from the riscv isa specification.
>
> These commits removed all traces of these csrs from
> riscv spec (https://github.com/riscv/riscv-isa-manual) -
>
> commit f8d27f805b65 ("Remove or downgrade more references to N extension (#674)")
> commit b6cade07034d ("Remove N extension chapter for now")
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  include/sbi/riscv_encoding.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 8884301..b0f08c8 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -312,8 +312,6 @@
>
>  /* Supervisor Trap Setup */
>  #define CSR_SSTATUS                    0x100
> -#define CSR_SEDELEG                    0x102
> -#define CSR_SIDELEG                    0x103
>  #define CSR_SIE                                0x104
>  #define CSR_STVEC                      0x105
>  #define CSR_SCOUNTEREN                 0x106
> --
> 2.34.1
>

