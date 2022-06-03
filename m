From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 3 Jun 2022 09:23:16 +0200
Subject: [RISC-V] [tech-unixplatformspec] SBI Debug Console Extension
 Proposal (Draft v1)
In-Reply-To: <CAHBxVyEDR-16-nEd0rRCvegfAxPf2xSMB6HZpe3269GjmVUzQw@mail.gmail.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
 <72af98ee-6bb4-542f-021d-66e9dd946226@canonical.com>
 <CAK9=C2WLZqkYsgZL5WCJGjWGK=YGV3f51d8yvD3ecx+JPURgpw@mail.gmail.com>
 <307d7e4e-62f8-8dec-8b09-ea69ca2c29d9@canonical.com>
 <CAHBxVyEDR-16-nEd0rRCvegfAxPf2xSMB6HZpe3269GjmVUzQw@mail.gmail.com>
Message-ID: <16ce4a1f-9a88-de85-d1d1-05cc5a542366@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/3/22 08:56, Atish Kumar Patra wrote:
> On Thu, Jun 2, 2022 at 2:13 AM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> On 6/2/22 10:44, Anup Patel wrote:
>>> On Wed, Jun 1, 2022 at 11:59 PM Heinrich Schuchardt
>>> <heinrich.schuchardt@canonical.com> wrote:
>>>>
>>>> On 6/1/22 18:17, Anup Patel wrote:
>>>>> Hi All,
>>>>>
>>>>> Below is the draft proposal for SBI Debug Console Extension.
>>>>>
>>>>> Please review it and provide feedback.
>>>>>
>>>>> Thanks,
>>>>> Anup
>>>>>
>>>>> Debug Console Extension (EID #0x4442434E "DBCN")
>>>>> ================================================
>>>>>
>>>>> The debug console extension defines a generic mechanism for boot-time
>>>>> early prints from supervisor-mode software which allows users to catch
>>>>> boot-time issues in supervisor-mode software.
>>>>>
>>>>> This extension replaces legacy console putchar (EID #0x01) extension
>>>>> and it is better in following ways:
>>>>
>>>> Thanks for starting to close this gap.
>>>>
>>>>> 1) It follows the new calling convention defined for SBI v1.0
>>>>>       (or higher).
>>>>> 2) It is based on a shared memory area between SBI implementation
>>>>>       and supervisor-mode software so multiple characters can be
>>>>>       printed using a single SBI call.
>>>>
>>>> I miss a discussion of the conflicts that can arise if the configuration
>>>> of the serial console is changed by the caller.
>>>>
>>>> Do we need an ecall that closes the SBI console to further access?
>>>
>>> Usually, the serial port related code in M-mode firmware only uses
>>> status and data registers so for most serial ports support the M-mode
>>> firmware will adapt to serial port configuration changes.
>>>
>>> In fact, this is why we never had a special SBI call for serial port
>>> reconfiguration in legacy SBI v0.1 as well.
>>>
>>> In case of virtualization, the serial port (or console) is emulated so
>>> the special SBI call is not useful for virtualization.
>>>
>>>>
>>>>>
>>>>> The supervisor-mode software must set the shared memory area before
>>>>> printing characters on the debug console. Also, all HARTs share the
>>>>> same shared memory area so only one HART needs to set it at boot-time.
>>>>
>>>> Isn't it M-mode software that has to program the MMU to allow all harts
>>>> in M-mode and S-mode access to the memory area? What is the S-mode
>>>> software to do about the memory area prior to calling
>>>> sbi_debug_console_set_area()?
>>>
>>> Actually, it's the S-mode software which is voluntarily giving a portion of
>>> its memory to be used as shared memory. The proposal only mandates
>>> that whatever memory is selected by S-mode software should be a
>>> regular cacheable memory (not IO memory). Also, if Svpbmt is available
>>> then S-mode software should only use memory type 0 in the PTEs.
>>>
>>>>
>>>>>
>>>>> Function: Set Console Area (FID #0)
>>>>> -----------------------------------
>>>>>
>>>>> struct sbiret sbi_debug_console_set_area(unsigned long addr_div_by_4,
>>>>>                                             unsigned long size)
>>>>
>>>> The console output is needed on the very start of the S-mode software,
>>>> before setting up anything.
>>>>
>>>> Can we avoid this extra function?
>>>>
>>>> Can we simply assume that the caller of sbi_debug_console_puts()
>>>> provides a physical address pointer to a memory area that is suitable?
>>>
>>> Theoretically, we can avoid the extra function to set shared memory area
>>> but it will complicate things in future when we have supervisor software
>>> encrypting it's own memory (using special ISA support) because in this
>>> case supervisor software will have to unprotect memory every time the
>>> sbi_debug_console_puts() is called and protect it again after the call.
>>
>> Currently this function is just a nop(). It is not needed in this
>> revision of the extension.
>>
>> The function might be called repeatedly by different threads with
>> different values. How do you want to keep track of all of these
>> different areas?
>>
>> Memory shared between different security realms will arise in many
>> different scenarios. As this is not console specific it should be in a
>> separate extension. That extension should be defined once we have
>> clarity about how security realms are managed.
>>
> 
> I would like to understand more about the security concerns you raised.
> Can you please elaborate on this ?

I have no security concerns. My thought was that it might be better to 
manage shared memory in a separate extension for all use cases.

Best regards

Heinrich

> 
> As you pointed out, there are other possible use cases(e.g STA, PMU)
> for shared memory between
> S & M mode or VS & HS mode. It would be good to address these concerns right now
> instead of discussing those in each individual extension context.
> 
>>>
>>>>
>>>>>
>>>>> Set the shared memory area specified by `addr_div_by_2` and `size`
>>>>
>>>> %s/addr_div_by_2/addr_div_by_4/
>>>
>>> Okay, I will update.
>>>
>>>>
>>>>> parameters. The `addr_div_by_4` parameter is base address of the
>>>>
>>>> %s/is base/is the base/
>>>
>>> Okay, I will update.
>>>
>>>>
>>>>> shared memory area right shifted by 2 whereas `size` parameter is
>>>>> the size of shared memory area in bytes.
>>>>
>>>> Why shifting the address? I would prefer to keep it simple for the
>>>> caller. If the alignment is not suitable, return an error.
>>>>
>>>> But why is an alignment needed here at all? And why 4 aligned?
>>>
>>> For RV32 S-mode, the physical address space is 34bits wide but
>>> "unsigned long" is 32bits wide. This is because Sv32 PTEs allow
>>> 34bits of PPN. In fact, even instructions such as HFENCE.GVMA
>>> have this "address right shift by 2" requirement based on this rationale.
>>>
>>>>
>>>>>
>>>>> The shared memory area should be normal cacheable memory for the
>>>>> supervisor-mode software. Also, the shared memory area is global
>>>>> across all HARTs so SBI implementation must ensure atomicity in
>>>>> setting the shared memory area.
>>>>>
>>>>> Errors:
>>>>> SBI_SUCCESS                - Shared memory area set successfully.
>>>>> SBI_ERR_INVALID_ADDRESS - The shared memory area pointed by
>>>>>                              `addr_div_by_2` and `size` parameters
>>>>>                              is not normal cacheable memory or not
>>>>>                              accessible to supervisor-mode software.
>>>>>
>>>>> Function: Console Puts (FID #1)
>>>>> -------------------------------
>>>>>
>>>>> struct sbiret sbi_debug_console_puts(unsigned long area_offset,
>>>>>                                         unsigned long num_chars)
>>>>
>>>> I would prefer to simply pass a physical address pointer here with no
>>>> requirements on alignment. And no prior SBI call.
>>
>> sbi_debug_console_set_area() might be called with different values by
>> different threads. An offset is ambiguous as it does not define to which
>> of the different shared areas it relates. Please, use a pointer.
>>
>>>>
>>>> Do we need num_chars? Are we expecting to provide binary output? Using
>>>> 0x00 as terminator would be adequate in most cases.
>>>
>>> Bare-metal tests (or assembly sources) can print sub-strings from
>>> a large per-populated string in shared memory. Assuming that string
>>> is always terminated by 0x00 in sbi_debug_console_puts() will break
>>> this flexibility.
>>
>> OK
>>
>>>
>>>>
>>>> What is the requirement on the console? Does it have to support 8bit
>>>> output to allow for UTF-8?
>>>
>>> We need to clarify this. Suggestions ?
>>
>> The platform specification would be the right place to require 8-bit
>> support for the console.
>>
>>>
>>>>
>>>> Do we make any assumptions about encoding?
>>>
>>> Same as above, this needs more clarification. Suggestions ?
>>
>> We should add to the platform specification that UTF-8 output is assumed
>> on the serial console.
>>
>>>
>>> I am of the opinion to keep such encoding related assumptions to be
>>> minimal.
>>>
>>>>
>>>> How would we handle a console set up to 7bit + parity if a character >
>>>> 0x7f is sent?
>>>
>>> I would consider this to be part of the clarification we add for encoding.
>>
>> We should state if extra bits are ignored or the bytes are not send.
>> The easiest thing is to just ignore the extra bits. So let't state this
>> here.
>>
>> Best regards
>>
>> Heinrich
>>
>>>
>>>>
>>>>>
>>>>> Print the string specified by `area_offset` and `num_chars` on
>>>>> the debug console. The `area_offset` parameter is the start of
>>>>> string in the shard memory area whereas `num_chars` parameter
>>>>
>>>> %s/shard/shared/
>>>
>>> Okay, I will update.
>>>
>>>>
>>>>> is the number of characters (or bytes) in the string.
>>>>>
>>>>> This is a blocking SBI call and will only return after printing
>>>>> all characters of the string.
>>>>>
>>>>> Errors:
>>>>> SBI_SUCCESS                - Characters printed successfully.
>>>>> SBI_ERR_INVALID_ADDRESS    - The start of the string (i.e.
>>>>>                              `area_offset`) or end of the string
>>>>>                              (i.e. `area_offset + num_chars`) is
>>>>>                              outside shared memory area.
>>>>
>>>> There could be other reasons of failures:
>>>>
>>>> * set up of the UART failed in OpenSBI
>>>> * no UART defined in the device-tree
>>>> * ...
>>>>
>>>> So let us add SBI_ERR_FAILED to the list.
>>>
>>> Okay, I will add.
>>>
>>>>
>>>> Best regards
>>>>
>>>> Heinrich
>>>
>>> Regards,
>>> Anup
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#1717): https://lists.riscv.org/g/tech-unixplatformspec/message/1717
>> Mute This Topic: https://lists.riscv.org/mt/91480122/1774178
>> Group Owner: tech-unixplatformspec+owner at lists.riscv.org
>> Unsubscribe: https://lists.riscv.org/g/tech-unixplatformspec/unsub [atishp at rivosinc.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>


