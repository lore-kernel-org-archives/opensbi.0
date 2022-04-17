From: Anup Patel <anup@brainfault.org>
Date: Sun, 17 Apr 2022 14:34:39 +0530
Subject: [PATCH] include: correct the definition of MSTATUS_VS
In-Reply-To: <20220412011653.27641-1-vincent.chen@sifive.com>
References: <20220412011653.27641-1-vincent.chen@sifive.com>
Message-ID: <CAAhSdy1U3_CxD58wvKESL36x0ETLEb6BMKnRjOP5muhm=XTvgg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 12, 2022 at 6:47 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> Accordind to the RISC-V privileged specification, the VS filed is
> mstatus[10:9] instead of mstatus[24:23]. Modify the MSTATUS_VS
> to the correct value.
>
> Reported-by: I-Cheng Cheng <i-cheng.cheng@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/riscv_encoding.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 04d5621..a9772a6 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -25,7 +25,7 @@
>  #define MSTATUS_MPP                    (_UL(3) << MSTATUS_MPP_SHIFT)
>  #define MSTATUS_FS                     _UL(0x00006000)
>  #define MSTATUS_XS                     _UL(0x00018000)
> -#define MSTATUS_VS                     _UL(0x01800000)
> +#define MSTATUS_VS                     _UL(0x00000600)
>  #define MSTATUS_MPRV                   _UL(0x00020000)
>  #define MSTATUS_SUM                    _UL(0x00040000)
>  #define MSTATUS_MXR                    _UL(0x00080000)
> --
> 2.17.1
>

