From: Inochi Amaoto <inochiama@outlook.com>
Date: Wed, 15 Nov 2023 10:24:00 +0800
Subject: [PATCH v2 2/3] lib: sbi: add more restriction to domain region subset check
In-Reply-To: <CAAhSdy0fDAUA3yM2faj=0ObfKz-Nx7ioi=cySvNKjD1aRqpnQg@mail.gmail.com>
References: <CAAhSdy0fDAUA3yM2faj=0ObfKz-Nx7ioi=cySvNKjD1aRqpnQg@mail.gmail.com>
Message-ID: <IA1PR20MB49531CD6FEBC229D79204A7ABBB1A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>On Tue, Oct 10, 2023 at 6:30?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>>
>> make is_region_subset() check the bound of the domain region, so it can
>> handle the domain region with the same base and length.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>
>Important fact here is that regB_start < regB_end and
>regA_start < regA_end because order == 0 region is of
>size 1 byte.
>
>When regB_start == regA_start and regB_end == regA_end,
>the following is the outcome of the expressions in the existing
>"if ()" check.
>
>(regB_start <= regA_start) == true
>(regA_start < regB_end) == true
>(regB_start < regA_end) == true
>(regA_end <= regB_end) == true
>
>Based on the above, I don't see how this patch helps.
>

Yes, this is my mistake, drop this patch is just OK.

>Regards,
>Anup
>
>
>
>> ---
>>  lib/sbi/sbi_domain.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
>> index 283b598..2b9d16f 100644
>> --- a/lib/sbi/sbi_domain.c
>> +++ b/lib/sbi/sbi_domain.c
>> @@ -185,8 +185,8 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
>>         ulong regB_end = regB->base + (BIT(regB->order) - 1);
>>
>>         if ((regB_start <= regA_start) &&
>> -           (regA_start < regB_end) &&
>> -           (regB_start < regA_end) &&
>> +           (regB_start <= regA_end) &&
>> +           (regA_start <= regB_end) &&
>>             (regA_end <= regB_end))
>>                 return true;
>>
>> --
>> 2.42.0
>>
>

