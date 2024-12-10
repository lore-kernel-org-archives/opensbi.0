From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 10 Dec 2024 10:25:14 +0100
Subject: [PATCH 2/3] lib: sbi: sse: Disable injection if callbacks are set
In-Reply-To: <386dcaa8-fe65-4dfc-ba3a-0596e6d2ebef@sifive.com>
References: <20241206205958.1055770-1-cleger@rivosinc.com>
 <20241206205958.1055770-3-cleger@rivosinc.com>
 <CAHBxVyHWPQHwp89bMmi5F7DmVb0n+B1OfRVZ1sQLCxm5kvB7qw@mail.gmail.com>
 <386dcaa8-fe65-4dfc-ba3a-0596e6d2ebef@sifive.com>
Message-ID: <8aaf0747-0076-40be-b904-a1e4e5dd044f@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 09/12/2024 21:05, Samuel Holland wrote:
> On 2024-12-09 12:46 PM, Atish Kumar Patra wrote:
>> On Fri, Dec 6, 2024 at 1:00?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>>
>>> Once a 'driver' as registered callback for an event, disable event
>>> injection for that event to avoid messing up with the driver.
>>>
>>
>> Why ? To avoid DoS type attacks ?
>>
>> Otherwise, I think inject is useful to test/debug the driver without
>> actually triggering the hardware events which can generate the SSE.
> 
> Agreed. I would prefer to modify the driver so it is safe to inject the events.

Ok, so let's remove that patch ;)

> 
>>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>>> ---
>>>  lib/sbi/sbi_sse.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
>>> index 5679c26f..f9340381 100644
>>> --- a/lib/sbi/sbi_sse.c
>>> +++ b/lib/sbi/sbi_sse.c
>>> @@ -887,6 +887,9 @@ int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
>>>                 return SBI_EINVAL;
>>>
>>>         e->cb_ops = cb_ops;
>>> +       /* Do not mess with events that are handled by drivers */
>>> +       e->attrs.status &= ~BIT(SBI_SSE_ATTR_STATUS_INJECT_OFFSET);
>>> +
>>>         sse_event_put(e);
>>>
>>>         return SBI_OK;
>>> --
>>> 2.45.2
>>>
>>
> 


