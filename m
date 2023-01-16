From: liushiwei <liushiwei@eswincomputing.com>
Date: Mon, 16 Jan 2023 21:08:12 +0800
Subject: [PATCH 1/1] Add RISC-V TEE support
Message-ID: <000001d929ab$975448d0$c5fcda70$@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi?Conor.
	I have replied to the question of a draft proposal in another email, and Anup suggested that I edit it in https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc. I tried to push a document edit commit [https://github.com/riscv-non-isa/riscv-sbi-doc/pull/106]. Please check. Am I doing what you expect me to do?

Thanks,
Liushiwei
-----????-----
???: Conor Dooley [mailto:conor at kernel.org] 
????: 2023?1?13? 19:47
???: opensbi at lists.infradead.org; liushiwei <liushiwei@eswincomputing.com>; 'Anup Patel' <apatel@ventanamicro.com>
??: hchauhan at ventanamicro.com; chenchaokai at eswincomputing.com
??: Re: ??: [PATCH 1/1] Add RISC-V TEE support



On 13 January 2023 03:30:41 GMT, liushiwei <liushiwei@eswincomputing.com> wrote:
>Hi,  Anup

It'd be nice if you'd respond inline so that following the conversation was easier.
And responding from a mobile device would be too!

>	I've combed through the linux code. What do you think of the following 
>change?
>
>diff --git a/arch/riscv/include/asm/sbi.h 
>b/arch/riscv/include/asm/sbi.h index d1c37479d..9696c8c77 100644
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


