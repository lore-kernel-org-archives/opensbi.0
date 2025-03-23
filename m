From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Mar 2025 18:34:37 +0530
Subject: [PATCH] lib: add tests for sbi_ecall functionality
In-Reply-To: <20250218182750.226327-1-akshaybehl231@gmail.com>
References: <20250218182750.226327-1-akshaybehl231@gmail.com>
Message-ID: <CAAhSdy2SErfT13brsBavJJ+OmP0=KfyatPhT6XJ9UTNj=LBihg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

HI Akshay,

On Wed, Feb 19, 2025 at 12:08?AM Akshay Behl <akshaybehl231@gmail.com> wrote:
>
> This patch adds unit tests for verifying the sbi_ecall version,
> impid handling, and extension registration functions. The tests
> ensure that the extension registration and unregistration work as
> expected.
>
> Signed-off-by: Akshay Behl <akshaybehl231@gmail.com>

Overall, the patch looks good but please use tabs for alignment
instead of spaces.

> ---
>  lib/sbi/tests/objects.mk       |  5 +++-
>  lib/sbi/tests/sbi_ecall_test.c | 49 ++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 lib/sbi/tests/sbi_ecall_test.c
>
> diff --git a/lib/sbi/tests/objects.mk b/lib/sbi/tests/objects.mk
> index 16608fa..0bf6a83 100644
> --- a/lib/sbi/tests/objects.mk
> +++ b/lib/sbi/tests/objects.mk
> @@ -14,4 +14,7 @@ carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += locks_test_suite
>  libsbi-objs-$(CONFIG_SBIUNIT) += tests/riscv_locks_test.o
>
>  carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += math_test_suite
> -libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_math_test.o
> \ No newline at end of file
> +libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_math_test.o
> +
> +carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += ecall_test_suite
> +libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_ecall_test.o
> \ No newline at end of file
> diff --git a/lib/sbi/tests/sbi_ecall_test.c b/lib/sbi/tests/sbi_ecall_test.c
> new file mode 100644
> index 0000000..c555cd4
> --- /dev/null
> +++ b/lib/sbi/tests/sbi_ecall_test.c
> @@ -0,0 +1,49 @@
> +#include <sbi/sbi_unit_test.h>
> +#include <sbi/sbi_ecall.h>
> +
> +static void test_sbi_ecall_version(struct sbiunit_test_case *test)
> +{
> +    SBIUNIT_EXPECT_EQ(test, sbi_ecall_version_major(), SBI_ECALL_VERSION_MAJOR);
> +    SBIUNIT_EXPECT_EQ(test, sbi_ecall_version_minor(), SBI_ECALL_VERSION_MINOR);
> +}
> +
> +static void test_sbi_ecall_impid(struct sbiunit_test_case *test)
> +{
> +    unsigned long old_impid = sbi_ecall_get_impid();
> +    sbi_ecall_set_impid(42);
> +    SBIUNIT_EXPECT_EQ(test, sbi_ecall_get_impid(), 42);
> +    sbi_ecall_set_impid(old_impid);
> +}
> +
> +static int dummy_handler(unsigned long extid, unsigned long funcid,
> +                         struct sbi_trap_regs *regs,
> +                         struct sbi_ecall_return *out)
> +{
> +    return 0;
> +}
> +
> +static void test_sbi_ecall_register_find_extension(struct sbiunit_test_case *test)
> +{
> +    struct sbi_ecall_extension test_ext = {
> +        /*large extid_start for no overlap*/
> +        .extid_start = 0x80,
> +        .extid_end = 0x80,

We should use SBI experimental extension ID over here.

> +        .name = "TestExt",
> +        .handle = dummy_handler,
> +    };
> +
> +    SBIUNIT_EXPECT_EQ(test, sbi_ecall_register_extension(&test_ext), 0);
> +    SBIUNIT_EXPECT_EQ(test, sbi_ecall_find_extension(0x80), &test_ext);
> +
> +    sbi_ecall_unregister_extension(&test_ext);
> +    SBIUNIT_EXPECT_EQ(test, sbi_ecall_find_extension(0x80), NULL);
> +}
> +
> +static struct sbiunit_test_case ecall_tests[] = {
> +    SBIUNIT_TEST_CASE(test_sbi_ecall_version),
> +    SBIUNIT_TEST_CASE(test_sbi_ecall_impid),
> +    SBIUNIT_TEST_CASE(test_sbi_ecall_register_find_extension),
> +    SBIUNIT_END_CASE,
> +};
> +
> +SBIUNIT_TEST_SUITE(ecall_test_suite, ecall_tests);
> \ No newline at end of file
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

I have taken care of the above comments at the time
of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

