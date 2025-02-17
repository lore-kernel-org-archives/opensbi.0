From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 17 Feb 2025 15:35:35 +0100
Subject: [PATCH] lib: sbi: sse: return SBI_EINVAL for parameters > 32 bits
In-Reply-To: <CAAhSdy0eHr_kJsor6L+EC4NYv6v0GrQALBOmUL+8gvJgF9t_5w@mail.gmail.com>
References: <20250214120445.1106042-1-cleger@rivosinc.com>
 <CAAhSdy23hMfbn_A5Xn__KiYzhqE1=-RDbv2Kwj9gt8y-MipycQ@mail.gmail.com>
 <74d5d1ce-5530-44a9-a085-31aebbcd177b@rivosinc.com>
 <CAAhSdy1WGPOdfqgf0GCex-fOnWyf9PDv0JWrYZFBrc3m6H8Fvw@mail.gmail.com>
 <8c39f947-00ae-4f3b-ba73-1b195f2f7b52@rivosinc.com>
 <CAAhSdy0eHr_kJsor6L+EC4NYv6v0GrQALBOmUL+8gvJgF9t_5w@mail.gmail.com>
Message-ID: <ef682364-0242-4ad9-8ce7-f007746f2c99@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 17/02/2025 11:56, Anup Patel wrote:
> On Mon, Feb 17, 2025 at 1:57?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>
>>
>>
>> On 17/02/2025 05:20, Anup Patel wrote:
>>> On Fri, Feb 14, 2025 at 6:25?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 14/02/2025 13:38, Anup Patel wrote:
>>>>> On Fri, Feb 14, 2025 at 5:35?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>>>>>
>>>>>> The SBI specification states that event id, attributes and attributes
>>>>>> count are stored on 32 bits. In order to check them properly, pass
>>>>>> unsigned long to the SSE interface and check these parameters to be
>>>>>> within correct bounds.
>>>>>
>>>>> I think it is much simpler to do this check in sbi_ecall_sse_handler() itself.
>>>>
>>>> Yeah I thought of that option but keeping all the checks at the same
>>>> place sound better to me. If you really want these checks in
>>>> sbi_ecall_sse.c, then I'll move them though.
>>>
>>> The downside of this patch is that various sbi_sse_xyz() function
>>> prototypes don't align with the prototypes in SBI spec. Personally,
>>> I am leaning towards keeping the uint32_t check in sbi_ecall_sse_handler()
>>> but if you like the current approach then we will go ahead with this
>>> patch.
>>
>> That a good point, I'll modify it then. I could do the sdame thing as
>> well for fwft.
> 
> No need to return an error when event_id is wider than 32bits because we
> have the following text in the "chapter 3. Binary encoding":
> 
> "Every SBI function should prefer unsigned long as the data type. It keeps
> the specification simple and easily adaptable for all RISC-V ISA types. In case
> the data is defined as 32bit wide, higher privilege software must ensure that
> it only uses 32 bit data. Parameters that are 2?XLEN bits wide are passed in
> a pair of argument registers, with the low-order XLEN bits in the lower-numbered
> register and the high-order XLEN bits in the higher-numbered register."
> 
> We only need to ensure that OpenSBI uses lower 32bits of wider event_id.

Ok thanks, missed that part of the spec.

Regards,

Cl?ment

