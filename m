From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Tue, 16 Mar 2021 02:40:23 +0000
Subject: [PATCH v2 2/2] firmware: Support position independent execution
In-Reply-To: <CABvJ_xht2mw7K06s_XUmkD2tYOBf+143jLg5miOBXabxU1AHJw@mail.gmail.com>
References: <1614935014-18600-1-git-send-email-vincent.chen@sifive.com>
 <1614935014-18600-3-git-send-email-vincent.chen@sifive.com>
 <CAAhSdy2tzZwMweDtUw2pdO=rt38wKKcWHfb8_EX1FsTW1ojdqA@mail.gmail.com>
 <CABvJ_xiWxKxv-mcQUARGcnpEjVhSN+NoE6cxNJxypFOjiJw4Xg@mail.gmail.com>
 <CAAhSdy2d2ruYJxMjJUASuZcD6CuK5njVw6vJtg=CrkxbWuP+hA@mail.gmail.com>
 <CABvJ_xht2mw7K06s_XUmkD2tYOBf+143jLg5miOBXabxU1AHJw@mail.gmail.com>
Message-ID: <C7B7C40A-3FDC-4DF9-B6F1-E2BF70CC63B0@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 16 Mar 2021, at 01:59, Vincent Chen <vincent.chen@sifive.com> wrote:
> 
> On Mon, Mar 15, 2021 at 5:58 PM Anup Patel <anup@brainfault.org> wrote:
>> 
>> On Mon, Mar 15, 2021 at 3:11 PM Vincent Chen <vincent.chen@sifive.com> wrote:
>>> 
>>> On Sat, Mar 13, 2021 at 12:13 AM Anup Patel <anup@brainfault.org> wrote:
>>>> 
>>>> On Fri, Mar 5, 2021 at 2:35 PM Vincent Chen <vincent.chen@sifive.com> wrote:
>>>>> diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
>>>>> index 5b24f8b..4fb3e0c 100644
>>>>> --- a/firmware/fw_jump.S
>>>>> +++ b/firmware/fw_jump.S
>>>>> @@ -46,6 +46,11 @@ fw_save_info:
>>>>> fw_next_arg1:
>>>>> #ifdef FW_JUMP_FDT_ADDR
>>>>>        li      a0, FW_JUMP_FDT_ADDR
>>>>> +#ifdef FW_PIC
>>>>> +       lla     a1, _runtime_offset
>>>>> +       REG_L   a1, (a1)
>>>>> +       add     a0, a0, a1
>>>>> +#endif
>>>>> #else
>>>>>        add     a0, a1, zero
>>>>> #endif
>>>>> @@ -61,6 +66,11 @@ fw_next_arg1:
>>>>> fw_next_addr:
>>>>>        lla     a0, _jump_addr
>>>>>        REG_L   a0, (a0)
>>>>> +#ifdef FW_PIC
>>>>> +       lla     a1, _runtime_offset
>>>>> +       REG_L   a1, (a1)
>>>>> +       add     a0, a0, a1
>>>>> +#endif
>>>>>        ret
>>>> 
>>>> The changes in fw_next_addr() breaks the FW_JUMP when
>>>> FW_PIC=y because FW_JUMP assumes a compile-time
>>>> fixed address of next booting stage specified by FW_JUMP_ADDR.
>>>> 
>>>> Similarly, when FW_JUMP_FDT_ADDR is defined FW_JUMP
>>>> will assume compile-time fixed address of FDT passed to
>>>> next booting stage.
>>>> 
>>>> Please drop all changes from fw_jump.S
>>>> 
>>> OK, I will drop it.
> 
> Sorry, I forgot to ask a question. Does the assumption of  FW_JUMP
> also imply that FW_JUMP cannot support PIE mode, right?

No, you can have a PIE FW_JUMP OpenSBI. The problem is that you added relocbase
to FW_JUMP_ADDR and FW_JUMP_FDT_ADDR when those are platform-defined constants
regardless of where OpenSBI has been loaded, and so should remain unmodified.

Jess


