From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sat, 10 Jul 2021 19:34:04 +0100
Subject: [PATCH v4 3/5] firmware: Explicitly pass -pie to the linker, not
 just the driver
In-Reply-To: <fc4911e90817a414ae990e00935f4c9956a2c466.camel@126.com>
References: <20210709193423.29712-1-jrtc27@jrtc27.com>
 <20210709193423.29712-4-jrtc27@jrtc27.com>
 <CAEUhbmVDAY8Puuro=m+nVBhR8pbXPYgB-1PHjEd3tKGvNCB03w@mail.gmail.com>
 <CAEUhbmWJafiTvJzMb1xo=6_7UFEToJDUwytTFBmiRXzVfZ8YPA@mail.gmail.com>
 <CAAhSdy12gSm9ZJktj4ZUskTOoGVAJ8xdqANkU3ci2q8_mstVnw@mail.gmail.com>
 <CAEUhbmXWJmkGqrHR31qZUYQBpD4qE8WFmKSZa20T_5_DUR0x7w@mail.gmail.com>
 <CAAhSdy0amqzkzWVSmMitPO18OzZ62MeX8rHqM=OjCX-L_cTH6w@mail.gmail.com>
 <CAEUhbmVq3RvoODpThpVE4OrrvaRnETsCoM6fcVG+NUriO4s_pQ@mail.gmail.com>
 <CAAhSdy0idH74dSeEw2P+MfQU=TDwpYN6VNhZYLO5=GGwd_8xSg@mail.gmail.com>
 <fabaeba32875baacbf86635a145564d98f4822fe.camel@126.com>
 <A567F574-6592-43A1-989D-E209D7B1BD0E@jrtc27.com>
 <fc4911e90817a414ae990e00935f4c9956a2c466.camel@126.com>
