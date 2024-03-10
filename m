From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Sun, 10 Mar 2024 20:21:17 +0000
Subject: [PATCH v4 1/4] docs: Add documentation about tests and SBIUnit
In-Reply-To: <CAAhSdy2OG74-Vhj8vrm+fGwUjEVKBtYPHCGh43_uaSF4KYDwBA@mail.gmail.com>
References: <20240304214551.365057-1-ivan.orlov0322@gmail.com>
 <20240304214551.365057-2-ivan.orlov0322@gmail.com>
 <CAAhSdy2OG74-Vhj8vrm+fGwUjEVKBtYPHCGh43_uaSF4KYDwBA@mail.gmail.com>
Message-ID: <d68980bb-3dc9-45bf-9539-fb6ad7f4badd@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/10/24 04:48, Anup Patel wrote:
> On Tue, Mar 5, 2024 at 3:15?AM Ivan Orlov <ivan.orlov0322@gmail.com> wrote:
>>
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
>> V2 -> V3:
>> - Fix a few typos
>> - Provide the expected console output as it is, without following 80-chars
>> rule
>> - Update the example test source: use SBIUNIT_END_CASE macro instead of
>> "{}"
>> - Add the paragraph about the manual removal of the 'build/' directory
>> in order to regenerate carray-related files. Currently, that's the only
>> reliable way to regenerate them if carray Makefile variable changes, and
>> it is going to be fixed in the future.
>> V3 -> V4:
>> - Fix 'the' articles in the text
>>
>>   docs/writing_tests.md | 133 ++++++++++++++++++++++++++++++++++++++++++
> 
> Since this is a new MD file under docs, we should also add it to the
> list of INPUT files in docs/doxygen.cfg
> 
> I have taken care of this at the time of merging this patch.
> 
> 

Ah, sorry, I missed that. Thank you for adding it into the right place.

-- 
Kind regards,
Ivan Orlov


