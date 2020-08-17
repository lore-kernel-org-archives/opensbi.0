From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 17 Aug 2020 11:25:58 +0100
Subject: [PATCH 1/2] lib: sbi_init: Avoid thundering hurd problem with
 coldbook_lock
In-Reply-To: <CAEUhbmXEEUWhyKR=XyPcEUZYeELJxar2fxi7vCu1+Aox9-pXxg@mail.gmail.com>
References: <20200815170055.286732-1-anup.patel@wdc.com>
 <3ACE8B47-D24B-4811-85BC-353E155D269D@jrtc27.com>
 <CAEUhbmWJExf8Ym7xW2e4R1a1FVFTWpLhRbqvNeGS-Fs280LH5A@mail.gmail.com>
 <CAAhSdy0_GyZaM8b=+6qcDfp31jVvgTQR-nVB0qi30Zi+0X=M0g@mail.gmail.com>
 <3F154A67-BF2D-4B15-9FBF-2A627958C616@jrtc27.com>
 <CAAhSdy2xJO=AyaCnRiFaWxukWCQDx7Y7R6QNwL64CVFDJkWzQg@mail.gmail.com>
 <CB3E4F1C-597F-4F4E-B5DA-FE35A5C8FE15@jrtc27.com>
 <CAAhSdy2D3eqtvvtYb8eF07orBwmQuwcYrtq=ygcFu7zfuT6+XQ@mail.gmail.com>
 <B68B137B-C326-4BA8-88BE-929DD2DF936D@jrtc27.com>
 <CAAhSdy2vUJX+UZRpcL_UYnDmus6KHFrZAOLentTTTPHBEZCh-A@mail.gmail.com>
 <1EBCE19D-EDA5-42F4-B148-5FB271710DD0@jrtc27.com>
 <CAAhSdy3NTnQQOQHFzUv+VACvsA0iYenWrFbn4pm6wTQKXcpTbw@mail.gmail.com>
 <4666437D-185A-4543-A58D-1EF33BEB56F1@jrtc27.com>
 <CAEUhbmXEEUWhyKR=XyPcEUZYeELJxar2fxi7vCu1+Aox9-pXxg@mail.gmail.com>