Message-ID: <EEC7C89B-B11A-4D57-A241-468E7AA5E4C3@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10 Jul 2021, at 19:27, Xiang W <wxjstz@126.com> wrote:
> 
> ? 2021-07-10???? 19:10 +0100?Jessica Clarke???
>> On 10 Jul 2021, at 19:07, Xiang W <wxjstz@126.com> wrote:
>>> 
>>> ? 2021-07-10???? 20:26 +0530?Anup Patel???
>>>> On Sat, Jul 10, 2021 at 7:13 PM Bin Meng <bmeng.cn@gmail.com>
>>>> wrote:
>>>>> 
>>>>> On Sat, Jul 10, 2021 at 9:38 PM Anup Patel
>>>>> <anup@brainfault.org>
>>>>> wrote:
>>>>>> 
>>>>>> On Sat, Jul 10, 2021 at 6:13 PM Bin Meng <bmeng.cn@gmail.com>
>>>>>> wrote:
>>>>>>> 
>>>>>>> Hi Anup,
>>>>>>> 
>>>>>>> On Sat, Jul 10, 2021 at 6:42 PM Anup Patel
>>>>>>> <anup@brainfault.org> wrote:
>>>>>>>> 
>>>>>>>> Hi Bin,
>>>>>>>> 
>>>>>>>> On Sat, Jul 10, 2021 at 2:23 PM Bin Meng <
>>>>>>>> bmeng.cn at gmail.com>
>>>>>>>> wrote:
>>>>>>>>> 
>>>>>>>>> On Sat, Jul 10, 2021 at 10:56 AM Bin Meng <
>>>>>>>>> bmeng.cn at gmail.com> wrote:
>>>>>>>>>> 
>>>>>>>>>> On Sat, Jul 10, 2021 at 3:35 AM Jessica Clarke <
>>>>>>>>>> jrtc27 at jrtc27.com> wrote:
>>>>>>>>>>> 
>>>>>>>>>>> When using Clang with a bare-metal triple, -pie
>>>>>>>>>>> does
>>>>>>>>>>> not get passed to
>>>>>>>>>>> the linker as it's not normally a thing that makes
>>>>>>>>>>> sense. However, in
>>>>>>>>>>> our case it is, and manually forwarding it on works
>>>>>>>>>>> as
>>>>>>>>>>> desired, so do so
>>>>>>>>>>> to fully support FW_PIC with Clang, including when
>>>>>>>>>>> linking with LLD.
>>>>>>>>>>> ---
>>>>>>>>>>>  firmware/objects.mk | 2 +-
>>>>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>>>> 
>>>>>>>>>>> diff --git a/firmware/objects.mk
>>>>>>>>>>> b/firmware/objects.mk
>>>>>>>>>>> index ce91c2f..3bc83cd 100644
>>>>>>>>>>> --- a/firmware/objects.mk
>>>>>>>>>>> +++ b/firmware/objects.mk
>>>>>>>>>>> @@ -21,7 +21,7 @@ ifeq ($(FW_PIC),y)
>>>>>>>>>>>  firmware-genflags-y += -DFW_PIC
>>>>>>>>>>>  firmware-asflags-y  += -fpic
>>>>>>>>>>>  firmware-cflags-y   += -fPIE -pie
>>>>>>>>>>> -firmware-ldflags-y  +=  -Wl,--no-dynamic-linker
>>>>>>>>>>> +firmware-ldflags-y  +=  -Wl,--no-dynamic-linker -
>>>>>>>>>>> Wl,-
>>>>>>>>>>> pie
>>>>>>>>>>>  endif
>>>>>>>>>> 
>>>>>>>>>> Does this manual forwarding also work for GNU ld? If
>>>>>>>>>> so,
>>>>>>>>>> I think we
>>>>>>>>>> don't need to detect bare-metal triple and turn off
>>>>>>>>>> FW_PIC in
>>>>>>>>>> Makefile?
>>>>>>>>> 
>>>>>>>>> I just built a riscv64-unknown-elf-gcc toolchain and
>>>>>>>>> used
>>>>>>>>> it to build
>>>>>>>>> the current HEAD of opensbi/master. Indeed it's broken
>>>>>>>>> that
>>>>>>>>> pie is not
>>>>>>>>> supported with the bare-metal triple.
>>>>>>>>> 
>>>>>>>>> The GNU ld simply complains:
>>>>>>>>> 
>>>>>>>>>  ELF       platform/generic/firmware/payloads/test.elf
>>>>>>>>> /opt/riscv-unknown-elf/lib/gcc/riscv64-unknown-
>>>>>>>>> elf/10.1.0/../../../../riscv64-unknown-elf/bin/ld.bfd:
>>>>>>>>> -pie not supported
>>>>>>>> 
>>>>>>>> The firmware/objects.mk is doing the following:
>>>>>>>> 
>>>>>>>> ifndef FW_PIC
>>>>>>>> FW_PIC := y
>>>>>>>> endif
>>>>>>>> 
>>>>>>>> Instead of above, we should set FW_PIC=y only when the
>>>>>>>> underlying
>>>>>>>> toolchain supports pie.
>>>>>>>> 
>>>>>>> 
>>>>>>> Agree.
>>>>>>> 
>>>>>>>> We need a patch for this to be merged before we can merge
>>>>>>>> this
>>>>>>>> series. Can you send such a patch ? If not then I can
>>>>>>>> send
>>>>>>>> it.
>>>>>>> 
>>>>>>> Do you have some reliable ways to check whether a toolchain
>>>>>>> supports PIE?
>>>>>> 
>>>>>> How about checking "-linux-" in CROSS_COMPILE prefix ? If
>>>>>> it's
>>>>>> available then
>>>>>> we set FW_PIC=y else we set FW_PIC=n.
>>>>> 
>>>>> That works for cross-compile toolchains. But how about native
>>>>> toolchains (building OpenSBI on a RISC-V machine)?
>>>> 
>>>> Yes, it will not work for native compilation of OpenSBI.
>>>> 
>>>>> 
>>>>>> I did not find any info in the "${CROSS_COMPILE}gcc -v"
>>>>>> output.
>>>>> 
>>>>> Me neither.
>>>>> 
>>>>>> 
>>>>>> Maybe also add some comment in objects.mk that GCC bare-metal
>>>>>> toolchain
>>>>>> does not have PIE enabled.
>>>>> 
>>>>> Or we can just document if using bare-metal toolchain FW_PIC
>>>>> has to
>>>>> be
>>>>> set to n in the build.
>>>> 
>>>> Sounds good.
>>>> 
>>>> We should document it under section "Required Toolchain" of top-
>>>> level
>>>> README.md. Basically, we prefer toolchains with PIE support and
>>>> for
>>>> toolchains not having PIE users have to pass the "FW_PIC=n"
>>>> option.
>>>> 
>>>> Also, we should replace references of bare-metal toolchain prefix
>>>> with
>>>> linux toolchain prefix everywhere in documentation.
>>>> 
>>>> Regards,
>>>> Anup
>>> We can add the following code to the makefile to detect pie support
>>> 
>>> pie_support=$(shell $(CC) -nostdlib -fPIE -Wl,-pie /dev/null
>>> 2>/dev/null && echo y || echo n)
>> 
>> That doesn?t work, /dev/null is not a valid object file so this will
>> always fail with any toolchain.
> I have tested it, so that the following commands no longer report
> errors
> 
> CROSS_COMPILE=riscv64-unknown-elf- make PLATFORM=generic

It doesn?t work with Clang. It will always give an error as it regards
/dev/null as being an object file. You need to force it to parse
/dev/null as a C file with -x c. The same thing also happens with
riscv64-unknown-freebsd12.1-gcc. I don?t know what?s special about
riscv64-unknown-elf-gcc, though that *does* seem to do the right thing
currently, but only that. Even my native x86_64-linux-gnu-gcc treats
/dev/null as an object file. So something weird is going on in GCC
land, but -x c should ensure you always get what you want.

Jess


