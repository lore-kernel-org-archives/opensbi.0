From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Wed, 30 Sep 2020 10:45:01 +0200
Subject: OpenSBI: Boot HART ISA display
In-Reply-To: <915a8ca70d5d0ab737d22d6199a9c8ce1b4dd75b.camel@wdc.com>
References: <3e977253-0836-e76f-964b-49b7f2541fde@gmx.de>
 <CAOnJCULFvSArogZzzHLN-QW+2D7nPWh7JcxSUcxMOprnJVK-zQ@mail.gmail.com>
 <46daebe0-4099-c2a6-54ab-0010a0317b3e@gmx.de>
 <CAOnJCUKnY0fLZr6OjD5SWF8Fbk8vCQtWgniJanJrGZtPZW3NnQ@mail.gmail.com>
 <01c4c704e0672a755483ca7124ca691047ffc7b7.camel@wdc.com>
 <915a8ca70d5d0ab737d22d6199a9c8ce1b4dd75b.camel@wdc.com>
Message-ID: <19cc6098-2816-59d6-20b1-c9c19b43354a@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 30.09.20 10:22, Damien Le Moal wrote:
> On Wed, 2020-09-30 at 14:08 +0900, Damien Le Moal wrote:
>> On Tue, 2020-09-29 at 13:38 -0700, Atish Patra wrote:
>>> On Tue, Sep 29, 2020 at 12:38 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>> On 9/29/20 9:05 PM, Atish Patra wrote:
>>>>> On Mon, Sep 28, 2020 at 3:18 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>>>> Hello Atish,
>>>>>>
>>>>>> on the Kendryte 210 MaixDuino the OpenSBI output line
>>>>>>
>>>>>> Boot HART ISA       : rv64cicacsidcacsi
>>>>>>
>>>>>> looks a bit strange to me (see full output at the end of the mail).
>>>>>
>>>>> Yeah. It doesn't make any sense.
>>>>>
>>>>>> Assuming that the characters after rv64 are related to extensions I
>>>>>> would expect every letter appearing only once.
>>>>>>
>>>>>
>>>>> That's correct. See 3.1.1. Machine ISA Register misa in priv spec.
>>>>>
>>>>>> I tried to add sbi_printf() statements to lib/sbi/riscv_asm.c but they
>>>>>> do not print out correctly.
>>>>>>
>>>>>> After the following change:
>>>>>>
>>>>>> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
>>>>>> index 8c54c11..a0c95a2 100644
>>>>>> --- a/lib/sbi/riscv_asm.c
>>>>>> +++ b/lib/sbi/riscv_asm.c
>>>>>> @@ -81,7 +81,7 @@ void misa_string(int xlen, char *out, unsigned int out_sz)
>>>>>>
>>>>>>         for (i = 0; i < array_size(valid_isa_order) && (pos < out_sz);
>>>>>> i++) {
>>>>>>                 if (misa_extension_imp(valid_isa_order[i]))
>>>>>> -                       out[pos++] = valid_isa_order[i];
>>>>>> +                       out[pos++] = '0' + i;
>>>>>>         }
>>>>>>
>>>>>>         if (pos < out_sz)
>>>>>>
>>>>>> the output becomes
>>>>>>
>>>>>> Boot HART ISA       : rv6403567;<@BCDHI
>>>>>>
>>>>>> I am clueless why valid_isa_order[i] is not evaluated correctly.
>>>>>>
>>>>>> When my changes are:
>>>>>>
>>>>>> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
>>>>>> index 8c54c11..b1bbfc4 100644
>>>>>> --- a/lib/sbi/riscv_asm.c
>>>>>> +++ b/lib/sbi/riscv_asm.c
>>>>>> @@ -12,6 +12,8 @@
>>>>>>  #include <sbi/sbi_error.h>
>>>>>>  #include <sbi/sbi_platform.h>
>>>>>>
>>>>>> +static const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";
>>>>>> +
>>>>>>  /* determine CPU extension, return non-zero support */
>>>>>>  int misa_extension_imp(char ext)
>>>>>>  {
>>>>>> @@ -52,7 +54,6 @@ int misa_xlen(void)
>>>>>>  void misa_string(int xlen, char *out, unsigned int out_sz)
>>>>>>  {
>>>>>>         unsigned int i, pos = 0;
>>>>>> -       const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";
>>>>>>
>>>>>>         if (!out)
>>>>>>                 return;
>>>>>>
>>>>>> the output is:
>>>>>>
>>>>>> Boot HART ISA       : rv64imafdcsu
>>>>>>
>>>>>
>>>>> That's odd. Why does declaring valid_isa_order as static solve the issue ?
>>>>>
>>>>> Can you print the "misa" in misa_extension_imp () ?
>>>>> Just a guess: What if misa is not read correctly ?
>>>>
>>>> No matter which values misa_extension_imp() returns we should only see
>>>> extension ID letters in the correct sequence.
>>>>
>>>
>>> You are correct.
>>>
>>>> "rv64cicacsidcacsi" is incorrect for any value of misa.
>>>>
>>>> The interesting thing is that printf statements for strings that I
>>>> placed for debugging in misa_string() did not print correctly. Something
>>>> is going wrong here with strings.
>>>>
>>>
>>> + Damien
>>>
>>> I just remembered Damien was facing a similar issue on Kendryte while
>>> running the test payload where
>>> it would not work if a string is used but worked fine if a single
>>> character is printed in a loop.
>>>
>>> @Damien : Did you figure out the cause for that issue you were seeing?
>>
>> I see lots of problems, not sure if they are related yet:
>> 1) On a clean build, make CROSS_COMPILE=riscv64-linux- PLATFORM=kendryte/k210
>> after a "make clean" or "git clone", the kendryte dts is *not* compiled. If I
>> modify the dts and run make again, then the dts gets compiled but throws out
>> warnings about #address-cells missing. The Kendryte dts is wrong and needs
>> updates. I updated with what I have for Linux which is what u-boot has too,
>> simplified, and still gets warnings while there are none on kernel compiles.
>> Since Kendryte is generic platform now, this may impact how initialization is
>> done.
>> 2) I see the same problem as Heinrich with the misa string: garbage is output.
>> As a little experiment, I made this change:
>>
>> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
>> index 8c54c11..195b56b 100644
>> --- a/lib/sbi/riscv_asm.c
>> +++ b/lib/sbi/riscv_asm.c
>> @@ -11,6 +11,7 @@
>>  #include <sbi/riscv_encoding.h>
>>  #include <sbi/sbi_error.h>
>>  #include <sbi/sbi_platform.h>
>> +#include <sbi/sbi_string.h>
>>
>>  /* determine CPU extension, return non-zero support */
>>  int misa_extension_imp(char ext)
>> @@ -52,7 +53,7 @@ int misa_xlen(void)
>>  void misa_string(int xlen, char *out, unsigned int out_sz)
>>  {
>>         unsigned int i, pos = 0;
>> -       const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";
>> +       const char *valid_isa_order = "iemafdqclbjtpvnsuhkorwxyzg";
>>
>>         if (!out)
>>                 return;
>> @@ -79,10 +80,8 @@ void misa_string(int xlen, char *out, unsigned int out_sz)
>>                 }
>>         }
>>
>> -       for (i = 0; i < array_size(valid_isa_order) && (pos < out_sz); i++) {
>> -               if (misa_extension_imp(valid_isa_order[i]))
>> -                       out[pos++] = valid_isa_order[i];
>> -       }
>> +       for (i = 0; i < sbi_strlen(valid_isa_order) && (pos < out_sz); i++)
>> +               out[pos++] = valid_isa_order[i];
>>
>>         if (pos < out_sz)
>>                 out[pos++] = '\0';
>>
>> so that all valid_isa_order characters are printed. And I get:
>>
>> Boot HART ISA       : rv64terrupt-controller
>>
>> Which looks like a piece of the dts...
>>
>> So, I think we have a build/linking/loading problem on our hands. Memory
>> corruption of data basically. That also likely explain why there is no string
>> output from the test payload but I do get single character outputs if I do
>> them.
>>
>> I tried changing the misa_string() code in different ways and each one gives a
>> different garbage but always the same garbage (rebooting several time gives the
>> same). So it looks like linking or loading problem.
>>
>> And the dts compilation needs addressing too:
>> 1) Erratic dtb build
>> 2) wrong error messages on dtb compilation
>>
>> Need to go back to linux-scsi for some patching. Will try to look into this
>> later if I have time. Anyone, feel free to tackle this !
>
> Playing again with this, I tried removing the embedded dtb for kendryte. And as
> expected, the misa_string becomes correct. Clearly, the embedded dtb is the
> root cause. It is overwriting data/bss. Still no output from test payload
> though.
>
> Looking at fw_base.S, I see the call to fw_platform_init that gets the address
> of the embedded dtb, but not sure if there is a relocation going on. If there
> is, the dtb size symbol (dt_k210_size) is unused. Without it, I do not see how
> relocation can work correctly.
>
> Assembler not being my thing, if someone can have a look...

