From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 27 Sep 2023 17:38:25 +0200
Subject: [PATCH 1/1] lib: utils: Simplify SET_ISA_EXT_MAP()
In-Reply-To: <ea8d5b17416fc2e593c5b64c0bc6f893eaf050d3.camel@126.com>
References: <20230927142103.52016-1-heinrich.schuchardt@canonical.com>
 <ea8d5b17416fc2e593c5b64c0bc6f893eaf050d3.camel@126.com>
Message-ID: <bdae373d-843d-4f5b-b7a8-24724f6eef2c@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/27/23 17:23, Xiang W wrote:
> ? 2023-09-27???? 16:21 +0200?Heinrich Schuchardt???
>> The define is hard to read.
>>
>> Addresses-Coverity-ID: 1568359 Unexpected control flow
>> Fixes: d72f5f17478d ("lib: utils: Add detection of Smepmp from ISA string in FDT")
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>  ?lib/utils/fdt/fdt_helper.c | 8 +++-----
>>  ?1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
>> index c97f09d..6f23f6f 100644
>> --- a/lib/utils/fdt/fdt_helper.c
>> +++ b/lib/utils/fdt/fdt_helper.c
>> @@ -370,12 +370,10 @@ static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
>>  ?			continue;
>>   
>>  ?#define SET_ISA_EXT_MAP(name, bit)				\
>> -		do {						\
>> -			if (!strcmp(mstr, name)) {		\
>> +		{						\
>> +			if (!strcmp(mstr, name))		\
>>  ?				__set_bit(bit, extensions);	\
>> -				continue;			\
> Only remove 'do ... while' and 'continue' can be keep . In this way, after finding
> the extension, the subsequent judgment can be skip.

I understand why you want to have a continue here. Makes sense to me 
once you add more invocations of the macro.

Just to be clear this is not what the incoming code did.

With your suggestion we should rename the macro to something like 
SET_ISA_EXT_AND_CONTINUE() to make the behavior obvious.

Best regards

Heinrich

> 
> Regards,
> Xiang W
>> -			}					\
>> -		} while (false)					\
>> +		}						\
>>   
>>  ?		SET_ISA_EXT_MAP("smepmp", SBI_HART_EXT_SMEPMP);
>>  ?#undef SET_ISA_EXT_MAP
>> -- 
>> 2.40.1
>>
>>
> 


