From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Mar 2024 11:12:07 +0530
Subject: [PATCH] docs: writing_tests: Make docs correspond the latest changes
In-Reply-To: <20240319160239.303765-1-ivan.orlov0322@gmail.com>
References: <20240319160239.303765-1-ivan.orlov0322@gmail.com>
Message-ID: <CAAhSdy1Vp5k2CaJZ67d46fHX6ZJaY6bgaW9+m_90TjSXaVC7OQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 19, 2024 at 9:32?PM Ivan Orlov <ivan.orlov0322@gmail.com> wrote:
>
> We should store test object files list in the `libsbi-objs-y` Makefile
> variable, not in `libsbitests-objs-y`. Update the documentation
> correspondingly.
>
> Since we don't use the `console_dev` static variable directly in the
> `sbi_console_test` unit test anymore, remove the paragraph which says
> that we do.
>
> Fixes: 86224ec36aed ("docs/writing_tests: Update tests paths")
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  docs/writing_tests.md | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/docs/writing_tests.md b/docs/writing_tests.md
> index 816adba..2ce887a 100644
> --- a/docs/writing_tests.md
> +++ b/docs/writing_tests.md
> @@ -53,8 +53,8 @@ SBIUNIT_TEST_SUITE(string_test_suite, string_test_cases);
>  Then, add the corresponding Makefile entries to `lib/sbi/tests/objects.mk`:
>  ```lang-makefile
>  ...
> -libsbitests-objs-$(CONFIG_SBIUNIT) += sbi_string_test.o
>  carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += string_test_suite
> +libsbi-objs-$(CONFIG_SBIUNIT) += sbi_string_test.o
>  ```
>
>  If you compiled OpenSBI with CONFIG_SBIUNIT enabled before, you may need to
> @@ -113,9 +113,6 @@ carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += string_test_suite
>  You don't have to compile the `sbi_string_test.o` separately, because the
>  test code will be included into the `sbi_string` object file.
>
> -See example in `lib/sbi/tests/sbi_console_test.c`, where statically declared
> -`console_dev` variable is used to mock the `sbi_console_device` structure.
> -
>  "Mocking" the structures
>  ------------------------
>  See the example of structure "mocking" in `lib/sbi/tests/sbi_console_test.c`,
> --
> 2.34.1
>

