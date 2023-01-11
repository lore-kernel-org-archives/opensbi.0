From: hchauhan@ventanamicro.com <hchauhan@ventanamicro.com>
Date: Wed, 11 Jan 2023 17:32:44 +0530
Subject: [PATCH 1/1] Add RISC-V TEE support
In-Reply-To: <20230111020159.1234-1-liushiwei@eswincomputing.com>
References: <20230111020159.1234-1-liushiwei@eswincomputing.com>
Message-ID: <019501d925b4$9e792220$db6b6660$@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

-----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of liushiwei
> Sent: 11 January 2023 07:32
> To: opensbi at lists.infradead.org
> Cc: chenchaokai at eswincomputing.com; liushiwei
<liushiwei@eswincomputing.com>
> Subject: [PATCH 1/1] Add RISC-V TEE support

>RISC-V Trusted Executable Environment security software includes linux,
opensbi, and OP-TEE OS. linux is the non-secure domain, and OP-TEE OS is the
secure domain. At boot time, opensbi boots OP->TEE OS and then starts linux.
At runtime, opensbi acts as a secure monitor, responsible for context saving
and restoring when switching between linux and OP-TEE OS.
>TEE function is off by default, when using configuration is added in the
config and objects file, such as platform/generic/configs/defconfig add
CONFIG_SBI_ECALL_TEE = y, In the >platform/generic/objects.mk add
CONFIG_TEE_LOAD_ADDR = 0x27c000000, CONFIG_TEE_LOAD_ADDR is the starting
address of the OP-TEE OS.

Hi Liushiwei,

Was there any formal specification or draft for this? Could you please point
me to the draft or specification?

Regards
Himanshu

-- 
opensbi mailing list
opensbi at lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi


