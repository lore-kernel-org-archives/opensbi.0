From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 12 Feb 2024 19:24:16 +0100
Subject: [PATCH 4/4] lib: tests: Add sbi_console test
In-Reply-To: <20240208095050.398522-4-ivan.orlov0322@gmail.com>
References: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
 <20240208095050.398522-4-ivan.orlov0322@gmail.com>
Message-ID: <20240212-cd9f3f355276b2f752006b77@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 08, 2024 at 09:50:50AM +0000, Ivan Orlov wrote:
> Add the test suite covering some of the functions from
> lib/sbi/sbi_console.c: putc, puts and printf. The test covers a variety
> of format specifiers for printf and different strings and characters for
> putc and puts.
> 
> In order to do that, the test "mocks" the sbi_console_device structure
> by setting the 'console_dev' variable to the virtual console.
> 
> This patch depends on the previous patches from the series as it uses
> SBIUnit macros, functions and definitions.

Again, this last sentence isn't necessary to write in a commit message.

> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  lib/sbi/sbi_console.c      |   4 ++
>  lib/sbi/sbi_console_test.c | 104 +++++++++++++++++++++++++++++++++++++
>  lib/sbi/sbi_unit.c         |   2 +
>  3 files changed, 110 insertions(+)
>  create mode 100644 lib/sbi/sbi_console_test.c
> 
> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> index ab09a5c..d1229d0 100644
> --- a/lib/sbi/sbi_console.c
> +++ b/lib/sbi/sbi_console.c
> @@ -488,3 +488,7 @@ int sbi_console_init(struct sbi_scratch *scratch)
>  
>  	return rc;
>  }
> +
> +#ifdef CONFIG_SBIUNIT
> +#include "sbi_console_test.c"
> +#endif
> diff --git a/lib/sbi/sbi_console_test.c b/lib/sbi/sbi_console_test.c
> new file mode 100644
> index 0000000..8c3b215
> --- /dev/null
> +++ b/lib/sbi/sbi_console_test.c
> @@ -0,0 +1,104 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Author: Ivan Orlov <ivan.orlov0322@gmail.com>
> + */
> +#include <sbi/sbi_unit.h>
> +#include <sbi/sbi_heap.h>
> +
> +/*
> + * Console functions are wrapped in order to mock the console object and don't affect the actual
> + * console output
> + */
> +#define CONSOLE_DO(action) ({		\
> +	old_dev = console_dev;		\
> +	console_dev = &new_dev;		\
> +	action;				\
> +	console_dev = old_dev;		\
> +})

Why not use a local variable for old_dev and pass 'new_dev' in as an
argument?

> +
> +// We are using a GCC extension here, which allows us to return a value from a block

No need for this comment.

> +#define CONSOLE_DO_RET(action) ({	\
> +	old_dev = console_dev;		\
> +	console_dev = &new_dev;		\
> +	u64 res = action;		\

Please use names like __res inside macros to avoid shadowing concerns.

> +	console_dev = old_dev;		\
> +	res;				\
> +})

We only need CONSOLE_DO_RET(). The caller can ignore the return value.
And its name should include an TEST_ prefix, because this file is
included by other files.

> +
> +#define BUF_LEN 1024

TEST_CONSOLE_BUF_LEN

> +
> +static const struct sbi_console_device *old_dev;
> +
> +static char buf[BUF_LEN];
> +static u32 pos;

All the above need a test_console_ prefix

> +static void test_console_putc(char c)
> +{
> +	buf[pos] = c;
> +	pos = (pos + 1) % BUF_LEN;
> +}
> +
> +static void clear_buf(void)
> +{
> +	pos = 0;
> +	sbi_memset(buf, 0, BUF_LEN);

I guess buf[0] = '\0' should be sufficient.

> +}
> +
> +// Mocking the console

/**/ comment style

> +static const struct sbi_console_device new_dev = {
> +	.name = "Test console device",
> +	.console_putc = test_console_putc,
> +};
> +
> +static void putc_test(struct sbiunit_test_case *test)
> +{
> +	clear_buf();
> +
> +	CONSOLE_DO(sbi_putc('a'));

I think I would replace the CONSOLE_DO macro with a _begin() / _end()
pair.

 test_console_begin();
 sbi_putc('a');
 test_console_end();

> +	SBIUNIT_ASSERT_EQ(test, buf[0], 'a');
> +}
> +
> +#define PUTS_TEST(test, expected, param) do {				\

param is the string, so it should be named 's' or 'str' or similar.

> +	clear_buf();							\
> +	CONSOLE_DO(sbi_puts(param));					\
> +	SBIUNIT_ASSERT_STREQ(test, buf, expected);			\
> +} while (0)
> +
> +static void puts_test(struct sbiunit_test_case *test)
> +{
> +	PUTS_TEST(test, "Hello, OpenSBI!", "Hello, OpenSBI!");
> +	PUTS_TEST(test, "Hello,\r\nOpenSBI!", "Hello,\nOpenSBI!");
> +	PUTS_TEST(test, "Hello,", "Hello,\0OpenSBI!");
> +}
> +
> +#define PRINTF_TEST(test, expected, format, ...) do {					\
> +	clear_buf();									\
> +	SBIUNIT_ASSERT_EQ(test, CONSOLE_DO_RET(sbi_printf(format, ##__VA_ARGS__)),	\
> +			  sbi_strlen(expected));					\
> +	SBIUNIT_ASSERT_STREQ(test, buf, expected);					\
> +} while (0)
> +
> +static void printf_test(struct sbiunit_test_case *test)
> +{
> +	PRINTF_TEST(test, "Hello", "Hello");
> +	PRINTF_TEST(test, "3 5 7", "%d %d %d", 3, 5, 7);
> +	PRINTF_TEST(test, "Hello", "%s", "Hello");
> +	PRINTF_TEST(test, "-1", "%d", -1);
> +	PRINTF_TEST(test, "FF", "%X", 255);
> +	PRINTF_TEST(test, "ff", "%x", 255);
> +	PRINTF_TEST(test, "A", "%c", 'A');
> +	PRINTF_TEST(test, "1fe", "%p", (void *)0x1fe);
> +	PRINTF_TEST(test, "4294967295", "%u", 4294967295U);
> +	PRINTF_TEST(test, "-2147483647", "%ld", -2147483647l);
> +	PRINTF_TEST(test, "-9223372036854775807", "%lld", -9223372036854775807LL);
> +	PRINTF_TEST(test, "18446744073709551615", "%llu", 18446744073709551615ULL);
> +}
> +
> +static struct sbiunit_test_case console_test_cases[] = {
> +	SBIUNIT_TEST_CASE(putc_test),
> +	SBIUNIT_TEST_CASE(puts_test),
> +	SBIUNIT_TEST_CASE(printf_test),
> +	{},
> +};
> +
> +SBIUNIT_TEST_SUITE(console_test_suite, console_test_cases);
> diff --git a/lib/sbi/sbi_unit.c b/lib/sbi/sbi_unit.c
> index 2d3da7f..b2f2063 100644
> --- a/lib/sbi/sbi_unit.c
> +++ b/lib/sbi/sbi_unit.c
> @@ -7,8 +7,10 @@
>  #include <sbi/sbi_console.h>
>  
>  extern struct sbiunit_test_suite bitmap_test_suite;
> +extern struct sbiunit_test_suite console_test_suite;
>  static struct sbiunit_test_suite *test_suites[] = {
>  	&bitmap_test_suite,
> +	&console_test_suite,
>  };
>  
>  static void run_test_suite(struct sbiunit_test_suite *suite)
> -- 
> 2.34.1
> 
>

Thanks,
drew

