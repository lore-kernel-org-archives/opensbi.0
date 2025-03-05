From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 4 Mar 2025 20:01:39 -0600
Subject: [PATCH v3] New configuration CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT
In-Reply-To: <CA+-5cKft3U5CSvje47tcqkRdQMAU1kYxYeKUdSRA+E0ZTW7sVg@mail.gmail.com>
References: <20250115234607.410148-1-Raj.Vishwanathan@gmail.com>
 <20250127202017.1043240-1-Raj.Vishwanathan@gmail.com>
 <CAK9=C2XT1HGr+wih9YJ=vgXnxrgPrFH1JKHpS=wp4miOAnPo+A@mail.gmail.com>
 <CA+-5cKft3U5CSvje47tcqkRdQMAU1kYxYeKUdSRA+E0ZTW7sVg@mail.gmail.com>
Message-ID: <7ad7f8cf-e89c-4ed2-8671-3c3b36a0593e@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Raj,

On 2025-03-04 6:31 PM, Raj Vishwanathan wrote:
> Hi Anup
> 
> I have been reviewing your suggestions, and I am a bit confused by them.
> 
> ---------------------- Snipped to retain only the relevant bits
> --------------------------
>  The scratch allocation happens too early in the boot to get the
> platform override  return values (from parsing the device tree.)

Overrides for the generic platform happen in fw_platform_init(), which is called
before scratch space is set up. This function also already has logic to parse
properties of harts from the devicetree, so it is a good place to put your new
override logic.

> The other issue is that riscv,cbom-block-size is a per-hart value and
> testing all kinds of combinations may become unnecessarily
> complicated.

If the goal is to have each allocation in a separate cache line, then you always
want the maximum value across all harts, right?

> If the general configuration value is not acceptable, I can move the
> configuration to a platform specific configuration.

As Anup said, we want to avoid build-time configuration as much as possible, so
a single OpenSBI binary can run on the widest variety of platforms. So a runtime
override is the best way to go, even if it requires some refactoring.

Regards,
Samuel

> Let me know your thoughts
> 
> 
> On Mon, Feb 10, 2025 at 8:45?PM Anup Patel <apatel@ventanamicro.com> wrote:
> 
>> Introducing a kconfig option is not going to fly since we have to
>> re-compile separately for platforms while we are trying our best
>> to support the same firmware binary for multiple platforms.
>>
>> Instead, I suggest the following:
>> 1) The default scratch allocation alignment can be __SIZEOF_POINTER__
>> 2) Introduce get_cache_line_size() operation in "struct sbi_platform_operations"
>>     which platforms can use to return desired "cache line size for allocations".
>> 3) For generic platform, the get_cache_line_size() return value can be based
>>     on the "riscv,cbom-block-size" property of CPU DT nodes OR based on
>>     platform_overrride.
>> 4) The sbi_scratch_init() should sanity check the value returned by platform
>>      get_cache_line_size() before using it as minimum allocation size for
>>      scratch allocations.
>>
>> Regards,
>> Anup
>>
>>
>>>  endmenu
>>> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
>>> index ccbbc68..0f1be58 100644
>>> --- a/lib/sbi/sbi_scratch.c
>>> +++ b/lib/sbi/sbi_scratch.c
>>> @@ -14,6 +14,16 @@
>>>  #include <sbi/sbi_scratch.h>
>>>  #include <sbi/sbi_string.h>
>>>
>>> +/*
>>> + * We do the scratch allocation on the basis of a user configuration.
>>> + */
>>> +#if !defined(CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT) || (CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT==0)
>>> +#define SCRATCH_ALLOC_ALIGNMENT __SIZEOF_POINTER__
>>> +#else
>>> +#define SCRATCH_ALLOC_ALIGNMENT CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT
>>> +#endif
>>> +
>>> +
>>>  u32 last_hartindex_having_scratch = 0;
>>>  u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
>>>  struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
>>> @@ -70,8 +80,8 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
>>>         if (!size)
>>>                 return 0;
>>>
>>> -       size += __SIZEOF_POINTER__ - 1;
>>> -       size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
>>> +       size += SCRATCH_ALLOC_ALIGNMENT- 1;
>>> +       size &= ~((unsigned long)SCRATCH_ALLOC_ALIGNMENT - 1);
>>>
>>>         spin_lock(&extra_lock);
>>>
>>> --
>>> 2.43.0
>>>
>>>
>>> --
>>> opensbi mailing list
>>> opensbi at lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/opensbi
> 


