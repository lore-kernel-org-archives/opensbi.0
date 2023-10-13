From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 13 Oct 2023 14:45:35 +0800
Subject: [PATCH 1/3] lib: utils/timer: Allow ACLINT MTIMER driver to setup quirks
In-Reply-To: <CAJF2gTStYzrYon2xuq3TFPLVkH=mS_-weNV9xM9r25p2xTsevA@mail.gmail.com>
References: <CAJF2gTStYzrYon2xuq3TFPLVkH=mS_-weNV9xM9r25p2xTsevA@mail.gmail.com>
Message-ID: <IA1PR20MB4953FDDA2BC139F71DEC19C7BBD2A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>On Thu, Oct 12, 2023 at 7:19?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>>
>>> On Thu, Oct 12, 2023 at 5:01?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>>>>
>>>> The quirks checking will cause ACLINT step into a CLINT code path, this
>>>> is not expected when ACLINT needs a quirks.
>>>>
>>>> Add more check to ensure the timer is CLINT before applying quirks.
>>>> And now apply the general quirks after applying CLINT specific quirks.
>>>>
>>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>>> ---
>>>>  lib/utils/timer/fdt_timer_mtimer.c | 17 ++++++++++++++---
>>>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
>>>> index 9eaa11d..cd14f75 100644
>>>> --- a/lib/utils/timer/fdt_timer_mtimer.c
>>>> +++ b/lib/utils/timer/fdt_timer_mtimer.c
>>>> @@ -29,6 +29,12 @@ static SBI_LIST_HEAD(mtn_list);
>>>>
>>>>  static struct aclint_mtimer_data *mt_reference = NULL;
>>>>
>>>> +static int timer_is_clint(const void *data)
>>>
>>> The timer is not clint, the timer is in the clint, right?
>>
>> I have no idea about what you mean.
>> I think your meaning is that this is for clint timer, right?0
>> For this function, it just checks whether the quirk is for clint.
>>
>>> How about timer_in_clint?
>>>
>>
>> This name make me confused, maybe is_clint_quirk is better?
>In timer_is_clint, you detect mtime_offset, if "mtime_offset != 0"
>means the clint address contains a timer, we add an offset for it.
>Otherwise, clint & timer are separated.
>

OK, I take it.

>That's my suggestion of timer_in_clint's meaning. The is_clint_quirk
>didn't give the correct meaning because the quirk is always there.
>

In fact, the quirk for aclint is confusing. IIRC, both the quirks for
aclint and quirks for clint are in the same struct. The quirk struct may
need a split, but this is not the thing this patch should care about.

>Here are many options:
>!timer_is_separate(data)/clint_contains_timer(data)/!clint_is_separate(data)/!clint_is_split(data)/...
>
I will take clint_contains_timer for this action, it is better to describe
the thing we are talking about.

