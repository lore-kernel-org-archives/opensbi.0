From: Sean Anderson <seanga2@gmail.com>
Date: Fri, 2 Oct 2020 11:34:49 -0400
Subject: [RFC PATCH v2] lib: Implement System Reset (SRST) SBI extension
In-Reply-To: <DM6PR04MB620124B1F88E246C47B1097E8D300@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20200926065321.807213-1-anup.patel@wdc.com>
 <22b6cc96-f84e-0054-ba87-6ce5044ac3c4@gmail.com>
 <DM6PR04MB620124B1F88E246C47B1097E8D300@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <5436fcff-9e0e-97fe-9dc6-5d344f8885c4@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/1/20 3:56 AM, Anup Patel wrote:
> 
> 
>> -----Original Message-----
>> From: Sean Anderson <seanga2@gmail.com>
>> Sent: 30 September 2020 17:07
>> To: Anup Patel <Anup.Patel@wdc.com>; Atish Patra
>> <Atish.Patra@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>
>> Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org
>> Subject: Re: [RFC PATCH v2] lib: Implement System Reset (SRST) SBI
>> extension
>>
>> On 9/26/20 2:53 AM, Anup Patel wrote:
>>> The SBI SRST extension specification is in draft state and available
>>> in srbt_v1 branch of: https://github.com/avpatel/riscv-sbi-doc.
>>>
>>> It allows to S-mode software to request system shutdown, cold reboot,
>>> and warm reboot.
>>>
>>> This patch provides implementation of SBI SRST extension.
>>>
>>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>>> ---
>>> Changes since v1:
>>>  - Updated patch as-per latest SBI SRST extension draft spec where
>>>    we have only one SBI call with "reset_type" parameter
>>> ---
>>>  include/sbi/sbi_ecall.h           |  1 +
>>>  include/sbi/sbi_ecall_interface.h |  8 ++++++
>>>  lib/sbi/objects.mk                |  1 +
>>>  lib/sbi/sbi_ecall.c               |  3 ++
>>>  lib/sbi/sbi_ecall_srst.c          | 48 +++++++++++++++++++++++++++++++
>>>  5 files changed, 61 insertions(+)
>>>  create mode 100644 lib/sbi/sbi_ecall_srst.c
>>>
>>> diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h index
>>> 3273ba6..1ef86e2 100644
>>> --- a/include/sbi/sbi_ecall.h
>>> +++ b/include/sbi/sbi_ecall.h
>>> @@ -37,6 +37,7 @@ extern struct sbi_ecall_extension ecall_rfence;
>>> extern struct sbi_ecall_extension ecall_ipi;  extern struct
>>> sbi_ecall_extension ecall_vendor;  extern struct sbi_ecall_extension
>>> ecall_hsm;
>>> +extern struct sbi_ecall_extension ecall_srst;
>>>
>>>  u16 sbi_ecall_version_major(void);
>>>
>>> diff --git a/include/sbi/sbi_ecall_interface.h
>>> b/include/sbi/sbi_ecall_interface.h
>>> index af30500..d9c2519 100644
>>> --- a/include/sbi/sbi_ecall_interface.h
>>> +++ b/include/sbi/sbi_ecall_interface.h
>>> @@ -27,6 +27,7 @@
>>>  #define SBI_EXT_IPI				0x735049
>>>  #define SBI_EXT_RFENCE				0x52464E43
>>>  #define SBI_EXT_HSM				0x48534D
>>> +#define SBI_EXT_SRST				0x53525354
>>>
>>>  /* SBI function IDs for BASE extension*/
>>>  #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
>>> @@ -62,6 +63,13 @@
>>>  #define SBI_HSM_HART_STATUS_START_PENDING	0x2
>>>  #define SBI_HSM_HART_STATUS_STOP_PENDING	0x3
>>>
>>> +/* SBI function IDs for SRST extension */
>>> +#define SBI_EXT_SRST_RESET			0x0
>>> +
>>> +#define SBI_SRST_RESET_TYPE_SHUTDOWN		0x0
>>> +#define SBI_SRST_RESET_TYPE_COLD_REBOOT	0x1
>>> +#define SBI_SRST_RESET_TYPE_WARM_REBOOT	0x2
>>> +
>>>  #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
>>>  #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
>>>  #define SBI_SPEC_VERSION_MINOR_MASK		0xffffff
>>> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk index
>>> fa808a0..6ec1154 100644
>>> --- a/lib/sbi/objects.mk
>>> +++ b/lib/sbi/objects.mk
>>> @@ -20,6 +20,7 @@ libsbi-objs-y += sbi_ecall_base.o  libsbi-objs-y +=
>>> sbi_ecall_hsm.o  libsbi-objs-y += sbi_ecall_legacy.o  libsbi-objs-y +=
>>> sbi_ecall_replace.o
>>> +libsbi-objs-y += sbi_ecall_srst.o
>>>  libsbi-objs-y += sbi_ecall_vendor.o
>>>  libsbi-objs-y += sbi_emulate_csr.o
>>>  libsbi-objs-y += sbi_fifo.o
>>> diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c index
>>> 64c9933..6d41cff 100644
>>> --- a/lib/sbi/sbi_ecall.c
>>> +++ b/lib/sbi/sbi_ecall.c
>>> @@ -167,6 +167,9 @@ int sbi_ecall_init(void)
>>>  	if (ret)
>>>  		return ret;
>>>  	ret = sbi_ecall_register_extension(&ecall_hsm);
>>> +	if (ret)
>>> +		return ret;
>>> +	ret = sbi_ecall_register_extension(&ecall_srst);
>>>  	if (ret)
>>>  		return ret;
>>>  	ret = sbi_ecall_register_extension(&ecall_legacy);
>>> diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c new
>>> file mode 100644 index 0000000..64c228f
>>> --- /dev/null
>>> +++ b/lib/sbi/sbi_ecall_srst.c
>>> @@ -0,0 +1,48 @@
>>> +/*
>>> + * SPDX-License-Identifier: BSD-2-Clause
>>> + *
>>> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>>> + *
>>> + * Authors:
>>> + *   Anup Patel <anup.patel@wdc.com>
>>> + */
>>> +
>>> +#include <sbi/sbi_ecall.h>
>>> +#include <sbi/sbi_ecall_interface.h>
>>> +#include <sbi/sbi_error.h>
>>> +#include <sbi/sbi_platform.h>
>>> +#include <sbi/sbi_system.h>
>>> +
>>> +static int sbi_ecall_srst_handler(unsigned long extid, unsigned long
>> funcid,
>>> +				  unsigned long *args, unsigned long
>> *out_val,
>>> +				  struct sbi_trap_info *out_trap) {
>>> +	int ret = 0;
>>> +
>>> +	if (funcid == SBI_EXT_SRST_RESET) {
>>> +		switch (args[0]) {
>>> +		case SBI_SRST_RESET_TYPE_SHUTDOWN:
>>> +
>> 	sbi_system_reset(SBI_PLATFORM_RESET_SHUTDOWN);
>>
>> Shouldn't we check a return value here? Some platforms may not support all
>> types of resets, and may want to return SBI_ENOTSUPP. For example, the
>> K210 only supports warm resets.
> 
> The sbi_system_reset() is implemented as noreturn function.
> 
> We have three cases here:
> 1. A platform has none of the SBI system reset types supported
> 2. A platform has few of the SBI system reset types supported
> 3. A platform has all SBI system reset types supported
> 
> For case#1, we will simply halt all HARTs in WFI.
> 
> For case#2, we will halt all HARTs in WFI when a
> particular SBI system reset type is not supported by platform.
> 
> Basically, current sbi_system_reset() implementation ensures that
> we never return for a valid reset_type irrespective whether underlying
> platform supports it or not.

I think that should be changed. There must be a way to discover which
reset types are supported by the platform. For example, say that I want
to reset the system, or shut it down only if there is no way to reset
it. With this API, I would have no way to do this. If I try a cold reset
and it is not available, the platform will "shut down" anyway, even if
there is a warm reset available.

--Sean

> The only case where SBI SRST RESET call fails is when provided
> reset_type is invalid.
> 
> Regards,
> Anup
> 
>>
>> --Sean
>>
>>> +			break;
>>> +		case SBI_SRST_RESET_TYPE_COLD_REBOOT:
>>> +			sbi_system_reset(SBI_PLATFORM_RESET_COLD);
>>> +			break;
>>> +		case SBI_SRST_RESET_TYPE_WARM_REBOOT:
>>> +			sbi_system_reset(SBI_PLATFORM_RESET_WARM);
>>> +			break;
>>> +		default:
>>> +			ret = SBI_EINVAL;
>>> +			break;
>>> +		};
>>> +	} else {
>>> +		ret = SBI_ENOTSUPP;
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +struct sbi_ecall_extension ecall_srst = {
>>> +	.extid_start = SBI_EXT_SRST,
>>> +	.extid_end = SBI_EXT_SRST,
>>> +	.handle = sbi_ecall_srst_handler,
>>> +};
>>>
> 


