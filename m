From: liushiwei <liushiwei@eswincomputing.com>
Date: Fri, 13 Jan 2023 11:30:41 +0800
Subject: =?UTF-8?Q?=E7=AD=94=E5=A4=8D:_=5BPATCH_1/1=5D_Add_RISC-V_TEE_s?=
	=?UTF-8?Q?upport?=
References: <20230111020159.1234-1-liushiwei@eswincomputing.com> <019501d925b4$9e792220$db6b6660$@ventanamicro.com> <004901d925b8$2452b2f0$6cf818d0$@eswincomputing.com> <CAK9=C2W61XqnQ7i2+LkQAZ2uOkarXF0NSQ=zOhqQw=E8RmVriA@mail.gmail.com> 
Message-ID: <000a01d926ff$69edd310$3dc97930$@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,  Anup
	I've combed through the linux code. What do you think of the following change?

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index d1c37479d..9696c8c77 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -29,6 +29,7 @@ enum sbi_ext_id {
        SBI_EXT_RFENCE = 0x52464E43,
        SBI_EXT_HSM = 0x48534D,
        SBI_EXT_SRST = 0x53525354,
+       SBI_EXT_TEE = 0x544545,

	I find that these values are just transformations of these letters?So I just use the ext id, not the func id?
	While the sbi_ecall_tee_handler function uses other registers, such as t0.

Regards,
Liushiwei

-----????-----
???: liushiwei [mailto:liushiwei at eswincomputing.com] 
????: 2023?1?12? 15:06
???: 'Anup Patel' <apatel@ventanamicro.com>
??: 'hchauhan at ventanamicro.com' <hchauhan@ventanamicro.com>; 'opensbi at lists.infradead.org' <opensbi@lists.infradead.org>; 'chenchaokai at eswincomputing.com' <chenchaokai@eswincomputing.com>
??: ??: [PATCH 1/1] Add RISC-V TEE support

Hi,  Anup
	You mean this code?
+#define SBI_EXT_TEE_START                      0x0A000000
+#define SBI_EXT_TEE_END                        0x0AFFFFFF
+#define SBI_EXT_TEE                            0xFFFFEEEE
	Current code is not in use SBI_EXT_TEE_START and SBI_EXT_TEE_END, I use SBI_EXT_TEE, I wrote these two macros in reference to SBI_EXT_FIRMWARE_START,  I'd like your advice on this part.
	Currently, there are 20 scenarios, 12 of which are reserved for later use. I am not familiar with the rules for the use of SBI extension ID and funciton ID. Because of the number of arguments, instead of using linux sbi_ecall, I encapsulated the ecall instruction by ourselves.
I are not sure if this approach meets the requirements of opensbi and linux, So I made a redundant macro definition here. 
Could you give me some advice?  Thank you.


Regards,
liushiwei

-----????-----
???: Anup Patel [mailto:apatel at ventanamicro.com] 
????: 2023?1?11? 20:34
???: liushiwei <liushiwei@eswincomputing.com>
??: hchauhan at ventanamicro.com; opensbi at lists.infradead.org; chenchaokai at eswincomputing.com
??: Re: [PATCH 1/1] Add RISC-V TEE support

On Wed, Jan 11, 2023 at 5:58 PM liushiwei <liushiwei@eswincomputing.com> wrote:
>
> Do you mean hardware? Our hardware design referred to arm's trustzone 
> technology. optee os is a software solution using arm trustzone 
> hardware, which mainly includes REE(linux), TEE(optee os), ATF(ARM 
> Trusted firmware), and then our software also developed these three 
> parts. opensbi is similar to ATF. whether if this is what you want?  
> The current committed code is not hardware-dependent, but just 
> continues the idea of this workaround, and we may commit hardware-dependent code later.

We can't blindly use SBI extension ID and function ID space for TEE.

Please share a draft proposal of how OP-TEE calls will be implemented as SBI calls.

I see that you have reserved an entire range of SBI extension IDs for OP-TEE. This is a waste of the SBI extension ID space.

Regards,
Anup

>
> -----????-----
> ???: hchauhan at ventanamicro.com [mailto:hchauhan at ventanamicro.com]
> ????: 2023?1?11? 20:03
> ???: 'liushiwei' <liushiwei@eswincomputing.com>; opensbi at lists.infradead.
> org
> ??: chenchaokai at eswincomputing.com
> ??: RE: [PATCH 1/1] Add RISC-V TEE support
>
> -----Original Message-----
> > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of 
> > liushiwei
> > Sent: 11 January 2023 07:32
> > To: opensbi at lists.infradead.org
> > Cc: chenchaokai at eswincomputing.com; liushiwei
> <liushiwei@eswincomputing.com>
> > Subject: [PATCH 1/1] Add RISC-V TEE support
>
> >RISC-V Trusted Executable Environment security software includes 
> >linux,
> opensbi, and OP-TEE OS. linux is the non-secure domain, and OP-TEE OS 
> is the secure domain. At boot time, opensbi boots OP->TEE OS and then starts linux.
> At runtime, opensbi acts as a secure monitor, responsible for context 
> saving and restoring when switching between linux and OP-TEE OS.
> >TEE function is off by default, when using configuration is added in 
> >the
> config and objects file, such as platform/generic/configs/defconfig 
> add CONFIG_SBI_ECALL_TEE = y, In the >platform/generic/objects.mk add 
> CONFIG_TEE_LOAD_ADDR = 0x27c000000, CONFIG_TEE_LOAD_ADDR is the 
> starting address of the OP-TEE OS.
>
> Hi Liushiwei,
>
> Was there any formal specification or draft for this? Could you please 
> point me to the draft or specification?
>
> Regards
> Himanshu
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


