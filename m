From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Thu, 15 Feb 2024 14:44:15 +0000
Subject: [PATCH 4/4] lib: tests: Add sbi_console test
In-Reply-To: <20240212-cd9f3f355276b2f752006b77@orel>
References: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
 <20240208095050.398522-4-ivan.orlov0322@gmail.com>
 <20240212-cd9f3f355276b2f752006b77@orel>
Message-ID: <d75aad80-37c7-449e-a9cf-8320bd5c0ea7@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/12/24 18:24, Andrew Jones wrote:
> On Thu, Feb 08, 2024 at 09:50:50AM +0000, Ivan Orlov wrote:
>> Add the test suite covering some of the functions from
>> lib/sbi/sbi_console.c: putc, puts and printf. The test covers a variety
>> of format specifiers for printf and different strings and characters for
>> putc and puts.
>>
>> In order to do that, the test "mocks" the sbi_console_device structure
>> by setting the 'console_dev' variable to the virtual console.
>>
>> This patch depends on the previous patches from the series as it uses
>> SBIUnit macros, functions and definitions.
> 
> Again, this last sentence isn't necessary to write in a commit message.
> 
>>
>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
>> ---
>>   lib/sbi/sbi_console.c      |   4 ++
>>   lib/sbi/sbi_console_test.c | 104 +++++++++++++++++++++++++++++++++++++
>>   lib/sbi/sbi_unit.c         |   2 +
>>   3 files changed, 110 insertions(+)
>>   create mode 100644 lib/sbi/sbi_console_test.c
>>
>> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
>> index ab09a5c..d1229d0 100644
>> --- a/lib/sbi/sbi_console.c
>> +++ b/lib/sbi/sbi_console.c
>> @@ -488,3 +488,7 @@ int sbi_console_init(struct sbi_scratch *scratch)
>>   
>>   	return rc;
>>   }
>> +
>> +#ifdef CONFIG_SBIUNIT
>> +#include "sbi_console_test.c"
>> +#endif
>> diff --git a/lib/sbi/sbi_console_test.c b/lib/sbi/sbi_console_test.c
>> new file mode 100644
>> index 0000000..8c3b215
>> --- /dev/null
>> +++ b/lib/sbi/sbi_console_test.c
>> @@ -0,0 +1,104 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Author: Ivan Orlov <ivan.orlov0322@gmail.com>
>> + */
>> +#include <sbi/sbi_unit.h>
>> +#include <sbi/sbi_heap.h>
>> +
>> +/*
>> + * Console functions are wrapped in order to mock the console object and don't affect the actual
>> + * console output
>> + */
>> +#define CONSOLE_DO(action) ({		\
>> +	old_dev = console_dev;		\
>> +	console_dev = &new_dev;		\
>> +	action;				\
>> +	console_dev = old_dev;		\
>> +})
> 
> Why not use a local variable for old_dev and pass 'new_dev' in as an
> argument?
> 
>> +
>> +// We are using a GCC extension here, which allows us to return a value from a block
> 
> No need for this comment.
> 
>> +#define CONSOLE_DO_RET(action) ({	\
>> +	old_dev = console_dev;		\
>> +	console_dev = &new_dev;		\
>> +	u64 res = action;		\
> 
> Please use names like __res inside macros to avoid shadowing concerns.
> 
>> +	console_dev = old_dev;		\
>> +	res;				\
>> +})
> 
> We only need CONSOLE_DO_RET(). The caller can ignore the return value.
> And its name should include an TEST_ prefix, because this file is
> included by other files.
> 
>> +
>> +#define BUF_LEN 1024
> 
> TEST_CONSOLE_BUF_LEN
> 
>> +
>> +static const struct sbi_console_device *old_dev;
>> +
>> +static char buf[BUF_LEN];
>> +static u32 pos;
> 
> All the above need a test_console_ prefix
> 
>> +static void test_console_putc(char c)
>> +{
>> +	buf[pos] = c;
>> +	pos = (pos + 1) % BUF_LEN;
>> +}
>> +
>> +static void clear_buf(void)
>> +{
>> +	pos = 0;
>> +	sbi_memset(buf, 0, BUF_LEN);
> 
> I guess buf[0] = '\0' should be sufficient.
> 

Sorry for the late reply, I agree on all of the points you mentioned 
except this one. The 'puts' test stops me from clearing the buffer by 
setting the first char to zero:

```
PUTS_TEST(test, "Hello,", "Hello,\0OpenSBI!");
```

This test checks if 'puts' stops printing after facing \0. 'puts' won't 
print out the \0 to the buffer after printing "Hello,", so in case of 
the 'lazy' buffer clearing there might be other characters in buffer 
after 'Hello,'. In this case, the 'sbi_strcmp' won't stop comparing the 
strings causing the test to fail (despite the behavior is correct).

I reckon that clearing the buffer completely will help avoiding such 
tricky issues by making the experiment as pure as possible :)

Thank you!
-- 
Kind regards,
Ivan Orlov


