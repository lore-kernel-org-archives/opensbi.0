From: Sean Anderson <seanga2@gmail.com>
Date: Thu, 13 Aug 2020 13:56:58 -0400
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
In-Reply-To: <CAOnJCUJ8aD8momBWbKuQMv6Apta=LM-Sddoh0VhAVPQhBN-ZAw@mail.gmail.com>
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
 <B98172B0-5CAA-48D2-A2F3-B4DB6B66FB16@jrtc27.com>
 <e3f6b789-0fa6-51f1-4cc4-f5eaa625b8df@gmx.de>
 <B63355E7-4A46-4492-A97F-DE576FB0DDA0@jrtc27.com>
 <CAOnJCUJ8aD8momBWbKuQMv6Apta=LM-Sddoh0VhAVPQhBN-ZAw@mail.gmail.com>
Message-ID: <b9fc1a4a-3e80-be15-7564-d557386cb338@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/13/20 1:45 PM, Atish Patra wrote:
> On Thu, Aug 13, 2020 at 10:03 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>
>> On 13 Aug 2020, at 17:51, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>> On 13.08.20 18:36, Jessica Clarke wrote:
>>>> On 13 Aug 2020, at 17:24, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>>>
>>>>> OpenSBI hangs in wake_coldboot_harts() indefinitely on the MaixDuino board
>>>>> when trying to boot U-Boot as FW_PAYLOAD.
>>>>
>>>> This smells of there being a more fundamental issue that's not being
>>>> addressed which this manages to work around, either reliably or by
>>>> chance. What is the actual deadlock condition you observe?
>>>
>>> There are only two function using coldboot_lock spinlock:
>>>
>>> * wake_coldboot_harts()
>>> * wait_for_coldboot()
>>>
>>> wake_coldboot_harts() was entered but never left without patching one of
>>> the functions.
>>>
>>> The Kendryte K210 has two harts. One goes the cold boot path while the
>>> other is sent to the warm boot path.
>>
>> The K210's platform definition uses clint_ipi_send, which as far as I
>> can tell is entirely non-blocking. The only thing wake_coldboot_harts
>> does with the lock held is set coldboot_done to 1 and send an IPI to
>> all the other harts. Thus wake_coldboot_harts should never be able to
>> block holding the spin lock, meaning wait_for_coldboot should
>> eventually wake up and be able to acquire the lock (on platforms that
>> implement WFI fully it shouldn't have to wait long for the lock, though
>> on platforms that make it a NOP there might be a bit of .
>>
> 
> Yes. If wake_coldboot_harts is never able to acquire the spinlock,
> that indicates spinlock
> is always acquired by wait_for_coldboot. That can happen if
> 
> 1. WFI is implemented as NOP as suggested by Jessica and MSIP in MIP
> is set which
> shouldn't happen unless there is an IPI sent.
>
> Can you try clearing the MIP just before acquiring the lock ? In qemu
> & unleashed, modifying the MSIP bit in
> MIP doesn't actually do anything. So we do sbi_platform_ipi_clear  to reset it.

I second this suggestion. I had a similar problem when porting U-Boot.

https://gitlab.denx.de/u-boot/u-boot/-/commit/9472630337e7c4ac442066b5a752aaa8c3b4d4a6

--Sean

