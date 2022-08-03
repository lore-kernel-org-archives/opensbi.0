From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 3 Aug 2022 14:40:43 +0800
Subject: [RFC PATCH 1/3] include: Add mstatus[h].GVA encodings
In-Reply-To: <TYYP286MB14397B18A8B3A9D04105F211C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB143914043D5A77C568CDDE57C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB14397B18A8B3A9D04105F211C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAEUhbmUVbs6Z7Z41PKdoQQ+jC4KwOKLCumNZb4Z0bXmXP29YGQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 3, 2022 at 1:18 PM dramforever <dramforever@live.com> wrote:
>
> Signed-off-by: dramforever <dramforever@live.com>

Is this "dramforever" the real name?

> ---
>  include/sbi/riscv_encoding.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 798afb7..8884301 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -38,10 +38,14 @@
>  #define MSTATUS_SXL                    _ULL(0x0000000C00000000)
>  #define MSTATUS_SBE                    _ULL(0x0000001000000000)
>  #define MSTATUS_MBE                    _ULL(0x0000002000000000)
> +#define MSTATUS_GVA                    _ULL(0x0000004000000000)
> +#define MSTATUS_GVA_SHIFT              38
>  #define MSTATUS_MPV                    _ULL(0x0000008000000000)
>  #else
>  #define MSTATUSH_SBE                   _UL(0x00000010)
>  #define MSTATUSH_MBE                   _UL(0x00000020)
> +#define MSTATUSH_GVA                   _UL(0x00000040)
> +#define MSTATUSH_GVA_SHIFT             6
>  #define MSTATUSH_MPV                   _UL(0x00000080)
>  #endif
>  #define MSTATUS32_SD                   _UL(0x80000000)
> --
>

Regards,
Bin

