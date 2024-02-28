From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Wed, 28 Feb 2024 16:12:13 +0000
Subject: [PATCH v2 2/5] lib: Add SBIUnit testing macros and functions
In-Reply-To: <20240228-3b952164f9b56135e30a6282@orel>
References: <20240215161625.314131-1-ivan.orlov0322@gmail.com>
 <20240215161625.314131-3-ivan.orlov0322@gmail.com>
 <20240228-3b952164f9b56135e30a6282@orel>
Message-ID: <2e16bf64-ea2b-4063-91f1-fc08b827559b@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/28/24 14:19, Andrew Jones wrote:

>> + * Author: Ivan Orlov <ivan.orlov0322@gmail.com>
>> + */
>> +#ifdef CONFIG_SBIUNIT
>> +#ifndef __SBI_UNIT_H__
>> +#define __SBI_UNIT_H__
>> +
>> +#include <sbi/sbi_types.h>
>> +#include <sbi/sbi_console.h>
>> +#include <sbi/sbi_string.h>
>> +
>> +struct sbiunit_test_case {
>> +	const char *name;
>> +	bool enabled;
>> +	bool failed;
>> +	void (*test_func)(struct sbiunit_test_case *test);
>> +	void (*onerr)(struct sbiunit_test_case *test);
> 
> Please rename to on_error()
> 

Hmm, it looks like this 'onerr' is not used anywhere, so I'll just get 
rid of it in the V3.

>> +};
>> +
>> +struct sbiunit_test_suite {
>> +	const char *name;
>> +	struct sbiunit_test_case *cases;
>> +};
>> +
>> +#define SBIUNIT_TEST_CASE(func)		\
>> +	{				\
>> +		.name = #func,		\
>> +		.enabled = true,	\
>> +		.failed = false,	\
>> +		.test_func = (func)	\
>> +	}
>> +
>> +#define SBIUNIT_TEST_SUITE(suite_name, cases_arr)		\
>> +	struct sbiunit_test_suite suite_name = {		\
>> +		.name = #suite_name,				\
>> +		.cases = cases_arr				\
>> +	}
>> +
>> +#define _sbiunit_msg(test, msg) "[SBIUnit] [%s:%d]: %s: %s", __FILE__,	\
>> +				__LINE__, test->name, msg
>> +
>> +#define SBIUNIT_INFO(test, msg) sbi_printf(_sbiunit_msg(test, msg))
>> +#define SBIUNIT_PANIC(test, msg) sbi_panic(_sbiunit_msg(test, msg))
>> +
>> +#define SBIUNIT_EXPECT(test, cond) do {							\
>> +	if (!(cond)) {									\
>> +		test->failed = true;							\
>> +		SBIUNIT_INFO(test, "Condition \"" #cond "\" expected to be true!\n");	\
>> +	}										\
>> +} while (0)
>> +
>> +#define SBIUNIT_ASSERT(test, cond) do {						\
>> +	if (!(cond)) {								\
>> +		test->failed = true;						\
> 
> No need to set failed since the next line calls panic.
> 

Yeah, I agree.

>> +		SBIUNIT_PANIC(test, "Condition \"" #cond "\" must be true!\n");	\
>> +	}									\
>> +} while (0)
>> +
>> +#define SBIUNIT_EXPECT_EQ(test, a, b) SBIUNIT_EXPECT(test, (a) == (b))
>> +#define SBIUNIT_ASSERT_EQ(test, a, b) SBIUNIT_ASSERT(test, (a) == (b))
>> +#define SBIUNIT_EXPECT_NE(test, a, b) SBIUNIT_EXPECT(test, (a) != (b))
>> +#define SBIUNIT_ASSERT_NE(test, a, b) SBIUNIT_ASSERT(test, (a) != (b))
>> +#define SBIUNIT_EXPECT_MEMEQ(test, a, b, len) SBIUNIT_EXPECT(test, !sbi_memcmp(a, b, len))
>> +#define SBIUNIT_ASSERT_MEMEQ(test, a, b, len) SBIUNIT_ASSERT(test, !sbi_memcmp(a, b, len))
>> +#define SBIUNIT_EXPECT_STREQ(test, a, b, len) SBIUNIT_EXPECT(test, !sbi_strncmp(a, b, len))
>> +#define SBIUNIT_ASSERT_STREQ(test, a, b, len) SBIUNIT_ASSERT(test, !sbi_strncmp(a, b, len))
>> +
>> +void run_all_tests(void);
>> +#endif
>> +#else
>> +#define run_all_tests()
>> +#endif
>> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
>> index 81dd2db..e3038ee 100644
>> --- a/lib/sbi/Kconfig
>> +++ b/lib/sbi/Kconfig
>> @@ -50,4 +50,8 @@ config SBI_ECALL_DBTR
>>   	bool "Debug Trigger Extension"
>>   	default y
>>   
>> +config SBIUNIT
>> +	bool "Enable SBIUNIT tests"
>> +	default n
>> +
>>   endmenu
>> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
>> index 0a50e95..08959f1 100644
>> --- a/lib/sbi/objects.mk
>> +++ b/lib/sbi/objects.mk
>> @@ -11,6 +11,8 @@ libsbi-objs-y += riscv_asm.o
>>   libsbi-objs-y += riscv_atomic.o
>>   libsbi-objs-y += riscv_hardfp.o
>>   libsbi-objs-y += riscv_locks.o
>> +libsbi-objs-$(CONFIG_SBIUNIT) += sbi_unit_test.o
>> +libsbi-objs-$(CONFIG_SBIUNIT) += sbi_unit_tests.o
>>   
>>   libsbi-objs-y += sbi_ecall.o
>>   libsbi-objs-y += sbi_ecall_exts.o
>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>> index 804b01c..796cccc 100644
>> --- a/lib/sbi/sbi_init.c
>> +++ b/lib/sbi/sbi_init.c
>> @@ -29,6 +29,7 @@
>>   #include <sbi/sbi_timer.h>
>>   #include <sbi/sbi_tlb.h>
>>   #include <sbi/sbi_version.h>
>> +#include <sbi/sbi_unit_test.h>
>>   
>>   #define BANNER                                              \
>>   	"   ____                    _____ ____ _____\n"     \
>> @@ -398,6 +399,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>   
>>   	sbi_boot_print_hart(scratch, hartid);
>>   
>> +	run_all_tests();
>> +
>>   	/*
>>   	 * Configure PMP at last because if SMEPMP is detected,
>>   	 * M-mode access to the S/U space will be rescinded.
>> diff --git a/lib/sbi/sbi_unit_test.c b/lib/sbi/sbi_unit_test.c
>> new file mode 100644
>> index 0000000..f4988d8
>> --- /dev/null
>> +++ b/lib/sbi/sbi_unit_test.c
>> @@ -0,0 +1,43 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Author: Ivan Orlov <ivan.orlov0322@gmail.com>
>> + */
>> +#include <sbi/sbi_unit_test.h>
>> +#include <sbi/sbi_types.h>
>> +#include <sbi/sbi_console.h>
>> +
>> +extern struct sbiunit_test_suite *sbi_unit_tests[];
>> +extern unsigned long sbi_unit_tests_size;
>> +
>> +static void run_test_suite(struct sbiunit_test_suite *suite)
>> +{
>> +	struct sbiunit_test_case *s_case;
>> +	u32 count_pass = 0, count_fail = 0;
>> +
>> +	sbi_printf("## Running test suite: %s\n", suite->name);
>> +
>> +	s_case = suite->cases;
>> +	while (s_case->enabled) {
> 
> Can't test cases be enabled/disabled sparsely? Shouldn't we instead
> loop while s_case->name is not NULL? And we need to ensure the cases
> array always has an empty case at the end.
> 

They can't be enabled/disabled separately at the moment, but I believe 
it would be good to have such a functionality in the future, when we 
have more tests. Also, I reckon we should be able to iterate and execute 
the test even if it has no name: technically it doesn't mean that the 
test is invalid, and breaking the tests execution completely in this 
case would be pretty implicit and non-obvious for the test developer...

Thank you for the review!

-- 
Kind regards,
Ivan Orlov


