From: Inochi Amaoto <inochiama@outlook.com>
Date: Mon,  9 Oct 2023 08:23:10 +0800
Subject: [PATCH v2 1/4] lib: utils/timer: mtimer: add separate T-Head C9xx CLINT mtimer compatible
In-Reply-To: <IA1PR20MB4953B602556F31EC2EFDCAA4BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953B602556F31EC2EFDCAA4BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB4953CD4AE893CBB129A3F7AABBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>On 2023-10-08 7:16 AM, Inochi Amaoto wrote:
>>> T-HEAD allows soc vendor to map the mtimer and mswi of C9xx clint on
>>> different address, which may cause a misuse if use the same compatible
>>> string, add a new timer compatible string to avoid this.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> Link: https://lore.kernel.org/linux-riscv/6e48cbe5e60f9ada2fd1fe58e803e127f1a678e5.1696433229.git.unicorn_wang at outlook.com/
>>> ---
>>>  lib/utils/timer/fdt_timer_mtimer.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
>>> index 9eaa11d..0ac9aed 100644
>>> --- a/lib/utils/timer/fdt_timer_mtimer.c
>>> +++ b/lib/utils/timer/fdt_timer_mtimer.c
>>> @@ -146,6 +146,8 @@ static const struct fdt_match timer_mtimer_match[] = {
>>>  	{ .compatible = "riscv,clint0", .data = &sifive_clint_quirks },
>>>  	{ .compatible = "sifive,clint0", .data = &sifive_clint_quirks },
>>>  	{ .compatible = "thead,c900-clint", .data = &thead_clint_quirks },
>>> +	{ .compatible = "thead,c900-aclint-mtimer",
>>> +	  .data = &thead_clint_quirks },
>>
>>This is wrong. When using separate mtimer/mswi nodes, there is no MMIO offset.
>>So you need a new quirks structure for this compatible string.
>>
>>Regards,
>>Samuel
>>
>
>Ok, I will add a new one.
>

Fix this may need to change the kernel dt-binding and dt.
FYI, Chen Wang.

>>>  	{ .compatible = "riscv,aclint-mtimer" },
>>>  	{ },
>>>  };
>>
>>

