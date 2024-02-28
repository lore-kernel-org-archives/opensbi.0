From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Wed, 28 Feb 2024 17:10:11 +0000
Subject: [PATCH v2 2/5] lib: Add SBIUnit testing macros and functions
In-Reply-To: <20240228-b8e4253e844b44a4d90e92d5@orel>
References: <20240215161625.314131-1-ivan.orlov0322@gmail.com>
 <20240215161625.314131-3-ivan.orlov0322@gmail.com>
 <20240228-3b952164f9b56135e30a6282@orel>
 <2e16bf64-ea2b-4063-91f1-fc08b827559b@gmail.com>
 <20240228-15428229b0969d4d57210313@orel>
 <5169c824-531c-4520-b211-466fda16b529@gmail.com>
 <20240228-b8e4253e844b44a4d90e92d5@orel>
Message-ID: <c94a2fa5-f1c5-4002-8176-dac9bc194023@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/28/24 17:00, Andrew Jones wrote:
> On Wed, Feb 28, 2024 at 04:43:59PM +0000, Ivan Orlov wrote:
>> On 2/28/24 16:30, Andrew Jones wrote:
>>
>>> If a no-name test is OK, then the stop condition should be
>>> s_case->test_func being NULL.
>>>
>>
>> Yeah, I guess we can check the test_func. Thanks!
>>
>> Also, I believe it would be good to mention that we need the last test cases
>> array entry to be empty in the documentation, so it will be more explicit
>> for a developer. I'll do that in the V3 if it is OK with you.
>>
> 
> Sure. You can define an 'END_CASE = { }' type of macro and put it in the
> document's code examples. That'd probably be enough, but you could also
> add a sentence to explicitly state it's required too.
> 

Great, thanks! Perhaps I could define it as SBIUNIT_END_CASE macro and 
use in other tests as well.
-- 
Kind regards,
Ivan Orlov


