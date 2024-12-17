From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 17 Dec 2024 10:34:37 +0100
Subject: [PATCH v4 5/5] lib: sbi: pmu: add the PMU SSE event only if
 overflow IRQ is supported
In-Reply-To: <CAHBxVyF6EoD6ZhgYBjQgEQhE5VY0sTUKcRFMM5iODVdaeOYBFA@mail.gmail.com>
References: <20241216212144.3379890-1-cleger@rivosinc.com>
 <20241216212144.3379890-6-cleger@rivosinc.com>
 <CAHBxVyF6EoD6ZhgYBjQgEQhE5VY0sTUKcRFMM5iODVdaeOYBFA@mail.gmail.com>
Message-ID: <27044204-fe52-476b-b1ac-66c8bd3718f9@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 17/12/2024 03:20, Atish Kumar Patra wrote:
> On Mon, Dec 16, 2024 at 1:22?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>
>> Add the PMU SSE event only if an overflow irq bit is present.
>>
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>>  lib/sbi/sbi_pmu.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
>> index eb31f3e9..83a95b6d 100644
>> --- a/lib/sbi/sbi_pmu.c
>> +++ b/lib/sbi/sbi_pmu.c
>> @@ -1166,7 +1166,8 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
>>                 total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
>>         }
>>
>> -       sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
>> +       if (sbi_pmu_irq_bit() >= 0)
>> +               sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
>>

Even though it works, I should have move the call to the coldboot
section. I'll fix that in the V5.

Thanks,

Cl?ment

> 
> 
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> 
>>         phs = pmu_get_hart_state_ptr(scratch);
>>         if (!phs) {
>> --
>> 2.45.2
>>


