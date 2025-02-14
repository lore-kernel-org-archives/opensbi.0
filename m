From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 14 Feb 2025 11:25:54 +0100
Subject: [PATCH v2 3/4] lib: sbi: fwft: Fix error return value for feature
 > 32 bits
In-Reply-To: <08b8072310ba2b83a3e4cde2bb1ba56aa2816530.camel@126.com>
References: <20250124165202.465445-1-cleger@rivosinc.com>
 <20250124165202.465445-4-cleger@rivosinc.com>
 <dfc7cd26f725db45810810b60a3ff1acf46735a5.camel@126.com>
 <8464bd3b-8444-498e-8135-4f679c1af3fe@rivosinc.com>
 <08b8072310ba2b83a3e4cde2bb1ba56aa2816530.camel@126.com>
Message-ID: <8853ce96-cfad-40d9-9bbe-d69c59cfc09d@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/02/2025 12:23, Xiang W wrote:
> ? 2025-02-11?? 11:42 +0100?Cl?ment L?ger???
>>
>>
>> On 11/02/2025 04:37, Xiang W wrote:
>>> ? 2025-01-24?? 17:51 +0100?Cl?ment L?ger???
>>>> Based on the spec, invalid feature should return SBI_ERR_INVALID_PARAM.
>>>> This was not the case with the current implementation since the upper 32
>>>> bits were not considered when checking the feature thus returning
>>>> SBI_ERR_DENIED. Fix that by passing the raw unsigned long rather than
>>>> the enum to be sure we are passing the full 64 bits and then check for
>>>> upper bits to be cleared.
>>>>
>>>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>>>> ---
>>>> ?include/sbi/sbi_fwft.h |? 4 ++--
>>>> ?lib/sbi/sbi_fwft.c???? | 10 +++++++---
>>>> ?2 files changed, 9 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/include/sbi/sbi_fwft.h b/include/sbi/sbi_fwft.h
>>>> index 2148820e..a9caa863 100644
>>>> --- a/include/sbi/sbi_fwft.h
>>>> +++ b/include/sbi/sbi_fwft.h
>>>> @@ -14,9 +14,9 @@
>>>> ?
>>>> ?struct sbi_scratch;
>>>> ?
>>>> -int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
>>>> +int sbi_fwft_set(unsigned long feature, unsigned long value,
>>>> ?		 unsigned long flags);
>>>> -int sbi_fwft_get(enum sbi_fwft_feature_t feature, unsigned long *out_val);
>>>> +int sbi_fwft_get(unsigned long feature, unsigned long *out_val);
>>>> ?
>>>> ?int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot);
>>>> ?
>>>> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
>>>> index c46006d4..85f8a638 100644
>>>> --- a/lib/sbi/sbi_fwft.c
>>>> +++ b/lib/sbi/sbi_fwft.c
>>>> @@ -287,12 +287,16 @@ static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
>>>> ?	return NULL;
>>>> ?}
>>>> ?
>>>> -static int fwft_get_feature(enum sbi_fwft_feature_t feature,
>>>> +static int fwft_get_feature(unsigned long feature,
>>>> ?			??? struct fwft_config **conf)
>>>> ?{
>>>> ?	int ret;
>>>> ?	struct fwft_config *tconf;
>>>> ?
>>>> +	/* Feature are defined as 32 bits identifiers */
>>>> +	if (feature & ~(BIT_ULL(32) - 1))
>>>> +		return SBI_EINVAL;
>>>> +
>>> We can specify the type of enumeration at the time of definition in the 
>>> following way
>>>
>>> enum sbi_fwft_feature_t : long {
>>
>> TIL !:) After searching a bit, it seems like this is only available
>> since C23. Is this something we allow in OpenSBI ?
>>
>> Thanks,
>>
>> Cl?ment
> 
> Add a value to the enumeration
> 
> enum sbi_fwft_feature_t {
> 	......
> 	SBI_FWFT_NOT_USED_ANYWHERE              = -1UL
> };
> 
> The compiler will select the appropriate type to save the -1UL.

I prefer to keep it as is, the enum only contains what is needed, the
interface uses unsigned long and validates them to be passed to other
functions.

Moreover doing so would be wrong regarding to the spec which states that
features are 32 bits identifier. So modifying the feature enum storage
to accommodate the internal interface is wrong.

Regards,

Cl?ment

> 
> Regards,
> Xiang W
>>
>>>
>>> In this way we don't need to change the declaration of the function, 
>>> and we don't need the extra detection of the high 32 bits, because 
>>> get_feature_config would return a null pointer because it couldn't
>>> find the
>>>
>>> Regards,
>>> Xiang W
>>>> ?	tconf = get_feature_config(feature);
>>>> ?	if (!tconf) {
>>>> ?		if (fwft_is_defined_feature(feature))
>>>> @@ -323,7 +327,7 @@ static void fwft_clear_config_lock(enum sbi_fwft_feature_t feature)
>>>> ?	conf->flags &= ~SBI_FWFT_SET_FLAG_LOCK;
>>>> ?}
>>>> ?
>>>> -int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
>>>> +int sbi_fwft_set(unsigned long feature, unsigned long value,
>>>> ?		 unsigned long flags)
>>>> ?{
>>>> ?	int ret;
>>>> @@ -348,7 +352,7 @@ int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
>>>> ?	return SBI_OK;
>>>> ?}
>>>> ?
>>>> -int sbi_fwft_get(enum sbi_fwft_feature_t feature, unsigned long *out_val)
>>>> +int sbi_fwft_get(unsigned long feature, unsigned long *out_val)
>>>> ?{
>>>> ?	int ret;
>>>> ?	struct fwft_config *conf;
>>>
> 


