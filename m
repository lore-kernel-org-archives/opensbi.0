From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 12 Oct 2023 16:23:48 +0800
Subject: [PATCH] lib: utils/fdt: Allow zero length mtime when parsing ACLINT
In-Reply-To: <77f4664efaa5f974e70f2b7f5be46eb37aad2750.camel@126.com>
References: <77f4664efaa5f974e70f2b7f5be46eb37aad2750.camel@126.com>
Message-ID: <IA1PR20MB49539F83A28A3651F47CCCBDBBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>? 2023-10-12???? 07:25 +0800?Inochi Amaoto???
>> Currently, the fdt_parse_aclint_node() does not allow the first reg to
>> be zero length. This may cause the parser to fail when the ACLINT does
>> not support mtime.
>>
>> To be robust, delay the check of first reg in fdt_parse_aclint_node()
>> so the parser can handle ACLINT without mtime support.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>  lib/utils/fdt/fdt_helper.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
>> index c97f09d..6b4ef38 100644
>> --- a/lib/utils/fdt/fdt_helper.c
>> +++ b/lib/utils/fdt/fdt_helper.c
>> @@ -897,8 +897,10 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
>>
>>  	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
>>  				    &reg_addr, &reg_size);
>> -	if (rc < 0 || !reg_size)
>> +	if (rc < 0)
>>  		return SBI_ENODEV;
>> +	if (!reg_size)
>> +		reg_addr = reg_size = 0;
>If abandon checking reg_size here, should add a check where this function
>is called. Because reg_size=0 is only legal under without_mtime.
>

This check is not abandoned, but delayed.

>Regards,
>Xiang W
>>  	*out_addr1 = reg_addr;
>>  	*out_size1 = reg_size;
>>
>> @@ -906,6 +908,8 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
>>  				    &reg_addr, &reg_size);
>>  	if (rc < 0 || !reg_size)
>>  		reg_addr = reg_size = 0;
>> +	if (!reg_addr && *out_size1 == 0)
>> +		return SBI_ENODEV;
>

The reg_size of the first pair is checked here.
It seems I should check reg_size here, will fix.

>>  	if (out_addr2)
>>  		*out_addr2 = reg_addr;
>>  	if (out_size2)
>> --
>> 2.42.0
>>
>>
>
>

