From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 10 Dec 2024 10:10:08 +0100
Subject: [PATCH 0/3] lib: sbi: fix PMU SSE event handling
In-Reply-To: <CAHBxVyGgBpQMruiwYxQ5Sf0Suqf-ocj5h2YDby8PDVqq2OQdOA@mail.gmail.com>
References: <20241206205958.1055770-1-cleger@rivosinc.com>
 <CAOnJCUJ8mJF+SYoxC4hkyRTxVJJThGm4hw4CGd5--abEMjfeRw@mail.gmail.com>
 <31b16dc4-e733-4ed9-acb8-b1d91250bd94@rivosinc.com>
 <58e73071-c475-434d-9277-50e98e14d4fb@rivosinc.com>
 <CAHBxVyGgBpQMruiwYxQ5Sf0Suqf-ocj5h2YDby8PDVqq2OQdOA@mail.gmail.com>
Message-ID: <32740f1a-7911-46b2-aa36-03a51767115f@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 09/12/2024 19:40, Atish Kumar Patra wrote:
> On Mon, Dec 9, 2024 at 12:55?AM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>
>>
>>
>> On 09/12/2024 09:36, Cl?ment L?ger wrote:
>>>
>>>
>>> On 06/12/2024 23:25, Atish Patra wrote:
>>>> On Fri, Dec 6, 2024 at 1:00?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>>>>
>>>>> While reworking the Linux SSE support, it appears that the PMU event
>>>>> should not be available if the SSCOFPMF extension is not available since
>>>>> there would be no IRQ. The specification isn't really clear on that point
>>>>> so this is more like a RFC to check that. Ideally, the sse register call
>>>>
>>>> Can you send a patch for SBI spec ? I think we can call it a local PMU
>>>> overflow event
>>>> rather than a PMU.
>>>
>>> Yes sure, that makes more sense.  I'll also modify the possible return
>>> value for register to add NOT_SUPPORTED in case some dependencies are
>>> missing
>>
>> While thinking about it, should we actually return ERR_INVALID_PARAM or
>> add a new ERR_NOT_SUPPORTED if the event is not supported due to missing
>> dependencies ? It seems like it is different but I'm not sure it adds
>> any valuable information (ie, the caller is not going to do anything
>> special about it)
>>
> 
> IMO, we should add ERR_NOT_SUPPORTED as ERR_INVALID_PARAM indicates
> that event_id
> is not valid. But ERR_NOT_SUPPORTED will indicate that event_id is
> valid but the firmware doesn't support
> this event for some reasons (e.g missing ISA dependency being one of them)

Ok, that seems like a sane behavior as well. I'll send a riscv-sbi-doc
pr for that.

Cl?ment

> 
>> Cl?ment
>>
>>>
>>> Thanks,
>>>
>>> Cl?ment
>>>
>>>>
>>>> We can add a note about the Sscofpmf dependency as well.
>>>>
>>>>> should allow to refuse registering an event if the dependencies are not
>>>>> satisfied but does not allow this yet.
>>>>>
>>>>> Cl?ment L?ger (3):
>>>>>   lib: sbi: sse: Return a value from the register callback
>>>>>   lib: sbi: sse: Disable injection if callbacks are set
>>>>>   lib: sbi: pmu: Set a SSE register_cb() for event availability
>>>>>
>>>>>  include/sbi/sbi_sse.h |  2 +-
>>>>>  lib/sbi/sbi_pmu.c     | 11 +++++++++++
>>>>>  lib/sbi/sbi_sse.c     | 19 +++++++++++++++++--
>>>>>  3 files changed, 29 insertions(+), 3 deletions(-)
>>>>>
>>>>> --
>>>>> 2.45.2
>>>>>
>>>>>
>>>>> --
>>>>> opensbi mailing list
>>>>> opensbi at lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/opensbi
>>>>
>>>>
>>>>
>>>
>>


