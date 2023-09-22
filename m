From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Sep 2023 12:18:53 +0530
Subject: [PATCH] lib: sbi: Implement SET_FS_DIRTY() to make sure the
 mstatus FS dirty is set
In-Reply-To: <20230906090114.24625-1-greentime.hu@sifive.com>
References: <20230906090114.24625-1-greentime.hu@sifive.com>
Message-ID: <CAAhSdy1E-Tdo4EGixoH4kQ8Fn0DJQCHxMNqdRYyj1SZDsStdXw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 6, 2023 at 2:31?PM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> We found the mstatus.FS status is not set correctly after the SET_F64_REG()
> and SET_F32_REG(). We should set mstatus.FS dirty after we emulate the FPU
> instructions.
>
> Co-developed-by: Roy Lin <roy.lin@sifive.com>
> Signed-off-by: Roy Lin <roy.lin@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfaut.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/riscv_fp.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h
> index b3dc08b9db6a..3141c1c5b825 100644
> --- a/include/sbi/riscv_fp.h
> +++ b/include/sbi/riscv_fp.h
> @@ -84,7 +84,7 @@
>  #define GET_FFLAGS() csr_read(CSR_FFLAGS)
>  #define SET_FFLAGS(value) csr_write(CSR_FFLAGS, (value))
>
> -#define SET_FS_DIRTY() ((void)0)
> +#define SET_FS_DIRTY(regs) (regs->mstatus |= MSTATUS_FS)
>
>  #define GET_F32_RS1(insn, regs) (GET_F32_REG(insn, 15, regs))
>  #define GET_F32_RS2(insn, regs) (GET_F32_REG(insn, 20, regs))
> @@ -93,9 +93,9 @@
>  #define GET_F64_RS2(insn, regs) (GET_F64_REG(insn, 20, regs))
>  #define GET_F64_RS3(insn, regs) (GET_F64_REG(insn, 27, regs))
>  #define SET_F32_RD(insn, regs, val) \
> -       (SET_F32_REG(insn, 7, regs, val), SET_FS_DIRTY())
> +       (SET_F32_REG(insn, 7, regs, val), SET_FS_DIRTY(regs))
>  #define SET_F64_RD(insn, regs, val) \
> -       (SET_F64_REG(insn, 7, regs, val), SET_FS_DIRTY())
> +       (SET_F64_REG(insn, 7, regs, val), SET_FS_DIRTY(regs))
>
>  #define GET_F32_RS2C(insn, regs) (GET_F32_REG(insn, 2, regs))
>  #define GET_F32_RS2S(insn, regs) (GET_F32_REG(RVC_RS2S(insn), 0, regs))
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

