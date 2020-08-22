From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Sat, 22 Aug 2020 10:32:01 +0200
Subject: [PATCH 4/5] include: sbi: Few cosmetic changes in riscv_encoding.h
In-Reply-To: <20200822051310.21394-5-anup.patel@wdc.com>
References: <20200822051310.21394-1-anup.patel@wdc.com>
 <20200822051310.21394-5-anup.patel@wdc.com>
Message-ID: <d49fb9e0-b6fb-b379-b794-fc125bec97a4@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/22/20 7:13 AM, Anup Patel wrote:
> This patch does few cosmentic changes to riscv_encoding.h:
> 1. Place CSR_CYCLE define close to CSR_HPMCOUNTERx defines
> 2. Rename CSR_HCOUNTERNEN to CSR_HCOUNTEREN
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/riscv_encoding.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 073261f..bb7eb88 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -175,7 +175,6 @@
>  #define CSR_FFLAGS			0x1

The "The RISC-V Instruction Set ManualVolume II: Privileged Architecture
Document Version 20190608" always uses three digits (0x001). For looking
up the definitions it would be preferable to do the same here.

>  #define CSR_FRM				0x2
>  #define CSR_FCSR			0x3
> -#define CSR_CYCLE			0xc00
>  #define CSR_UIE				0x4
>  #define CSR_UTVEC			0x5
>  #define CSR_USCRATCH			0x40
> @@ -183,6 +182,7 @@
>  #define CSR_UCAUSE			0x42
>  #define CSR_UTVAL			0x43
>  #define CSR_UIP				0x44
> +#define CSR_CYCLE			0xc00
>  #define CSR_TIME			0xc01
>  #define CSR_INSTRET			0xc02
>  #define CSR_HPMCOUNTER3			0xc03
> @@ -231,7 +231,7 @@
>  #define CSR_HIE				0x604
>  #define CSR_HTIMEDELTA			0x605
>  #define CSR_HTIMEDELTAH			0x615
> -#define CSR_HCOUNTERNEN			0x606
> +#define CSR_HCOUNTEREN			0x606

Why do you put 0x606 after 0x615? And why is the 0x600 group before
0x200 but after 0xc00.

Where are the 0x6xx values taken from? I can't find them in
aforementioned spec? Links to the reference documents as comments in the
include would be helpful to look up the meaning of the different CSRs.

Best regards

Heinrich

>  #define CSR_HGEIE			0x607
>  #define CSR_HTVAL			0x643
>  #define CSR_HIP				0x644
>


