From: Sean Anderson <seanga2@gmail.com>
Date: Thu, 13 Aug 2020 20:39:16 -0400
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
In-Reply-To: <CAOnJCU+8SKLvaoscCUvWsYxNmoYr8Muy06ta9Xf2gJ=Gtss9MA@mail.gmail.com>
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
 <B98172B0-5CAA-48D2-A2F3-B4DB6B66FB16@jrtc27.com>
 <e3f6b789-0fa6-51f1-4cc4-f5eaa625b8df@gmx.de>
 <B63355E7-4A46-4492-A97F-DE576FB0DDA0@jrtc27.com>
 <CAOnJCUJ8aD8momBWbKuQMv6Apta=LM-Sddoh0VhAVPQhBN-ZAw@mail.gmail.com>
 <e63dc1a5-fb1d-7488-5f59-c2f1165b34dc@gmx.de>
 <823E7031-FADE-4445-8DD6-E4775182712E@jrtc27.com>
 <45937abd-a5b9-5c4d-4520-58c6c0505921@gmx.de>
 <CAOnJCU+qSHMq0pvEPBE0bu4cgVq2_9pNfOWxd8ZRPhe+vj9Hbg@mail.gmail.com>
 <e87d2a6e-5ecd-d47b-2d0f-76429772ab15@gmx.de>
 <CAOnJCUK_pyanTOsTZafEOgJEprgvVcy7zYuiOTHvKxJqhaxeAQ@mail.gmail.com>
 <407d4b67-b4c7-0d50-68a4-2de077a8b696@gmx.de>
 <CAOnJCU+8SKLvaoscCUvWsYxNmoYr8Muy06ta9Xf2gJ=Gtss9MA@mail.gmail.com>
Message-ID: <f492bbba-bec3-4615-0652-fed340e97654@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/13/20 8:32 PM, Atish Patra wrote:
> On Thu, Aug 13, 2020 at 3:52 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>
>> On 14.08.20 00:25, Atish Patra wrote:
>>>>> Probably, the hart executing warmboot invokes sbi_platform_ipi_clear
>>>>> even before sbi_ipi_init is being called from the hart running coldboot.
>>>> There are two calls to sbi_ipi_init(). Is only the one in coldboot relevant?
>>>>
>>> Yes. That actually setups the clint base address.
>>>
>>>> Do you mean something like:
>>>>
>>> No. I meant like this.
>>>
>>> +#define UART_BASE 0x38000000ULL
>>> +static void sbi_print_early(char ch) {
>>> +    int32_t r;
>>> +    do {
>>> +      __asm__ __volatile__ (
>>> +        "amoor.w %0, %2, %1\n"
>>> +        : "=r" (r), "+A" (*(uint32_t*)(UART_BASE))
>>> +        : "r" (ch));
>>> +    } while (r < 0);
>>> +}
>>> +
>>>  static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
>>>  {
>>>         int xlen;
>>> @@ -112,6 +123,8 @@ static void wait_for_coldboot(struct sbi_scratch
>>> *scratch, u32 hartid)
>>>                         wfi();
>>>                         cmip = csr_read(CSR_MIP);
>>>                  } while (!(cmip & MIP_MSIP));
>>> +               sbi_print_early('T');
>>> +               sbi_printf("mip value %lx\n", cmip);
>>>                 spin_lock(&coldboot_lock);
>>>         };
>>>
>>>
>>> Note: sbi_printf may not work if sbi_console_init from the cold boot
>>> path is not invoked.
>>> That's why I added a "sbi_print_early".  If sbi_printf doesn't work,
>>> please remove it.
>>>
>>> Thanks for your time in figuring out the issue with Kendryte.
>>> Unfortunately, I can't test these changes as I don't have
>>> a kendryte board at home.
>>>
>>>
>>
>> This now booted to U-Boot. The extra time for printing was enough to
>> break the livelock:
>>
> Thanks again for verification.
> 
>>
>> TTTTTTTTTT
> 
> This confirms that MSIP bit is set even if there was no IPI sent and MIP was
> cleared in fw_base.S [1]. I guess there is a hardware bug with Kendryte where
> MSIP is not getting reset properly.

Hm, perhaps MIP is level-based, so the CLINT itself needs to be
acknowledged before MIP will be disabled.

> 
> [1] https://github.com/riscv/opensbi/blob/master/firmware/fw_base.S#L370
> 
> If that's the case, we can convert coldboot_done to an atomic variable
> as suggested by

I think this is the best course of action in general. All the harts are
just waiting around, so there's no need for an interrupt here.

--Sean

