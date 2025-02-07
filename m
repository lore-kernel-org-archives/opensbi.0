From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 7 Feb 2025 17:47:46 -0600
Subject: [PATCH] Convert hartid to hart index to get scratch.
In-Reply-To: <20250207213422.175358-1-Raj.Vishwanathan@gmail.com>
References: <20250109233241.2491-1-cfu@mips.com>
 <20250207213422.175358-1-Raj.Vishwanathan@gmail.com>
Message-ID: <99bb0907-7859-4424-8f3f-ed7d26ca2e6e@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-02-07 3:34 PM, Raj Vishwanathan wrote:
> Any feedback on this patch? 
> The hartid's may not be sequential. We need to use the index to get the scratch.

Yes, it is true that the harts associated with an ACLINT MSWI need not have
sequential hartids. The ACLINT spec explicitly calls this out. However, there is
also no guarantee that they will have sequential OpenSBI hart indexes, either.
The allocation of hart indexes within OpenSBI should be considered entirely
arbitrary. Consider what happens if you randomly select a non-boot-hart CPU node
in the DT and mark it as status = "disabled"; this should not cause any
erroneous behavior.

Fundamentally, the "first_hartid" and "hart_count" members in aclint_mswi_data
are insufficient to cover an ACLINT MSWI with a non-sequential hart mapping. So
more refactoring is needed to handle your case robustly.

Regards,
Samuel

> On Thu, Jan 9, 2025 at 4:07?PM Chao-ying Fu <icebergfu@gmail.com> wrote:
>>
>> Hartid may not be sequential, so we need to use index to get scratch.
>> ---
>>  lib/utils/ipi/aclint_mswi.c     | 2 +-
>>  lib/utils/timer/aclint_mtimer.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
>> index 9e55078..e22903f 100644
>> --- a/lib/utils/ipi/aclint_mswi.c
>> +++ b/lib/utils/ipi/aclint_mswi.c
>> @@ -87,7 +87,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
>>
>>         /* Update MSWI pointer in scratch space */
>>         for (i = 0; i < mswi->hart_count; i++) {
>> -               scratch = sbi_hartid_to_scratch(mswi->first_hartid + i);
>> +               scratch = sbi_hartindex_to_scratch(sbi_hartid_to_hartindex(mswi->first_hartid) + i);
>>                 /*
>>                  * We don't need to fail if scratch pointer is not available
>>                  * because we might be dealing with hartid of a HART disabled
>> diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
>> index 3db3c3b..eb80f24 100644
>> --- a/lib/utils/timer/aclint_mtimer.c
>> +++ b/lib/utils/timer/aclint_mtimer.c
>> @@ -206,7 +206,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
>>
>>         /* Update MTIMER pointer in scratch space */
>>         for (i = 0; i < mt->hart_count; i++) {
>> -               scratch = sbi_hartid_to_scratch(mt->first_hartid + i);
>> +               scratch = sbi_hartindex_to_scratch(sbi_hartid_to_hartindex(mt->first_hartid) + i);
>>                 /*
>>                  * We don't need to fail if scratch pointer is not available
>>                  * because we might be dealing with hartid of a HART disabled
>> --
>> 2.47.1
>>
>  


