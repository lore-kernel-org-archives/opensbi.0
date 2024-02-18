From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Sun, 18 Feb 2024 20:54:28 +0000
Subject: [PATCH v2 5/5] lib: tests: Add sbi_console test
In-Reply-To: <b55c0465e280bbd774f21ba3937ced5bb4c66cf7.camel@126.com>
References: <20240215161625.314131-1-ivan.orlov0322@gmail.com>
 <20240215161625.314131-6-ivan.orlov0322@gmail.com>
 <b55c0465e280bbd774f21ba3937ced5bb4c66cf7.camel@126.com>
Message-ID: <f89b60f4-5cfc-45cd-acba-944543632530@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/18/24 05:34, Xiang W wrote:
> ? 2024-02-15???? 16:16 +0000?Ivan Orlov???
>> Add the test suite covering some of the functions from
>> lib/sbi/sbi_console.c: putc, puts and printf. The test covers a variety
>> of format specifiers for printf and different strings and characters for
>> putc and puts.
>>
>> In order to do that, the test "mocks" the sbi_console_device structure
>> by setting the 'console_dev' variable to the virtual console.
>>
>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
>> ---
>> V1 -> V2:
>> - Rewrite using the carray functionality
>> - Replace CONSOLE_DO and CONSOLE_DO_RET macros with two inline
>> functions: one of them "mocks" the default console device, and
>> the second one restores the old console device.
>> - Fix codestyle issues (comments, etc.)
>> - Remove incorrect 'puts' test
>> - Use updated SBIUNIT_ASSERT_STREQ API
>>
>>  ?lib/sbi/objects.mk???????? |?? 1 +
>>  ?lib/sbi/sbi_console.c????? |?? 4 ++
>>  ?lib/sbi/sbi_console_test.c | 102 +++++++++++++++++++++++++++++++++++++
>>  ?3 files changed, 107 insertions(+)
>>  ?create mode 100644 lib/sbi/sbi_console_test.c
>>
>> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
>> index b4c273f..9d065fa 100644
>> --- a/lib/sbi/objects.mk
>> +++ b/lib/sbi/objects.mk
>> @@ -16,6 +16,7 @@ libsbi-objs-$(CONFIG_SBIUNIT) += sbi_unit_tests.o
>>   
>>  ?libsbi-objs-$(CONFIG_SBIUNIT) += sbi_bitmap_test.o
>>  ?carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += bitmap_test_suite
>> +carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += console_test_suite
>>   
>>  ?libsbi-objs-y += sbi_ecall.o
>>  ?libsbi-objs-y += sbi_ecall_exts.o
>> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
>> index ab09a5c..d1229d0 100644
>> --- a/lib/sbi/sbi_console.c
>> +++ b/lib/sbi/sbi_console.c
>> @@ -488,3 +488,7 @@ int sbi_console_init(struct sbi_scratch *scratch)
>>   
>>  ?	return rc;
>>  ?}
>> +
>> +#ifdef CONFIG_SBIUNIT
>> +#include "sbi_console_test.c"
>> +#endif
>> diff --git a/lib/sbi/sbi_console_test.c b/lib/sbi/sbi_console_test.c
>> new file mode 100644
>> index 0000000..f24b329
>> --- /dev/null
>> +++ b/lib/sbi/sbi_console_test.c
>> @@ -0,0 +1,102 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Author: Ivan Orlov <ivan.orlov0322@gmail.com>
>> + */
>> +#include <sbi/sbi_unit_test.h>
>> +#include <sbi/sbi_heap.h>
> 
> sbi_heap.h is not needed.
> 

Thanks, I'll fix it in V3.

-- 
Kind regards,
Ivan Orlov