git bisect point to my patch

d7f87d99a33b71b20af527c62e7ef95dcb61ee22
platform: kendryte/k210: fixup FDT

Where in the code is the memory allocated allowing for the FDT fixups?

Best regards

Heinrich


>
> Cheers.
>
>>
>>
>>>> It might be that some function is overwriting the area where the strings
>>>> are stored, e.g via the stack.
>>>>
>>>> Best regards
>>>>
>>>> Heinrich
>>>>
>>>>>> I disassembled build/lib/sbi/riscv_asm.o but could not find a problem.
>>>>>>
>>>>>> Do you have a suggestion how to analyze this further?
>>>>>>
>>>>>> Best regards
>>>>>>
>>>>>> Heinrich
>>>>>>
>>>>>>
>>>>>>
>>>>>> OpenSBI v0.8-29-g7701ea1
>>>>>>    ____                    _____ ____ _____
>>>>>>   / __ \                  / ____|  _ \_   _|
>>>>>>  | |  | |_ __   ___ _ __ | (___ | |_) || |
>>>>>>  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>>>>>>  | |__| | |_) |  __/ | | |____) | |_) || |_
>>>>>>   \____/| .__/ \___|_| |_|_____/|____/_____|
>>>>>>         | |
>>>>>>         |_|
>>>>>>
>>>>>> Platform Name       : Kendryte K210
>>>>>> Platform Features   : timer
>>>>>> Platform HART Count : 2
>>>>>> Boot HART ID        : 0
>>>>>> Boot HART ISA       : rv64cicacsidcacsi
>>>>>> BOOT HART Features  : none
>>>>>> BOOT HART PMP Count : 0
>>>>>> BOOT HART MHPM Count: 0
>>>>>> Firmware Base       : 0x80000000
>>>>>> Firmware Size       : 100 KB
>>>>>> Runtime SBI Version : 0.2
>>>>>>
>>>>>> MIDELEG : 0x0000000000000222
>>>>>> MEDELEG : 0x0000000000000109
>>>>>>
>>>>>>
>>>>>> --
>>>>>> opensbi mailing list
>>>>>> opensbi at lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/opensbi
>


