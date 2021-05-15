From: Daniel Schaefer <daniel@danielschaefer.me>
Date: Sun, 16 May 2021 02:13:10 +0800
Subject: [PATCH v1 1/1] lib: utils: Include sbi_strings.h directly
In-Reply-To: <CO6PR04MB7812D52B786C19DA454CFDBB8D509@CO6PR04MB7812.namprd04.prod.outlook.com>
References: <20210512111247.28416-1-git@danielschaefer.me>
 <CO6PR04MB7812D52B786C19DA454CFDBB8D509@CO6PR04MB7812.namprd04.prod.outlook.com>
Message-ID: <91cd29f0-2c15-6ac7-c699-88710314cf91@danielschaefer.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 5/14/21 7:34 PM, Anup Patel wrote:
> 
> 
>> -----Original Message-----
>> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Daniel
>> Schaefer
>> Sent: 12 May 2021 16:43
>> To: opensbi at lists.infradead.org
>> Cc: Abner Chang <abner.chang@hpe.com>; Anup Patel
>> <Anup.Patel@wdc.com>
>> Subject: [PATCH v1 1/1] lib: utils: Include sbi_strings.h directly
>>
>> From: Daniel Schaefer <daniel.schaefer@hpe.com>
>>
>> This file uses `sbi_strncpy`, `sbi_strncmp` and `sbi_memset`, which are
>> defined in `sbi_strings.h`.
>>
>> It should already be transitively included via `#include <sbi/sbi_scratch.h>`
>> but my toolchain doesn't do that for some reason.
>> Perhaps because the functions that refer to them are `static`?
> 
> Can you try renaming __STRING_H__ to __SBI_STRING_H__ in sbi_string.h ?

That doesn't help, unfortunately.

> 
> Regards,
> Anup
> 
>>
>> Anyways, it would be good to directly reference the header here.
>>
>> Cc: Abner Chang <abner.chang@hpe.com>
>> Cc: Anup Patel <anup.patel@wdc.com>
>> Signed-off-by: Daniel Schaefer <git@danielschaefer.me>
>> ---
>>  lib/utils/fdt/fdt_domain.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c index
>> 95c195d65238..b2b5f6196a1a 100644
>> --- a/lib/utils/fdt/fdt_domain.c
>> +++ b/lib/utils/fdt/fdt_domain.c
>> @@ -13,6 +13,7 @@
>>  #include <sbi/sbi_error.h>
>>  #include <sbi/sbi_hartmask.h>
>>  #include <sbi/sbi_scratch.h>
>> +#include <sbi/sbi_string.h>
>>  #include <sbi_utils/fdt/fdt_domain.h>
>>  #include <sbi_utils/fdt/fdt_helper.h>
>>
>> --
>> 2.30.1
>>
>>
>> --
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi

