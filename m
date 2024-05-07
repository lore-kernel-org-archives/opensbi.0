From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 May 2024 11:32:53 +0530
Subject: [PATCH 3/3] lib: tests: Add test for spinlocks
In-Reply-To: <20240423155245.14541-4-ivan.orlov0322@gmail.com>
References: <20240423155245.14541-1-ivan.orlov0322@gmail.com> <20240423155245.14541-4-ivan.orlov0322@gmail.com>
Message-ID: <CAAhSdy1X0b8MCFGnw-FxPe_ByvmC5jZdz4d=8nsmmp33spaEvA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 23, 2024 at 9:23?PM Ivan Orlov <ivan.orlov0322@gmail.com> wrote:
>
> Implement the test which covers some of the functions from the
> `riscv_locks.h` file. This test consists of 3 test cases:
>
> 1) For lock/unlock functions
> 2) Unsuccessful trylock (the lock was previously taken)
> 3) Successful trylock (the lock is free and can be taken)
>
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/tests/objects.mk         |  3 +++
>  lib/sbi/tests/riscv_locks_test.c | 41 ++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 lib/sbi/tests/riscv_locks_test.c
>
> diff --git a/lib/sbi/tests/objects.mk b/lib/sbi/tests/objects.mk
> index ba588dc..8f27289 100644
> --- a/lib/sbi/tests/objects.mk
> +++ b/lib/sbi/tests/objects.mk
> @@ -9,3 +9,6 @@ libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_console_test.o
>
>  carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += atomic_test_suite
>  libsbi-objs-$(CONFIG_SBIUNIT) += tests/riscv_atomic_test.o
> +
> +carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += locks_test_suite
> +libsbi-objs-$(CONFIG_SBIUNIT) += tests/riscv_locks_test.o
> diff --git a/lib/sbi/tests/riscv_locks_test.c b/lib/sbi/tests/riscv_locks_test.c
> new file mode 100644
> index 0000000..7894c4e
> --- /dev/null
> +++ b/lib/sbi/tests/riscv_locks_test.c
> @@ -0,0 +1,41 @@
> +#include <sbi/sbi_unit_test.h>
> +#include <sbi/riscv_locks.h>
> +
> +static spinlock_t test_lock = SPIN_LOCK_INITIALIZER;
> +
> +static void spin_lock_test(struct sbiunit_test_case *test)
> +{
> +       /* We don't want to accidentally get locked */
> +       SBIUNIT_ASSERT(test, !spin_lock_check(&test_lock));
> +
> +       spin_lock(&test_lock);
> +       SBIUNIT_EXPECT(test, spin_lock_check(&test_lock));
> +       spin_unlock(&test_lock);
> +
> +       SBIUNIT_ASSERT(test, !spin_lock_check(&test_lock));
> +}
> +
> +static void spin_trylock_fail(struct sbiunit_test_case *test)
> +{
> +       /* We don't want to accidentally get locked */
> +       SBIUNIT_ASSERT(test, !spin_lock_check(&test_lock));
> +
> +       spin_lock(&test_lock);
> +       SBIUNIT_EXPECT(test, !spin_trylock(&test_lock));
> +       spin_unlock(&test_lock);
> +}
> +
> +static void spin_trylock_success(struct sbiunit_test_case *test)
> +{
> +       SBIUNIT_EXPECT(test, spin_trylock(&test_lock));
> +       spin_unlock(&test_lock);
> +}
> +
> +static struct sbiunit_test_case locks_test_cases[] = {
> +       SBIUNIT_TEST_CASE(spin_lock_test),
> +       SBIUNIT_TEST_CASE(spin_trylock_fail),
> +       SBIUNIT_TEST_CASE(spin_trylock_success),
> +       SBIUNIT_END_CASE,
> +};
> +
> +SBIUNIT_TEST_SUITE(locks_test_suite, locks_test_cases);
> --
> 2.34.1
>

