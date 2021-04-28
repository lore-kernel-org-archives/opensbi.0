From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 28 Apr 2021 10:11:32 +0000
Subject: [PATCH v2] platform: generic: Enable FW_PIC=y as default
In-Reply-To: <1619506825-2230-1-git-send-email-guoren@kernel.org>
References: <1619506825-2230-1-git-send-email-guoren@kernel.org>
Message-ID: <DM6PR04MB620172FB236529DA5B971CC78D409@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: guoren at kernel.org <guoren@kernel.org>
> Sent: 27 April 2021 12:30
> To: guoren at kernel.org; anup at brainfault.org
> Cc: opensbi at lists.infradead.org; Guo Ren <guoren@linux.alibaba.com>;
> Anup Patel <Anup.Patel@wdc.com>; Vincent Chen
> <vincent.chen@sifive.com>
> Subject: [PATCH v2] platform: generic: Enable FW_PIC=y as default
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Tested with qemu_rv32 & rv64, T-HEAD all hardwares. I think it's time to
> enable it as default.
> 
> Thx Vincent's commit: 0f20e8adcf42
> 
> Suggested-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Tested-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Vincent Chen <vincent.chen@sifive.com>

Replaced patch subject prefix with "firmware:" and also updated
commit description.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> ---
>  firmware/objects.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/firmware/objects.mk b/firmware/objects.mk index
> c1f632e..ce91c2f 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -13,6 +13,10 @@ firmware-cflags-y +=
>  firmware-asflags-y +=
>  firmware-ldflags-y +=
> 
> +ifndef FW_PIC
> +FW_PIC := y
> +endif
> +
>  ifeq ($(FW_PIC),y)
>  firmware-genflags-y +=	-DFW_PIC
>  firmware-asflags-y  +=	-fpic
> --
> 2.7.4


