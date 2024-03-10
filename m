From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Sun, 10 Mar 2024 20:07:09 +0000
Subject: [PATCH v4 0/4] SBIUnit: cover OpenSBI with tests
In-Reply-To: <CAAhSdy1mKm8oM4S7tUCV67uOCCw35uLkQw54gBPaYcX0ac1-kA@mail.gmail.com>
References: <20240304214551.365057-1-ivan.orlov0322@gmail.com>
 <CAAhSdy1mKm8oM4S7tUCV67uOCCw35uLkQw54gBPaYcX0ac1-kA@mail.gmail.com>
Message-ID: <f1b72f49-01e9-4df7-8d94-e6e81bcb431d@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/10/24 04:54, Anup Patel wrote:
> On Tue, Mar 5, 2024 at 3:15?AM Ivan Orlov <ivan.orlov0322@gmail.com> wrote:
>>
>> It is good when the code is covered with tests. Tests help us to keep
>> the code clean and avoid regressions. Also, a good test is always a nice
>> documentation for the code it covers.
>>
>> This patch series introduces SBIUnit - the set of macros and functions
>> which simplify the unit test development for OpenSBI and automate tests
>> execution and evaluation.
>>
>> This thing is mainly inspired by the KUnit framework from the Linux
>> Kernel, where the similar unit-test development tooling have been used
>> successfully for a pretty long time now. SBIUnit uses the same test
>> structure: multiple test cases are grouped together into the test
>> suites. SBIUnit also tries to reproduce the KUnit tests API while
>> allowing for some simplifications.
>>
>> Another difference between the KUnit and SBIUnit is the location where
>> the tests are "stored". KUnit creates the ELF section in the kernel and
>> stores the pointers to all of the test suites there. SBIUnit takes
>> advantage of the 'carray' functionality of OpenSBI, keeping the pointers
>> to test suites in the auto-generated ".c" file. ELF section approach
>> could not be applied to SBIUnit, because OpenSBI could be used as a
>> static library when linking firmware. Use of a dedicated ELF section
>> would mean that all firmware linked with OpenSBI would need to have
>> this ELF section as well.
>>
>> V1 -> V2:
>> - Add a cover letter
>> - Elaborate more on the differences between SBIUnit and KUnit
>> - Add a new patch adding a new entry to the 'clear' makefile target in
>> order to clear carray-generated files as well.
>>
>> V2 -> V3:
>> - Drop the patch which modifies carray behavior (it will be included
>> into a separate patch series)
>>
>> V3 -> V4:
>> - (Patch-specific changes are described in the following patches)
>>
>> Ivan Orlov (4):
>>    docs: Add documentation about tests and SBIUnit
>>    lib: Add SBIUnit testing macros and functions
>>    lib: tests: Add a test for sbi_bitmap
>>    lib: tests: Add sbi_console test
> 
> Overall, this is a good addition to OpenSBI. This unit testing framework
> not only allows testing OpenSBI code but it will also enable people to
> write M-mode baremetal tests.
> 
> As a separate patch, I suggest moving all unit test related code
> under sub-directory lib/sbi/tests. This way testing related code is
> easy to locate under lib/sbi directory.
> 

Hi Anup,

Thank you so much for considering this patch series, and I'm glad to 
hear that it could be useful. I agree that the tests should be moved to 
the separate directory, and I will do it in the near future :)

--
Kind regards,
Ivan Orlov


