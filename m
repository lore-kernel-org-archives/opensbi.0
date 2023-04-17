From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Apr 2023 09:18:42 +0530
Subject: [PATCH 1/2] firmware: Optimize loading relocation type
In-Reply-To: <20230404044601.2835305-1-bmeng@tinylab.org>
References: <20230404044601.2835305-1-bmeng@tinylab.org>
Message-ID: <CAAhSdy3HvYZ5qiDT9gK8vWnLwHD-MwZwiBHBGMR3-=SEUdweNQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 4, 2023 at 10:16?AM Bin Meng <bmeng@tinylab.org> wrote:
>
> 't5' already contains relocation type so don't bother reloading it.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  firmware/fw_base.S | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index ceef44f..e30aca6 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -95,7 +95,6 @@ _try_lottery:
>         lla     t4, __dyn_sym_start
>
>  4:
> -       REG_L   t5, -(REGBYTES*2)(t0)   /* t5 <-- relocation info:type */
>         srli    t6, t5, SYM_INDEX       /* t6 <--- sym table index */
>         andi    t5, t5, 0xFF            /* t5 <--- relocation type */
>         li      t3, RELOC_TYPE
> --
> 2.25.1
>

