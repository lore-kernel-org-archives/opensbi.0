From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Thu, 15 Feb 2024 15:45:20 +0000
Subject: [PATCH 4/4] lib: tests: Add sbi_console test
In-Reply-To: <20240215-62fcfc1f00c95b950e3127b3@orel>
References: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
 <20240208095050.398522-4-ivan.orlov0322@gmail.com>
 <20240212-cd9f3f355276b2f752006b77@orel>
 <d75aad80-37c7-449e-a9cf-8320bd5c0ea7@gmail.com>
 <20240215-62fcfc1f00c95b950e3127b3@orel>
Message-ID: <290c2605-a043-4211-a6d4-65d310c2a1a9@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/15/24 15:13, Andrew Jones wrote:
> On Thu, Feb 15, 2024 at 02:44:15PM +0000, Ivan Orlov wrote:
>> On 2/12/24 18:24, Andrew Jones wrote:
>>> On Thu, Feb 08, 2024 at 09:50:50AM +0000, Ivan Orlov wrote:
> ...
>>>> +static void clear_buf(void)
>>>> +{
>>>> +	pos = 0;
>>>> +	sbi_memset(buf, 0, BUF_LEN);
>>>
>>> I guess buf[0] = '\0' should be sufficient.
>>>
>>
>> Sorry for the late reply, I agree on all of the points you mentioned except
>> this one. The 'puts' test stops me from clearing the buffer by setting the
>> first char to zero:
>>
>> ```
>> PUTS_TEST(test, "Hello,", "Hello,\0OpenSBI!");
>> ```
>>
>> This test checks if 'puts' stops printing after facing \0. 'puts' won't
>> print out the \0 to the buffer after printing "Hello,", so in case of the
>> 'lazy' buffer clearing there might be other characters in buffer after
>> 'Hello,'. In this case, the 'sbi_strcmp' won't stop comparing the strings
>> causing the test to fail (despite the behavior is correct).
>>
>> I reckon that clearing the buffer completely will help avoiding such tricky
>> issues by making the experiment as pure as possible :)
> 
> Since the mock console device is a ring buffer it doesn't guarantee zeros
> will follow the printed strings. I suggest writing tests which only
> confirm the characters printed are in the stream and in the right order,
> but not check for anything console device implementation specific.
> 

Ah, alright, I see. Moreover, this particular test case is just useless 
since it doesn't increase the coverage. So I guess I will just use the 
"lazy" buffer clearing and remove this particular 'PUTS_TEST'. Thanks 
for the clarification!

-- 
Kind regards,
Ivan Orlov