> 
> Regards,
> Anup
> 
>>
>> Thanks,
>>
>> Cl?ment
>>
>>>
>>> Regards,
>>> Anup
>>>
>>>>
>>>> Regards,
>>>>
>>>> Cl?ment
>>>>
>>>>>
>>>>> Regards,
>>>>> Anup
>>>>>
>>>>>>
>>>>>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>>>>>> ---
>>>>>>  include/sbi/sbi_sse.h   | 18 +++++++++---------
>>>>>>  include/sbi/sbi_types.h |  2 ++
>>>>>>  lib/sbi/sbi_sse.c       | 30 +++++++++++++++++-------------
>>>>>>  3 files changed, 28 insertions(+), 22 deletions(-)
>>>>>>
>>>>>> diff --git a/include/sbi/sbi_sse.h b/include/sbi/sbi_sse.h
>>>>>> index fb796545..21084c5c 100644
>>>>>> --- a/include/sbi/sbi_sse.h
>>>>>> +++ b/include/sbi/sbi_sse.h
>>>>>> @@ -75,21 +75,21 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot);
>>>>>>  void sbi_sse_exit(struct sbi_scratch *scratch);
>>>>>>
>>>>>>  /* Interface called from sbi_ecall_sse.c */
>>>>>> -int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
>>>>>> +int sbi_sse_register(unsigned long event_id, unsigned long handler_entry_pc,
>>>>>>                      unsigned long handler_entry_arg);
>>>>>> -int sbi_sse_unregister(uint32_t event_id);
>>>>>> +int sbi_sse_unregister(unsigned long event_id);
>>>>>>  int sbi_sse_hart_mask(void);
>>>>>>  int sbi_sse_hart_unmask(void);
>>>>>> -int sbi_sse_enable(uint32_t event_id);
>>>>>> -int sbi_sse_disable(uint32_t event_id);
>>>>>> +int sbi_sse_enable(unsigned long event_id);
>>>>>> +int sbi_sse_disable(unsigned long event_id);
>>>>>>  int sbi_sse_complete(struct sbi_trap_regs *regs, struct sbi_ecall_return *out);
>>>>>> -int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hart_id,
>>>>>> +int sbi_sse_inject_from_ecall(unsigned long event_id, unsigned long hart_id,
>>>>>>                               struct sbi_ecall_return *out);
>>>>>> -int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
>>>>>> -                      uint32_t attr_count, unsigned long output_phys_lo,
>>>>>> +int sbi_sse_read_attrs(unsigned long event_id, unsigned long base_attr_id,
>>>>>> +                      unsigned long attr_count, unsigned long output_phys_lo,
>>>>>>                        unsigned long output_phys_hi);
>>>>>> -int sbi_sse_write_attrs(uint32_t event_id, uint32_t base_attr_id,
>>>>>> -                       uint32_t attr_count, unsigned long input_phys_lo,
>>>>>> +int sbi_sse_write_attrs(unsigned long event_id, unsigned long base_attr_id,
>>>>>> +                       unsigned long attr_count, unsigned long input_phys_lo,
>>>>>>                         unsigned long input_phys_hi);
>>>>>>
>>>>>>  #endif
>>>>>> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
>>>>>> index 90b0d458..efcde21f 100644
>>>>>> --- a/include/sbi/sbi_types.h
>>>>>> +++ b/include/sbi/sbi_types.h
>>>>>> @@ -108,6 +108,8 @@ typedef uint64_t            be64_t;
>>>>>>  #define ROUNDUP(a, b) ((((a)-1) / (b) + 1) * (b))
>>>>>>  #define ROUNDDOWN(a, b) ((a) / (b) * (b))
>>>>>>
>>>>>> +#define fits_on_32_bits(value) (((value) & ~(BIT_ULL(32) - 1)) == 0)
>>>>>> +
>>>>>>  /* clang-format on */
>>>>>>
>>>>>>  #else
>>>>>> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
>>>>>> index 9f22375f..5e8e9ab4 100644
>>>>>> --- a/lib/sbi/sbi_sse.c
>>>>>> +++ b/lib/sbi/sbi_sse.c
>>>>>> @@ -291,12 +291,15 @@ static void sse_event_set_state(struct sbi_sse_event *e,
>>>>>>         e->attrs.status |= new_state;
>>>>>>  }
>>>>>>
>>>>>> -static int sse_event_get(uint32_t event_id, struct sbi_sse_event **eret)
>>>>>> +static int sse_event_get(unsigned long event_id, struct sbi_sse_event **eret)
>>>>>>  {
>>>>>>         unsigned int i;
>>>>>>         struct sbi_sse_event *e;
>>>>>>         struct sse_hart_state *shs;
>>>>>>
>>>>>> +       if (!fits_on_32_bits(event_id))
>>>>>> +               return SBI_EINVAL;
>>>>>> +
>>>>>>         if (!eret)
>>>>>>                 return SBI_EINVAL;
>>>>>>
>>>>>> @@ -748,7 +751,7 @@ static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id)
>>>>>>         return SBI_OK;
>>>>>>  }
>>>>>>
>>>>>> -static int sse_inject_event(uint32_t event_id, unsigned long hartid)
>>>>>> +static int sse_inject_event(unsigned long event_id, unsigned long hartid)
>>>>>>  {
>>>>>>         int ret;
>>>>>>         struct sbi_sse_event *e;
>>>>>> @@ -839,7 +842,7 @@ int sbi_sse_complete(struct sbi_trap_regs *regs, struct sbi_ecall_return *out)
>>>>>>         return ret;
>>>>>>  }
>>>>>>
>>>>>> -int sbi_sse_enable(uint32_t event_id)
>>>>>> +int sbi_sse_enable(unsigned long event_id)
>>>>>>  {
>>>>>>         int ret;
>>>>>>         struct sbi_sse_event *e;
>>>>>> @@ -856,7 +859,7 @@ int sbi_sse_enable(uint32_t event_id)
>>>>>>         return ret;
>>>>>>  }
>>>>>>
>>>>>> -int sbi_sse_disable(uint32_t event_id)
>>>>>> +int sbi_sse_disable(unsigned long event_id)
>>>>>>  {
>>>>>>         int ret;
>>>>>>         struct sbi_sse_event *e;
>>>>>> @@ -904,7 +907,7 @@ int sbi_sse_hart_unmask(void)
>>>>>>         return SBI_SUCCESS;
>>>>>>  }
>>>>>>
>>>>>> -int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hartid,
>>>>>> +int sbi_sse_inject_from_ecall(unsigned long event_id, unsigned long hartid,
>>>>>>                               struct sbi_ecall_return *out)
>>>>>>  {
>>>>>>         if (!sbi_domain_is_assigned_hart(sbi_domain_thishart_ptr(),
>>>>>> @@ -943,14 +946,15 @@ int sbi_sse_add_event(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
>>>>>>         return SBI_OK;
>>>>>>  }
>>>>>>
>>>>>> -int sbi_sse_attr_check(uint32_t base_attr_id, uint32_t attr_count,
>>>>>> +int sbi_sse_attr_check(unsigned long base_attr_id, unsigned long attr_count,
>>>>>>                        unsigned long phys_lo, unsigned long phys_hi,
>>>>>>                        unsigned long access)
>>>>>>  {
>>>>>>         const unsigned align = __riscv_xlen >> 3;
>>>>>>         uint64_t end_id = (uint64_t)base_attr_id + (attr_count - 1);
>>>>>>
>>>>>> -       if (attr_count == 0)
>>>>>> +       if (attr_count == 0 || !fits_on_32_bits(base_attr_id) ||
>>>>>> +           !fits_on_32_bits(attr_count))
>>>>>>                 return SBI_ERR_INVALID_PARAM;
>>>>>>
>>>>>>         if (end_id >= SBI_SSE_ATTR_MAX)
>>>>>> @@ -992,8 +996,8 @@ static void copy_attrs(unsigned long *out, const unsigned long *in,
>>>>>>                 out[i] = in[i];
>>>>>>  }
>>>>>>
>>>>>> -int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
>>>>>> -                      uint32_t attr_count, unsigned long output_phys_lo,
>>>>>> +int sbi_sse_read_attrs(unsigned long event_id, unsigned long base_attr_id,
>>>>>> +                      unsigned long attr_count, unsigned long output_phys_lo,
>>>>>>                        unsigned long output_phys_hi)
>>>>>>  {
>>>>>>         int ret;
>>>>>> @@ -1059,8 +1063,8 @@ out:
>>>>>>         return ret;
>>>>>>  }
>>>>>>
>>>>>> -int sbi_sse_write_attrs(uint32_t event_id, uint32_t base_attr_id,
>>>>>> -                       uint32_t attr_count, unsigned long input_phys_lo,
>>>>>> +int sbi_sse_write_attrs(unsigned long event_id, unsigned long base_attr_id,
>>>>>> +                       unsigned long attr_count, unsigned long input_phys_lo,
>>>>>>                         unsigned long input_phys_hi)
>>>>>>  {
>>>>>>         int ret = 0;
>>>>>> @@ -1081,7 +1085,7 @@ int sbi_sse_write_attrs(uint32_t event_id, uint32_t base_attr_id,
>>>>>>         return ret;
>>>>>>  }
>>>>>>
>>>>>> -int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
>>>>>> +int sbi_sse_register(unsigned long event_id, unsigned long handler_entry_pc,
>>>>>>                      unsigned long handler_entry_arg)
>>>>>>  {
>>>>>>         int ret;
>>>>>> @@ -1106,7 +1110,7 @@ int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
>>>>>>         return ret;
>>>>>>  }
>>>>>>
>>>>>> -int sbi_sse_unregister(uint32_t event_id)
>>>>>> +int sbi_sse_unregister(unsigned long event_id)
>>>>>>  {
>>>>>>         int ret;
>>>>>>         struct sbi_sse_event *e;
>>>>>> --
>>>>>> 2.47.2
>>>>>>
>>>>>>
>>>>>> --
>>>>>> opensbi mailing list
>>>>>> opensbi at lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/opensbi
>>>>
>>


