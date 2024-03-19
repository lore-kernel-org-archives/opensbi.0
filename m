From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Tue, 19 Mar 2024 15:52:29 +0000
Subject: [PATCH 1/2] lib: tests: Move tests to a separate directory
In-Reply-To: <CAK9=C2VCkP7qkXVTOMz6cWw05qW+BVC_=tqoqb_8NK4wQodPQw@mail.gmail.com>
References: <20240313150158.204455-1-ivan.orlov0322@gmail.com>
 <20240313150158.204455-2-ivan.orlov0322@gmail.com>
 <CAAhSdy39Hb3ifkk=P-1sEFYBqR0A+rnN4U8xQ7=J9d0JY6tpDw@mail.gmail.com>
 <2872506e-5587-4846-92db-e96f014d9774@gmail.com>
 <CAK9=C2VCkP7qkXVTOMz6cWw05qW+BVC_=tqoqb_8NK4wQodPQw@mail.gmail.com>
Message-ID: <6c6b5f02-eeab-4d01-aad1-237972ba1b87@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/19/24 15:47, Anup Patel wrote:
> On Tue, Mar 19, 2024 at 9:14?PM Ivan Orlov <ivan.orlov0322@gmail.com> wrote:
>>
>> On 3/19/24 05:55, Anup Patel wrote:
>>> On Wed, Mar 13, 2024 at 8:32?PM Ivan Orlov <ivan.orlov0322@gmail.com> wrote:
>>>>
>>>> Move all of the SBIUnit-related code into the lib/sbi/tests directory.
>>>> Update 'Makefile' to index objects from the tests subdirectory.
>>>>
>>>> I don't think creating the full separate list of Makefile variables
>>>> (libsbitests-objs-path-y, libsbitests-object-mks, etc. as it is done for
>>>> libsbiutils) is necessary for the tests because:
>>>>
>>>> 1) `lib/sbi/tests/objects.mk` is already indexed into
>>>> 'libsbi-objects-mks' since the find expression for the libsbi-object-mks
>>>> variable looks for objects.mk files in the nested directories as well).
>>>>
>>>> 2) Tests are tightly coupled with the `lib/sbi/` sources, therefore it
>>>> may be reasonable to store the list of lib/sbi and lib/sbi/tests object
>>>> files together in the libsbi-objs-path-y variable.
>>>>
>>>> Additionally, update relative paths in the tests where necessary.
>>>>
>>>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
>>>> ---
>>>>    Makefile                                  | 2 ++
>>>>    lib/sbi/objects.mk                        | 6 ------
>>>>    lib/sbi/sbi_console.c                     | 2 +-
>>>>    lib/sbi/tests/objects.mk                  | 6 ++++++
>>>>    lib/sbi/{ => tests}/sbi_bitmap_test.c     | 0
>>>>    lib/sbi/{ => tests}/sbi_console_test.c    | 0
>>>>    lib/sbi/{ => tests}/sbi_unit_test.c       | 0
>>>>    lib/sbi/{ => tests}/sbi_unit_tests.carray | 0
>>>>    8 files changed, 9 insertions(+), 7 deletions(-)
>>>>    create mode 100644 lib/sbi/tests/objects.mk
>>>>    rename lib/sbi/{ => tests}/sbi_bitmap_test.c (100%)
>>>>    rename lib/sbi/{ => tests}/sbi_console_test.c (100%)
>>>>    rename lib/sbi/{ => tests}/sbi_unit_test.c (100%)
>>>>    rename lib/sbi/{ => tests}/sbi_unit_tests.carray (100%)
>>>>
>>>> diff --git a/Makefile b/Makefile
>>>> index 680c19a..eef321e 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -247,6 +247,8 @@ include $(firmware-object-mks)
>>>>
>>>>    # Setup list of objects
>>>>    libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
>>>> +# Index unit tests
>>>> +libsbi-objs-path-y+=$(foreach obj,$(libsbitests-objs-y),$(build_dir)/lib/sbi/tests/$(obj))
>>>
>>> No need for changing top-level Makefile.
>>>
>>>>    ifdef PLATFORM
>>>>    libsbiutils-objs-path-y=$(foreach obj,$(libsbiutils-objs-y),$(platform_build_dir)/lib/utils/$(obj))
>>>>    platform-objs-path-y=$(foreach obj,$(platform-objs-y),$(platform_build_dir)/$(obj))
>>>> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
>>>> index 2bed7f3..5d06d25 100644
>>>> --- a/lib/sbi/objects.mk
>>>> +++ b/lib/sbi/objects.mk
>>>> @@ -11,12 +11,6 @@ libsbi-objs-y += riscv_asm.o
>>>>    libsbi-objs-y += riscv_atomic.o
>>>>    libsbi-objs-y += riscv_hardfp.o
>>>>    libsbi-objs-y += riscv_locks.o
>>>> -libsbi-objs-$(CONFIG_SBIUNIT) += sbi_unit_test.o
>>>> -libsbi-objs-$(CONFIG_SBIUNIT) += sbi_unit_tests.o
>>>> -
>>>> -libsbi-objs-$(CONFIG_SBIUNIT) += sbi_bitmap_test.o
>>>> -carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += bitmap_test_suite
>>>> -carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += console_test_suite
>>>>
>>>>    libsbi-objs-y += sbi_ecall.o
>>>>    libsbi-objs-y += sbi_ecall_exts.o
>>>> diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
>>>> index d1229d0..8d1ad2e 100644
>>>> --- a/lib/sbi/sbi_console.c
>>>> +++ b/lib/sbi/sbi_console.c
>>>> @@ -490,5 +490,5 @@ int sbi_console_init(struct sbi_scratch *scratch)
>>>>    }
>>>>
>>>>    #ifdef CONFIG_SBIUNIT
>>>> -#include "sbi_console_test.c"
>>>> +#include "tests/sbi_console_test.c"
>>>>    #endif
>>>
>>> We can simply drop including "tests/sbi_console_test.c" by
>>> relaxing the check in sbi_console_set_device().
>>>
>>>> diff --git a/lib/sbi/tests/objects.mk b/lib/sbi/tests/objects.mk
>>>> new file mode 100644
>>>> index 0000000..0397172
>>>> --- /dev/null
>>>> +++ b/lib/sbi/tests/objects.mk
>>>> @@ -0,0 +1,6 @@
>>>> +libsbitests-objs-$(CONFIG_SBIUNIT) += sbi_unit_test.o
>>>> +libsbitests-objs-$(CONFIG_SBIUNIT) += sbi_unit_tests.o
>>>> +
>>>> +libsbitests-objs-$(CONFIG_SBIUNIT) += sbi_bitmap_test.o
>>>
>>> We just need "tests/" prefix to above objects. Just like we do
>>> in various objects.mk under utils directory.
>>>
>>>> +carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += bitmap_test_suite
>>>> +carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += console_test_suite
>>>> diff --git a/lib/sbi/sbi_bitmap_test.c b/lib/sbi/tests/sbi_bitmap_test.c
>>>> similarity index 100%
>>>> rename from lib/sbi/sbi_bitmap_test.c
>>>> rename to lib/sbi/tests/sbi_bitmap_test.c
>>>> diff --git a/lib/sbi/sbi_console_test.c b/lib/sbi/tests/sbi_console_test.c
>>>> similarity index 100%
>>>> rename from lib/sbi/sbi_console_test.c
>>>> rename to lib/sbi/tests/sbi_console_test.c
>>>> diff --git a/lib/sbi/sbi_unit_test.c b/lib/sbi/tests/sbi_unit_test.c
>>>> similarity index 100%
>>>> rename from lib/sbi/sbi_unit_test.c
>>>> rename to lib/sbi/tests/sbi_unit_test.c
>>>> diff --git a/lib/sbi/sbi_unit_tests.carray b/lib/sbi/tests/sbi_unit_tests.carray
>>>> similarity index 100%
>>>> rename from lib/sbi/sbi_unit_tests.carray
>>>> rename to lib/sbi/tests/sbi_unit_tests.carray
>>>> --
>>>> 2.34.1
>>>>
>>>
>>> I have taken care of the above minor issues at the time of merging
>>> this patch.
>>>
>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>>
>>> Applied this patch to the riscv/opensbi repo.
>>>
>>
>> Hi Anup,
>>
>> Thank you so much for the review and for fixing these issues.
>>
>> Now the documentation should be updated as well, correspondingly with
>> the updates you made: currently, 'writing_tests.md' doc specifies the
>> wrong Makefile variable name for the tests (libsbitests-... instead of
>> libsbi-...). I'll fix it and send the patch today.
> 
> Ahh, my bad. I will wait for your patch.
> 

No worries, give me 15 minutes :)

-- 
Kind regards,
Ivan Orlov


