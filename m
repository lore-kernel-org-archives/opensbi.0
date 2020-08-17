From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 17 Aug 2020 02:24:54 +0100
Subject: [PATCH 1/2] lib: sbi_init: Avoid thundering hurd problem with
 coldbook_lock
In-Reply-To: <CAEUhbmU4DRND2rjANjf5_vXGHnYu1=SiAu54O1+iT23iUqnLYw@mail.gmail.com>
References: <20200815170055.286732-1-anup.patel@wdc.com>
 <3ACE8B47-D24B-4811-85BC-353E155D269D@jrtc27.com>
 <CAEUhbmWJExf8Ym7xW2e4R1a1FVFTWpLhRbqvNeGS-Fs280LH5A@mail.gmail.com>
 <CAAhSdy0_GyZaM8b=+6qcDfp31jVvgTQR-nVB0qi30Zi+0X=M0g@mail.gmail.com>
 <CAEUhbmU4DRND2rjANjf5_vXGHnYu1=SiAu54O1+iT23iUqnLYw@mail.gmail.com>
Message-ID: <FAAAD549-295B-4649-917C-E8B4EDB7B287@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 17 Aug 2020, at 02:04, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> On Sun, Aug 16, 2020 at 10:02 PM Anup Patel <anup@brainfault.org> wrote:
>> 
>> On Sun, Aug 16, 2020 at 12:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>> 
>>> On Sun, Aug 16, 2020 at 3:49 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>> 
>>>> On 15 Aug 2020, at 18:00, Anup Patel <anup.patel@wdc.com> wrote:
>>>>> 
>>>>> We can have thundering hurd problem with coldboot_lock where the
>>>>> boot HART can potentially starve trying to acquire coldboot_lock
>>>>> because some of the non-boot HARTs are continuously acquiring and
>>>>> releasing coldboot_lock. This can happen if WFI is a NOP
>>>> 
>>>> That is neither necessary nor sufficient, it's solely based on
>>>> whether the hart believes an M-mode software interrupt is pending?
>>>> 
>>>>> OR if
>>>>> MIP.MSIP bit is already set for some of the non-boot HARTs.
>>>>> 
>>>>> To avoid thundering hurd problem for coldboot_lock, we convert
>>>>> coldboot_done flag into atomic variable and using coldboot_lock
>>>>> only for coldboot_wait_hmask.
>>>>> 
>>>>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>>>>> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>>>> ---
>>>>> lib/sbi/sbi_init.c | 19 ++++++++++++-------
>>>>> 1 file changed, 12 insertions(+), 7 deletions(-)
>>>>> 
>>>>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>>>>> index a7fb848..6b58983 100644
>>>>> --- a/lib/sbi/sbi_init.c
>>>>> +++ b/lib/sbi/sbi_init.c
>>>>> @@ -85,9 +85,10 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
>>>>> }
>>>>> 
>>>>> static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER;
>>>>> -static unsigned long coldboot_done = 0;
>>>>> static struct sbi_hartmask coldboot_wait_hmask = { 0 };
>>>>> 
>>>>> +static atomic_t coldboot_done = ATOMIC_INITIALIZER(0);
>>>>> +
>>>>> static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>>>> {
>>>>>      unsigned long saved_mie, cmip;
>>>>> @@ -105,16 +106,20 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>>>>      /* Mark current HART as waiting */
>>>>>      sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
>>>>> 
>>>>> +     /* Release coldboot lock */
>>>>> +     spin_unlock(&coldboot_lock);
>>>>> +
>>>>>      /* Wait for coldboot to finish using WFI */
>>>>> -     while (!coldboot_done) {
>>>>> -             spin_unlock(&coldboot_lock);
>>>>> +     while (!atomic_read(&coldboot_done)) {
>>>> 
>>>> Personally I'd make this a relaxed read and then explicitly fence
>>>> outside the loop, as otherwise if we end up with MSIP erroneously set
>>>> there may be a lot of cache coherency traffic due to repeated
>>>> unnecessary fences?
>>>> 
>>>>>              do {
>>>>>                      wfi();
>>>>>                      cmip = csr_read(CSR_MIP);
>>>>>               } while (!(cmip & MIP_MSIP));
>>>>> -             spin_lock(&coldboot_lock);
>>>>>      };
>>>>> 
>>>>> +     /* Acquire coldboot lock */
>>>>> +     spin_lock(&coldboot_lock);
>>>>> +
>>>>>      /* Unmark current HART as waiting */
>>>>>      sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
>>>>> 
>>>>> @@ -132,12 +137,12 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
>>>>> {
>>>>>      const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>>>>> 
>>>>> +     /* Mark coldboot done */
>>>>> +     atomic_write(&coldboot_done, 1);
>>>> 
>>>> This only needs to be a store release.
>>> 
>>> I believe relaxed read / write can work as well.
>> 
>> Even if we use relaxed read / write, we will still need explicit Acquire
>> and Release barriers. Better to use __smp_store_release() and
>> __smp_load_acquire().
> 
> I don't think barriers are needed for this case. Nothing should be
> synchronized before atomic_write(&coldboot_done, 1), and for the read
> path, there are two loops that guarantee it only proceeds after the
> hart sees coldboot_done becomes 1.

Well, atomic_write is a sequentially-consistent write, not a relaxed
write, so adding barriers on the write side would be redundant.
Similarly atomic_read is a sequentially-consistent read, so it already
includes full barriers. But that is not what you were suggesting in your
message. If you use relaxed read/write as you suggested, i.e. by using
atomic_read_explicit/atomic_write_explicit with memory_order_relaxed,
then barriers are absolutely needed. You need a release barrier on the
write side to ensure any preceding writes are visible no later than the
coldboot_done write is, and you need an acquire barrier on the read side
to ensure that any subsequent loads aren't speculatively executed and
see stale values from before the coldboot_done write. Without both
halves of the release-acquire pair there is no guarantee that the
secondary harts will see all the initialisation performed by the
primary hart, rendering the wait on coldboot_done being 1 rather
meaningless (you know that the primary hart has done its
initialisation, but it would be completely legal for an implementation
to let you see the state of the entire rest of memory, i.e. excluding
coldboot_done itself, as if the primary hart had not yet done anything).
Barriers exist for a reason; arguments based on control-flow are not
enough (neither for C nor for hardware).

Jess


