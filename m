From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 12 Feb 2024 19:11:11 +0100
Subject: [PATCH 3/4] lib: tests: Add a test for sbi_bitmap
In-Reply-To: <20240208095050.398522-3-ivan.orlov0322@gmail.com>
References: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
 <20240208095050.398522-3-ivan.orlov0322@gmail.com>
Message-ID: <20240212-3dd07643bfb15ca9d41694ee@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 08, 2024 at 09:50:49AM +0000, Ivan Orlov wrote:
> Add test suite covering all of the functions from lib/sbi/sbi_bitmap.c:
> __bitmap_and, __bitmap_or and __bitmap_xor.
> 
> This patch depends on the previous patches in this series as it uses
> SBIUnit macros, functions and definitions

No need to state that a patch depends on a previous patch, as that's
generally the case.

> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  lib/sbi/objects.mk        |   2 +
>  lib/sbi/sbi_bitmap_test.c | 104 ++++++++++++++++++++++++++++++++++++++
>  lib/sbi/sbi_unit.c        |   2 +
>  3 files changed, 108 insertions(+)
>  create mode 100644 lib/sbi/sbi_bitmap_test.c
> 
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 0a2318b..b29e63f 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -56,6 +56,8 @@ libsbi-objs-$(CONFIG_SBI_ECALL_VENDOR) += sbi_ecall_vendor.o
>  carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_DBTR) += ecall_dbtr
>  libsbi-objs-$(CONFIG_SBI_ECALL_DBTR) += sbi_ecall_dbtr.o
>  
> +libsbi-objs-$(CONFIG_SBIUNIT) += sbi_bitmap_test.o
> +
>  libsbi-objs-y += sbi_bitmap.o
>  libsbi-objs-y += sbi_bitops.o
>  libsbi-objs-y += sbi_console.o
> diff --git a/lib/sbi/sbi_bitmap_test.c b/lib/sbi/sbi_bitmap_test.c
> new file mode 100644
> index 0000000..0fd0091
> --- /dev/null
> +++ b/lib/sbi/sbi_bitmap_test.c
> @@ -0,0 +1,104 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Author: Ivan Orlov <ivan.orlov0322@gmail.com>
> + */
> +#include <sbi/sbi_bitmap.h>
> +#include <sbi/sbi_unit.h>
> +#include <sbi/sbi_console.h>
> +
> +static u64 data_a[] = { 0xDEADBEEF, 0x00BAB10C, 0x1BADB002, 0xABADBABE };
> +static u64 data_b[] = { 0xC00010FF, 0x00BAB10C, 0xBAAAAAAD, 0xBADDCAFE };
> +static u64 data_zero[] = { 0, 0, 0, 0 };
> +

nit: Remove one blank line and the below defines up above the globals.

> +
> +#define DATA_SIZE sizeof(data_zero)
> +#define DATA_BIT_SIZE (DATA_SIZE * 8)
> +
> +static void bitmap_and_test(struct sbiunit_test_case *test)
> +{
> +	u64 res[DATA_SIZE];
> +	u64 a_and_b[] = { 0xDEADBEEF & 0xC00010FF, 0x00BAB10C & 0x00BAB10C,
> +			  0x1BADB002 & 0xBAAAAAAD, 0xABADBABE & 0xBADDCAFE };

Should refer to the test data by name, e.g. data_a[0] or with a define,
'#define DATA_A0 0xDEADBEEFULL'

> +
> +	__bitmap_and(res, data_a, data_b, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, a_and_b, DATA_SIZE);
> +
> +	// a & a = a

Should use /**/ comment format.

> +	__bitmap_and(res, data_a, data_a, DATA_BIT_SIZE);
> +	SBIUNIT_ASSERT_MEMEQ(test, res, data_a, DATA_SIZE);
> +
> +	// a & 0 = 0
> +	__bitmap_and(res, data_a, data_zero, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
> +
> +	// 0 & 0 = 0
> +	__bitmap_and(res, data_zero, data_zero, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
> +
> +	sbi_memcpy(res, data_zero, DATA_SIZE);
> +	// Cover zero 'bits' argument
> +	__bitmap_and(res, data_a, data_b, 0);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
> +}
> +
> +static void bitmap_or_test(struct sbiunit_test_case *test)
> +{
> +	u64 res[DATA_SIZE];
> +	u64 a_or_b[] = { 0xDEADBEEF | 0xC00010FF, 0x00BAB10C | 0x00BAB10C,
> +		       0x1BADB002 | 0xBAAAAAAD, 0xABADBABE | 0xBADDCAFE };
> +
> +	__bitmap_or(res, data_a, data_b, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, a_or_b, DATA_SIZE);
> +
> +	// a | a = a
> +	__bitmap_or(res, data_a, data_a, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_a, DATA_SIZE);
> +
> +	// a | 0 = a
> +	__bitmap_or(res, data_a, data_zero, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_a, DATA_SIZE);
> +
> +	// 0 | 0 = 0
> +	__bitmap_or(res, data_zero, data_zero, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
> +
> +	sbi_memcpy(res, data_zero, DATA_SIZE);
> +	__bitmap_or(res, data_a, data_b, 0);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
> +}
> +
> +static void bitmap_xor_test(struct sbiunit_test_case *test)
> +{
> +	u64 res[DATA_SIZE];
> +	u64 a_xor_b[] = { 0xDEADBEEF ^ 0xC00010FF, 0x00BAB10C ^ 0x00BAB10C,
> +			  0x1BADB002 ^ 0xBAAAAAAD, 0xABADBABE ^ 0xBADDCAFE };
> +
> +	__bitmap_xor(res, data_a, data_b, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, a_xor_b, DATA_SIZE);
> +
> +	// a ^ 0 = a
> +	__bitmap_xor(res, data_a, data_zero, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_a, DATA_SIZE);
> +
> +	// a ^ a = 0
> +	__bitmap_xor(res, data_a, data_a, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
> +
> +	// 0 ^ 0 = 0
> +	__bitmap_xor(res, data_zero, data_zero, DATA_BIT_SIZE);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
> +
> +	sbi_memcpy(res, data_zero, DATA_SIZE);
> +	__bitmap_xor(res, data_a, data_b, 0);
> +	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
> +}
> +
> +static struct sbiunit_test_case bitmap_test_cases[] = {
> +	SBIUNIT_TEST_CASE(bitmap_and_test),
> +	SBIUNIT_TEST_CASE(bitmap_or_test),
> +	SBIUNIT_TEST_CASE(bitmap_xor_test),
> +	{},
> +};
> +
> +SBIUNIT_TEST_SUITE(bitmap_test_suite, bitmap_test_cases);
> diff --git a/lib/sbi/sbi_unit.c b/lib/sbi/sbi_unit.c
> index 9c7efec..2d3da7f 100644
> --- a/lib/sbi/sbi_unit.c
> +++ b/lib/sbi/sbi_unit.c
> @@ -6,7 +6,9 @@
>  #include <sbi/sbi_unit.h>
>  #include <sbi/sbi_console.h>
>  
> +extern struct sbiunit_test_suite bitmap_test_suite;
>  static struct sbiunit_test_suite *test_suites[] = {
> +	&bitmap_test_suite,
>  };
>  
>  static void run_test_suite(struct sbiunit_test_suite *suite)
> -- 
> 2.34.1
> 
>

Thanks,
drew

