From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Tue, 13 Feb 2024 14:54:17 +0000
Subject: [PATCH 1/4] docs: Add documentation about tests and SBIUnit
In-Reply-To: <20240213-a2478b49c77f64f9f111e96b@orel>
References: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
 <20240212-f61079aa6ee3990c6084ff7c@orel>
 <12c2ecd6-0367-470f-90bf-35a805574147@gmail.com>
 <20240213-a2478b49c77f64f9f111e96b@orel>
Message-ID: <168f8ed3-6cc1-4cb0-a3bc-a738383775a1@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/13/24 13:51, Andrew Jones wrote:
> On Mon, Feb 12, 2024 at 09:48:02PM +0000, Ivan Orlov wrote:
>> On 2/12/24 17:20, Andrew Jones wrote:
> ...
>>> But I think we should be able to add the test suite pointer to an elf
>>> section with the SBIUNIT_TEST_SUITE() macro to avoid this step.
>>>
>>
>> That was an initial idea, however I faced some obstacles during the
>> implementation.
>>
>> I believe we would like to cover the static functions, as well as use static
>> variables in the tests. In this case, we would include the test in the
>> source we are covering (for instance, include "sbi_console_test.c" in
>> "sbi_console.c"). If we use OpenSBI (libplatsbi.a) as a library when linking
>> firmware, and firmware refers to a symbol from "sbi_console.h", it will
>> automatically link the test code too. This means that firmware should have
>> the test ELF section as well. Manual registration of the tests in
>> 'sbi_unit.c', on the other hand, would not require any effort from the
>> firmware developers if they decide to enable tests for OpenSBI.
> 
> Hmm, I see. So maybe we can use the build system's carray?
> 

Hmmm, I've never heard about this thing before, could you please point 
me to a reference or source where I could read about it?

>>
>> Moreover, manual test declaration will make sure that we included all of the
>> tests. Otherwise, if we define the test in a separate file, it will be
>> linked out unless we refer to symbols from it somewhere.
> 
> This could possibly be worked around with the linker's --whole-archive
> option.

In this case we would have to update the makefile logic, because now 
OpenSBI uses 'compile_elf' makefile procedure for the test payload and 
the firmware elf files both, and we would not like to use 
--whole-archive for the test payload. I guess it is an overcomplication...

-- 
Kind regards,
Ivan Orlov