Message-ID: <4B454F96-087C-4A9F-B02E-A5303228C2AD@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 17 Aug 2020, at 08:04, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> On Mon, Aug 17, 2020 at 2:23 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> On 16 Aug 2020, at 18:29, Anup Patel <anup@brainfault.org> wrote:
>>> 
>>> On Sun, Aug 16, 2020 at 10:39 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>> 
>>>> On 16 Aug 2020, at 17:59, Anup Patel <anup@brainfault.org> wrote:
>>>>> 
>>>>> On Sun, Aug 16, 2020 at 9:30 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>>>> 
>>>>>> On 16 Aug 2020, at 16:45, Anup Patel <anup@brainfault.org> wrote:
>>>>>>> 
>>>>>>> On Sun, Aug 16, 2020 at 8:18 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>>>>>> 
>>>>>>>> On 16 Aug 2020, at 15:24, Anup Patel <anup@brainfault.org> wrote:
>>>>>>>>> 
>>>>>>>>> On Sun, Aug 16, 2020 at 7:43 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>>>>>>>> 
>>>>>>>>>> On 16 Aug 2020, at 15:02, Anup Patel <anup@brainfault.org> wrote:
>>>>>>>>>>> 
>>>>>>>>>>> On Sun, Aug 16, 2020 at 12:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>>>>>>>>> 
>>>>>>>>>>>> On Sun, Aug 16, 2020 at 3:49 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>>>>>>>>>>>> 
>>>>>>>>>>>>> On 15 Aug 2020, at 18:00, Anup Patel <anup.patel@wdc.com> wrote:
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> We can have thundering hurd problem with coldboot_lock where the
>>>>>>>>>>>>>> boot HART can potentially starve trying to acquire coldboot_lock
>>>>>>>>>>>>>> because some of the non-boot HARTs are continuously acquiring and
>>>>>>>>>>>>>> releasing coldboot_lock. This can happen if WFI is a NOP
>>>>>>>>>>>>> 
>>>>>>>>>>>>> That is neither necessary nor sufficient, it's solely based on
>>>>>>>>>>>>> whether the hart believes an M-mode software interrupt is pending?
>>>>>>>>>>>>> 
>>>>>>>>>>>>>> OR if
>>>>>>>>>>>>>> MIP.MSIP bit is already set for some of the non-boot HARTs.
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> To avoid thundering hurd problem for coldboot_lock, we convert
>>>>>>>>>>>>>> coldboot_done flag into atomic variable and using coldboot_lock
>>>>>>>>>>>>>> only for coldboot_wait_hmask.
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>>>>>>>>>>>>>> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>> lib/sbi/sbi_init.c | 19 ++++++++++++-------
>>>>>>>>>>>>>> 1 file changed, 12 insertions(+), 7 deletions(-)
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
>>>>>>>>>>>>>> index a7fb848..6b58983 100644
>>>>>>>>>>>>>> --- a/lib/sbi/sbi_init.c
>>>>>>>>>>>>>> +++ b/lib/sbi/sbi_init.c
>>>>>>>>>>>>>> @@ -85,9 +85,10 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
>>>>>>>>>>>>>> }
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER;
>>>>>>>>>>>>>> -static unsigned long coldboot_done = 0;
>>>>>>>>>>>>>> static struct sbi_hartmask coldboot_wait_hmask = { 0 };
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> +static atomic_t coldboot_done = ATOMIC_INITIALIZER(0);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>>>>>>>>>>>>> {
>>>>>>>>>>>>>> unsigned long saved_mie, cmip;
>>>>>>>>>>>>>> @@ -105,16 +106,20 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
>>>>>>>>>>>>>> /* Mark current HART as waiting */
>>>>>>>>>>>>>> sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> +     /* Release coldboot lock */
>>>>>>>>>>>>>> +     spin_unlock(&coldboot_lock);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> /* Wait for coldboot to finish using WFI */
>>>>>>>>>>>>>> -     while (!coldboot_done) {
>>>>>>>>>>>>>> -             spin_unlock(&coldboot_lock);
>>>>>>>>>>>>>> +     while (!atomic_read(&coldboot_done)) {
>>>>>>>>>>>>> 
>>>>>>>>>>>>> Personally I'd make this a relaxed read and then explicitly fence
>>>>>>>>>>>>> outside the loop, as otherwise if we end up with MSIP erroneously set
>>>>>>>>>>>>> there may be a lot of cache coherency traffic due to repeated
>>>>>>>>>>>>> unnecessary fences?
>>>>>>>>>>>>> 
>>>>>>>>>>>>>>         do {
>>>>>>>>>>>>>>                 wfi();
>>>>>>>>>>>>>>                 cmip = csr_read(CSR_MIP);
>>>>>>>>>>>>>>          } while (!(cmip & MIP_MSIP));
>>>>>>>>>>>>>> -             spin_lock(&coldboot_lock);
>>>>>>>>>>>>>> };
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> +     /* Acquire coldboot lock */
>>>>>>>>>>>>>> +     spin_lock(&coldboot_lock);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> /* Unmark current HART as waiting */
>>>>>>>>>>>>>> sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> @@ -132,12 +137,12 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
>>>>>>>>>>>>>> {
>>>>>>>>>>>>>> const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>>>>>>>>>>>>>> 
>>>>>>>>>>>>>> +     /* Mark coldboot done */
>>>>>>>>>>>>>> +     atomic_write(&coldboot_done, 1);
>>>>>>>>>>>>> 
>>>>>>>>>>>>> This only needs to be a store release.
>>>>>>>>>>>> 
>>>>>>>>>>>> I believe relaxed read / write can work as well.
>>>>>>>>>>> 
>>>>>>>>>>> Even if we use relaxed read / write, we will still need explicit Acquire
>>>>>>>>>>> and Release barriers. Better to use __smp_store_release() and
>>>>>>>>>>> __smp_load_acquire().
>>>>>>>>>> 
>>>>>>>>>> Why not just use the C11 versions? Inline assembly is rarely needed
>>>>>>>>>> these days for atomics. Especially helpful given the large hammer that
>>>>>>>>>> is volatile inline assembly with a memory clobber causes highly
>>>>>>>>>> pessimistic code generation from the compiler. In general it should
>>>>>>>>>> only be necessary when needing to deal with I/O memory.
>>>>>>>>> 
>>>>>>>>> We want to keep our barrier usage close to Linux RISC-V so that
>>>>>>>>> people familiar with Linux can easily debug. Nothing against C11.
>>>>>>>> 
>>>>>>>> Ok, but what about those who don't deal with Linux and have to go look
>>>>>>>> up the semantics? C11/C++11 atomics are completely target-independent
>>>>>>>> and a universal standard. There are far more developers out there who
>>>>>>>> know C11/C++11 atomics and how to use them properly than those who know
>>>>>>>> the Linux atomics. They are also, in my opinion, far easier to reason
>>>>>>>> about, and the Linux ones are just poorly named (e.g. wmb() being
>>>>>>>> `fence ow, ow` but smp_wmb() being `fence w, w` is, to my mind,
>>>>>>>> confusing and not well-indicated by the names); I think it is far
>>>>>>>> easier for a Linux developer to move to the C11/C++11 atomics world
>>>>>>>> than the other way round. And, as I've said, using `__asm__
>>>>>>>> __volatile__ ("fence ..." ::: "memory")` everywhere does seriously hurt
>>>>>>>> the compiler's ability to optimise your code, whereas if you use
>>>>>>>> C11/C++11 atomics then it knows exactly what you're doing.
>>>>>>> 
>>>>>>> Like I said, nothing against C11 atomics. Moving to C11 atomics in
>>>>>>> OpenSBI is a separate topic so feel free to send PATCHs for it.
>>>>>> 
>>>>>> That is not the sentiment that most would extract from "We want to keep
>>>>>> our barrier usage close to Linux RISC-V so that people familiar with
>>>>>> Linux can easily debug". Such a statement comes across as saying that
>>>>>> sending in C11 patches would be a waste of time because OpenSBI has
>>>>>> already decided on staying with Linux atomics. Saying "nothing against
>>>>>> C11 atomics" is also a bit of a vacuous statement as it omits the key
>>>>>> "but", namely "but they are not Linux atomics which we prefer", so
>>>>>> somewhat mis-represents your position, or at least the position you
>>>>>> initially stated.
>>>>>> 
>>>>>>>> Quite frankly, settling on Linux atomics in order to make it familiar
>>>>>>>> to Linux developers is a bit hostile towards non-Linux developers.
>>>>>>>> FreeBSD doesn't use Linux atomics (and in fact it uses its own set that
>>>>>>>> are basically C11/C++11 atomics, just currently implemented in assembly
>>>>>>>> because they date from before widespread C11 support in compilers, but
>>>>>>>> they can all be replaced with their C11 equivalents, with the exception
>>>>>>>> of things dealing with I/O), so you're effectively declaring that Linux
>>>>>>>> matters more than any other operating system? Whether or not that's
>>>>>>>> your intent I don't know, nor do I particularly care, but it's
>>>>>>>> nonetheless how it comes across. Picking a universal standard ensures
>>>>>>>> you don't express favouritism, whilst making it _more_ accessible
>>>>>>>> overall.
>>>>>>> 
>>>>>>> Most of the OpenSBI contributors have a back-ground of Linux kernel
>>>>>>> development hence OpenSBI sources have a lot of Linux influence. This
>>>>>>> does not mean we are against non-Linux ways of doing things.
>>>>>> 
>>>>>> See above. I can completely understand starting out with Linux atomics
>>>>>> if that's what the original developers are most familiar with, but that
>>>>>> is a rather different position than what you first presented.
>>>>>> 
>>>>>>> Your implication that "Linux matters more to OpenSBI" is unwarranted.
>>>>>> 
>>>>>> Please do not mince my words, I chose them very carefully. I did not
>>>>>> say "Linux matters more to OpenSBI", I said:
>>>>>> 
>>>>>> you're effectively declaring that Linux
>>>>>> matters more than any other operating system? Whether or not that's
>>>>>> your intent I don't know, nor do I particularly care, but it's
>>>>>> nonetheless how it comes across.
>>>>> 
>>>>> You are making an incorrect conclusion here. I am not commenting
>>>>> any more on this.
>>>> 
>>>> I am not saying that is my conclusion. I am saying that is something
>>>> people _might_ reasonably conclude given that statement, and whether or
>>>> not such a conclusion is true is irrelevant, because by not making it
>>>> clear that it's not the case the damage has already been done. That is
>>>> all. Again, please read what I write and don't put words in my mouth; I
>>>> continue to be very careful in how I phrase this precisely so as to not
>>>> be saying the things you claim I am saying.
>>>> 
>>>>>> Note that second sentence; I explicitly stated that I was not accusing
>>>>>> you of stating that Linux matters more, rather that your statements
>>>>>> have the effect of _coming across_ that way _regardless_ of intent.
>>>>>> 
>>>>>>>> Using __smp_load_acquire/__smp_store_release though does seem
>>>>>>>> especially pointless; those are just obfuscated (to the compiler)
>>>>>>>> versions of C11 atomics, so those at least should just be the C11
>>>>>>>> versions, even if you do end up keeping the barriers.
>>>>>>> 
>>>>>>> Like I mentioned, moving to C11 atomics is a separate topic
>>>>>> 
>>>>>> Yes and no. The original patch used C11 atomics and when I suggested
>>>>>> using acquire/release you then changed to not using C11 atomics. Using
>>>>>> C11 atomics more widely, sure, that can be a separate thread, but given
>>>>>> C11 atomics have already been introduced by yourself in this thread I
>>>>>> think it's appropriate to discuss their use for this specific patch.
>>>>> 
>>>>> I am not familiar with C11 atomics. The riscv_atomic.c and riscv_atomic.h
>>>>> have atomic operations inspired from Linux sources.
>>>>> 
>>>>> The coldboot_done usage is classing single-producer and multiple-consumer
>>>>> problem so making coldboot_done as atomic seems overkill. That's why
>>>>> moving to __smp_load_acquire()/__smp_store_release() is appropriate
>>>>> for coldboot_done.
>> 
>> I implore you to neither assert nor attempt to educate me on aspects of
>> the C programming language that you yourself just said that you were
>> "not familiar with". Everything you have stated is either categorically
>> false (and extremely dangerous to erroneously put into practice) or is
>> only true when a caveated definition of equivalence is used. Before
>> anyone says otherwise, I am not by any means taking issue with your
>> ignorance, rather that you are making false, unsubstantiated claims
>> _despite_ recognising that this is a gap in your knowledge.
>> 
>>>> The C11 atomics are the same thing, but expressed with the standard
>>>> language primitives rather than black-box memory-clobbering inline
>>>> assembly. That means:
>>>> 
>>>> atomic_store_explicit(&coldboot_done, 1, memory_order_release)
>>> 
>>> This is equivalent to __smp_store_release().
>> 
>> It depends what definition you take. If you are solely using inline
>> assembly, and you only care about whether or not it achieves release
>> semantics, then yes. But that is only it. If you use a C11 acquire load
>> (or fence) then the language does not guarantee you will get acquire
>> semantics when reading from this store. Moreover, as I keep repeating,
>> __smp_store_release's use of inline assembly heavily restricts the
>> compiler's code generation, since all it sees is that an unknown region
>> of memory may or may not be changed by this opaque string of
>> instructions; it cannot tell whether this is a fence, a load, a store,
>> or any number of each combined in any sequence, so it has to take a
>> highlyg conservative a code generation approach. If instead you use the
>> C11 atomics form, the compiler knows the precise details of what is
>> being done, namely that it only needs to be concerned with ensuring any
>> loads performed in the source code after the acquire load see any
>> stores before the corresponding store release as having occurred. No
>> more.
>> 
>>>> 
>>>> and
>>>> 
>>>> while (!atomic_load_explicit(&coldboot_done, memory_order_relaxed)) {
>>> 
>>> This is equivalent to just directly reading coldboot_done.
>> 
>> This is the false and highly dangerous assertion in all of this. At the
>> hardware level, sure, they will both be plain loads. But at the C
>> language level it is a completely different story. Directly reading
>> coldboot_done without any use of atomics would result in a data race,
>> which is undefined behaviour, and permit the compiler to perform
>> optimisations based on that. The compiler would be permitted to know
>> that the body of the loop does not have any side-effects pertaining to
>> coldboot_done's value and thus conclude that, since data races are
>> undefined behaviour, if the loop is ever entered then it will never be
>> exited, allowing it to turn it into `if (!coldboot_done) { while (1) {
>> ... } }`. Moreover, the infinite loop itself, being a loop that never
>> terminates yet whose condition is not a literal constant, is itself
>> undefined behaviour (`while (1) {}` is defined, but `int x = 1; while
>> (x) {}` is undefined), and so the compiler would also be permitted to
> 
> "The infinite loop itself, being a loop that never terminates yet
> whose condition is not a literal constant, is itself undefined
> behaviour (`while (1) {}` is defined, but `int x = 1; while (x) {}` is
> undefined)"
> 
> Really? I believe this is only true when there is a data race on x.

"An iteration statement whose controlling expression is not a constant
expression, that performs no input/output operations, does not access
volatile objects, and performs no synchronization or atomic operations
in its body, controlling expression, or (in the case of a for
statement) its expression-3, may be assumed by the implementation to
terminate."

- https://port70.net/~nsz/c/c11/n1570.html#6.8.5p6

So in this case, the asm volatile inside the loop means there are
side-effects and the loop can't be optimised out due to this case, but
the example I gave can, and the original loop can still be made a
conditional infinite one due to the data race.

>> assume that coldboot_done must never be able to be true (since it being
>> false would lead to undefined behaviour) and completely delete the code
>> in question.
>> 
>> If you don't believe me, consider the following code:
>> 
>>    #include <stdatomic.h>
>> 
>>    int unsafe_int;
> 
> This can be simply fixed by adding "volatile" to declare unsafe_int,
> to get rid of the UB.

Sure, in this particular case that specific instance of UB can be
addressed by making unsafe_int volatile, though that doesn't mean it's
the _right_ way to fix it. There are very few cases where volatile is
actually the correct way to address a problem, and it does not avoid
data races (if you read the entire section on data races you will find
zero references to the word volatile) if you have other threads writing
to it, it's _only_ to deal with memory-mapped hardware registers that
can change from under you (which _don't_ count as data races because
they are outside the C abstract machine). It certainly doesn't imply
any barriers. But in _practice_ it mostly ends up behaving like a
relaxed atomic access in current implementations, simply because it's
hard for compilers to actually exploit the known UB.

So, please never use volatile for anything that is not an actual
memory-mapped volatile object, it is not a replacement for atomics in
this day and age, even if it _looks like_ it works.

Jess

>>    void unsafe_wait(void) {
>>        while (!unsafe_int) {}
>>    }
>> 
>>    _Atomic(int) safe_int;
>> 
>>    void safe_wait(void) {
>>        while (!atomic_load_explicit(&safe_int, memory_order_relaxed)) {}
>>    }
>> 
>> Using RISC-V gcc 8.2.0 (see for yourself: https://godbolt.org/z/39sf4c)
>> gives:
>> 
>>    unsafe_wait:
>>        lui     a5, %hi(unsafe_int)
>>        lw      a5, %lo(unsafe_int)(a5)
>>        bnez    a5, .L5
>>    .L4:
>>        j       .L4
>>    .L5:
>>        ret
>> 
>> and
>> 
>>    safe_wait:
>>        lui     a4, %hi(safe_int)
>>    .L8:
>>        lw      a5, %lo(safe_int)(a4)
>>        sext.w  a5, a5
>>        beqz    a5, .L8
>>        ret
>> 
>> Note how unsafe_wait has been turned into a conditional infinite loop,
>> whereas safe_wait continues to re-load the value and check it on every
>> iteration of the loop. GCC has not taken the additional step of
>> deleting the infinite loop entirely, but it could.
>> 
>> (Yes, that `sext.w` is redundant, and newer versions likely do better)
>> 
>>>>     ...
>>>> }
>>>> atomic_thread_fence(memory_order_acquire);
>>> 
>>> This is equivalent to RISCV_ACQUIRE_BARRIER
>> 
>> See my answer to __smp_store_release.
>> 
>>>> 
>>>> or just
>>>> 
>>>> while (!atomic_load_explicit(&coldboot_done, memory_order_acquire)) {
>>> 
>>> This is equivalent to __smp_load_acquire().
>> 
>> See my answer to __smp_store_release.
>> 
>> Jess
>> 
>>>>     ...
>>>> }
>>>> 
>>>> if you're happy having the barrier on every loop iteration. This is no
>>>> more overkill than __smp_load_acquire()/__smp_store_release(), in fact
>>>> it's _less_ overkill by not having opaque memory clobbers.
> 
> Regards,
> Bin


