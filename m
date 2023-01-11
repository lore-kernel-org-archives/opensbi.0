From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Jan 2023 18:04:13 +0530
Subject: [PATCH 1/1] Add RISC-V TEE support
In-Reply-To: <004901d925b8$2452b2f0$6cf818d0$@eswincomputing.com>
References: <20230111020159.1234-1-liushiwei@eswincomputing.com>
 <019501d925b4$9e792220$db6b6660$@ventanamicro.com> <004901d925b8$2452b2f0$6cf818d0$@eswincomputing.com>
Message-ID: <CAK9=C2W61XqnQ7i2+LkQAZ2uOkarXF0NSQ=zOhqQw=E8RmVriA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 11, 2023 at 5:58 PM liushiwei <liushiwei@eswincomputing.com> wrote:
>
> Do you mean hardware? Our hardware design referred to arm's trustzone
> technology. optee os is a software solution using arm trustzone hardware,
> which mainly includes REE(linux), TEE(optee os), ATF(ARM Trusted firmware),
> and then our software also developed these three parts. opensbi is similar
> to ATF. whether if this is what you want?  The current committed code is not
> hardware-dependent, but just continues the idea of this workaround, and we
> may commit hardware-dependent code later.

We can't blindly use SBI extension ID and function ID space for TEE.

Please share a draft proposal of how OP-TEE calls will be implemented
as SBI calls.

I see that you have reserved an entire range of SBI extension IDs
for OP-TEE. This is a waste of the SBI extension ID space.

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
> >RISC-V Trusted Executable Environment security software includes linux,
> opensbi, and OP-TEE OS. linux is the non-secure domain, and OP-TEE OS is the
> secure domain. At boot time, opensbi boots OP->TEE OS and then starts linux.
> At runtime, opensbi acts as a secure monitor, responsible for context saving
> and restoring when switching between linux and OP-TEE OS.
> >TEE function is off by default, when using configuration is added in
> >the
> config and objects file, such as platform/generic/configs/defconfig add
> CONFIG_SBI_ECALL_TEE = y, In the >platform/generic/objects.mk add
> CONFIG_TEE_LOAD_ADDR = 0x27c000000, CONFIG_TEE_LOAD_ADDR is the starting
> address of the OP-TEE OS.
>
> Hi Liushiwei,
>
> Was there any formal specification or draft for this? Could you please point
> me to the draft or specification?
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

