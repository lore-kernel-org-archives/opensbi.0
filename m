From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Wed, 28 Feb 2024 16:01:41 +0000
Subject: [PATCH v2 1/5] docs: Add documentation about tests and SBIUnit
In-Reply-To: <20240228-82fb0c4b75bdfb2507c80100@orel>
References: <20240215161625.314131-1-ivan.orlov0322@gmail.com>
 <20240215161625.314131-2-ivan.orlov0322@gmail.com>
 <20240228-82fb0c4b75bdfb2507c80100@orel>
Message-ID: <89312def-69e0-4b9a-9969-19cd9971930f@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/28/24 13:47, Andrew Jones wrote:
> On Thu, Feb 15, 2024 at 04:16:21PM +0000, Ivan Orlov wrote:
>> This patch contains the documentation for SBIUnit. It describes:
>>
>> - What is SBIUnit
>> - Simple test writing scenario
>> - How we can cover static functions
>> - How we can "mock" structures in order to test the functions which
>> operate on them
>> - SBIUnit API Reference
>>
>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
>> ---
>> V1 -> V2:
>> - Use more appropriate language
>> - Update the documentation in accordance with SBIUnit API and
>> structure changes
>> - Remove the redundant documentation for every SBIUNIT_* macro.
>> - Make the documentation follow the 80-characters rule.
>>
>>   docs/writing_tests.md | 131 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 131 insertions(+)
>>   create mode 100644 docs/writing_tests.md
>>
>> diff --git a/docs/writing_tests.md b/docs/writing_tests.md
>> new file mode 100644
>> index 0000000..279d35b
>> --- /dev/null
>> +++ b/docs/writing_tests.md
>> @@ -0,0 +1,131 @@
>> +Writing tests for OpenSBI
>> +=========================
>> +
>> +SBIUnit
>> +-------
>> +SBIUnit is a set of macros and functions which simplify the test development and
>> +automate the test execution and evaluation. All of the SBIUnit definitions are
>> +in the `include/sbi/sbi_unit_test.h` header file, and implementations are
>> +available in `lib/sbi/sbi_unit_test.c`.
>> +
>> +Simple SBIUnit test
>> +-------------------
>> +
>> +For instance, we would like to test the following function from
>> +`lib/sbi/sbi_string.c`:
>> +
>> +```c
>> +size_t sbi_strlen(const char *str)
>> +{
>> +	unsigned long ret = 0;
>> +
>> +	while (*str != '\0') {
>> +		ret++;
>> +		str++;
>> +	}
>> +
>> +	return ret;
>> +}
>> +```
>> +
>> +Which calculates the string length.
> 
> Lowercase 'w' in which, since this line is a continuation of the sentence
> started above.
> 
>> +
>> +Create the file `lib/sbi/sbi_string_test.c` with the following content:
>> +
>> +```c
>> +#include <sbi/sbi_unit_test.h>
>> +#include <sbi/sbi_string.h>
>> +
>> +static void strlen_test(struct sbiunit_test_case *test)
>> +{
>> +	SBIUNIT_EXPECT_EQ(test, sbi_strlen("Hello"), 5);
>> +	SBIUNIT_EXPECT_EQ(test, sbi_strlen("Hell\0o"), 4);
>> +}
>> +
>> +static struct sbiunit_test_case string_test_cases[] = {
>> +	SBIUNIT_TEST_CASE(strlen_test),
>> +	{},
>> +};
>> +
>> +SBIUNIT_TEST_SUITE(string_test_suite, string_test_cases);
>> +```
>> +
>> +Then, add the corresponding Makefile entries to `lib/sbi/objects.mk`:
>> +```lang-makefile
>> +...
>> +libsbi-objs-$(CONFIG_SBIUNIT) += sbi_string_test.o
>> +carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += string_test_suite
>> +```
>> +
>> +Run `make clean` in order to regenerate the carray-related files, recompile
>> +OpenSBI with CONFIG_SBIUNIT option enabled and run it in the QEMU.
>> +You will see something like this:
>> +```
>> +# make PLATFORM=generic run
>> +...
>> +# Running SBIUNIT tests #
>> +...
>> +## Running test suite: string_test_suite
>> +[PASSED] strlen_test
>> +1 PASSED / 0 FAILED / 1 TOTAL
>> +```
>> +
>> +Now let's try to change this test in the way that it will fail:
>> +
>> +```c
>> +- SBIUNIT_EXPECT_EQ(test, sbi_strlen("Hello"), 5);
>> ++ SBIUNIT_EXPECT_EQ(test, sbi_strlen("Hello"), 100);
>> +```
>> +
>> +`make all` and `make run` it again:
>> +```
>> +...
>> +# Running SBIUNIT tests #
>> +...
>> +## Running test suite: string_test_suite
>> +[SBIUnit] [.../opensbi/lib/sbi/sbi_string_test.c:6]: strlen_test: Condition
>> +"(sbi_strlen("Hello")) == (100)" expected to be true!
> 
> If the test will output the above all on one line, then the document
> should also use a single line even though it will exceed 80 chars.
> 
>> +[FAILED] strlen_test
>> +0 PASSED / 1 FAILED / 1 TOTAL
>> +```
>> +Covering the static functions / using the static definitions
>> +------------------------------------------------------------
>> +
>> +SBIUnit also allows you to test static functions. In order to do so, simply
>> +include your test source in the file you would like to test. Complementing the
>> +example above, just add this to the
>> +`lib/sbi/sbi_string.c` file:
>> +
>> +```c
>> +#ifdef CONFIG_SBIUNIT
>> +#include "sbi_string_test.c"
>> +#endif
>> +```
>> +
>> +In this case you should only add a new carray entry pointing to the test suite
>> +to `lib/sbi/objects.mk`:
>> +```lang-makefile
>> +...
>> +carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += string_test_suite
>> +```
>> +
>> +You don't have to compile the `sbi_string_test.o` separately, because the
>> +test code will be included into the `sbi_string` object file.
>> +
>> +See example in `lib/sbi/sbi_console_test.c`, where statically declared
>> +`console_dev` variable is used to mock the `sbi_console_device` structure.
>> +
>> +"Mocking" the structures
>> +------------------------
>> +See the example of structure "mocking" in the `lib/sbi/sbi_console_test.c`,
>> +where the sbi_console_device structure was mocked to be used in various
>> +console-related functions in order to test them.
>> +
>> +API Reference
>> +-------------
>> +All of the `SBIUNIT_EXPECT_*` macros will cause a test case to fail if the
>> +corresponding conditions are not met, however, the execution of a particular
>> +test case will not be stopped.
>> +
>> +All of the `SBIUNIT_ASSERT_*` macros will cause a test case to fail and stop
>> +immediately, triggering the panic.
> 
> s/the panic/a panic/
> 
>> -- 
>> 2.34.1
>>
> 
> Other than the nits,
> 

Hi Andrew,

Thank you so much for the review. I'll make the suggested changes and 
send the V3.

-- 
Kind regards,
Ivan Orlov


