From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 21 Dec 2020 15:57:51 -0800
Subject: [PATCH v2] lib: sbi: Fix sign-extension in
 sbi_misaligned_load_handler()
In-Reply-To: <20201221042530.31523-1-anup.patel@wdc.com>
References: <20201221042530.31523-1-anup.patel@wdc.com>
Message-ID: <CAOnJCU++LCoNNNRfV6099-VKk6Cfvy2C75QR0CXjdfq+k1jWJQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 20, 2020 at 8:26 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The misaligned load emulation does not sign-extend values correctly
> due to missing sign typecast in value passed to the SET_RD() macro.
>
> A very easy way to reproduce this issue is to load 16-bit value
> 0xff1e from a byte aligned address using LH instruction on hardware
> lacking misaligned load/store.
>
> This patch fixes sbi_misaligned_load_handler() for above issue.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> Changes since v1:
>  - Cast after left-shift and use braces.
> ---
>  lib/sbi/sbi_misaligned_ldst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_misaligned_ldst.c b/lib/sbi/sbi_misaligned_ldst.c
> index 964a372..5057cb5 100644
> --- a/lib/sbi/sbi_misaligned_ldst.c
> +++ b/lib/sbi/sbi_misaligned_ldst.c
> @@ -128,7 +128,7 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
>         }
>
>         if (!fp)
> -               SET_RD(insn, regs, val.data_ulong << shift >> shift);
> +               SET_RD(insn, regs, ((long)(val.data_ulong << shift)) >> shift);
>  #ifdef __riscv_flen
>         else if (len == 8)
>                 SET_F64_RD(insn, regs, val.data_u64);
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

