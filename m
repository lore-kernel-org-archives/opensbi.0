From: Conor Dooley <conor@kernel.org>
Date: Fri, 13 Jan 2023 11:46:43 +0000
Subject: =?UTF-8?Q?Re=3A_=E7=AD=94=E5=A4=8D=3A_=5BPATCH_1/1=5D_A?= =?UTF-8?Q?dd_RISC-V_TEE_support?=
In-Reply-To: <000a01d926ff$69edd310$3dc97930$@eswincomputing.com>
References: <20230111020159.1234-1-liushiwei@eswincomputing.com> <019501d925b4$9e792220$db6b6660$@ventanamicro.com> <004901d925b8$2452b2f0$6cf818d0$@eswincomputing.com> <CAK9=C2W61XqnQ7i2+LkQAZ2uOkarXF0NSQ=zOhqQw=E8RmVriA@mail.gmail.com> <000a01d926ff$69edd310$3dc97930$@eswincomputing.com>
Message-ID: <12E61229-3007-4AAD-948D-C8B8296808E2@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 13 January 2023 03:30:41 GMT, liushiwei <liushiwei@eswincomputing.com> wrote:
>Hi,  Anup

It'd be nice if you'd respond inline so that following the conversation was easier.
And responding from a mobile device would be too!

>	I've combed through the linux code. What do you think of the following change?
>
>diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>index d1c37479d..9696c8c77 100644
>--- a/arch/riscv/include/asm/sbi.h
>+++ b/arch/riscv/include/asm/sbi.h
>@@ -29,6 +29,7 @@ enum sbi_ext_id {
>        SBI_EXT_RFENCE = 0x52464E43,
>        SBI_EXT_HSM = 0x48534D,
>        SBI_EXT_SRST = 0x53525354,
>+       SBI_EXT_TEE = 0x544545,

This range is reserved for official extensions.
Can you please respond to Anup's request, preserved below, for a draft proposal?

>	I find that these values are just transformations of these letters?So I just use the ext id, not the func id?
>	While the sbi_ecall_tee_handler function uses other registers, such as t0.

Anup wrote:
> >We can't blindly use SBI extension ID and function ID space for TEE.
> >Please share a draft proposal of how OP-TEE calls will be implemented as SBI calls.

Thanks,
Conor.


