From: Anup Patel <anup@brainfault.org>
Date: Sun, 16 Aug 2020 21:15:57 +0530
Subject: [PATCH 1/2] lib: sbi_init: Avoid thundering hurd problem with
 coldbook_lock
In-Reply-To: <CB3E4F1C-597F-4F4E-B5DA-FE35A5C8FE15@jrtc27.com>
References: <20200815170055.286732-1-anup.patel@wdc.com>
 <3ACE8B47-D24B-4811-85BC-353E155D269D@jrtc27.com>
 <CAEUhbmWJExf8Ym7xW2e4R1a1FVFTWpLhRbqvNeGS-Fs280LH5A@mail.gmail.com>
 <CAAhSdy0_GyZaM8b=+6qcDfp31jVvgTQR-nVB0qi30Zi+0X=M0g@mail.gmail.com>
 <3F154A67-BF2D-4B15-9FBF-2A627958C616@jrtc27.com>
 <CAAhSdy2xJO=AyaCnRiFaWxukWCQDx7Y7R6QNwL64CVFDJkWzQg@mail.gmail.com>
 <CB3E4F1C-597F-4F4E-B5DA-FE35A5C8FE15@jrtc27.com>
Message-ID: <CAAhSdy2D3eqtvvtYb8eF07orBwmQuwcYrtq=ygcFu7zfuT6+XQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 16, 2020 at 8:18 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 16 Aug 2020, at 15:24, Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sun, Aug 16, 2020 at 7:43 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>
> >> On 16 Aug 2020, at 15:02, Anup Patel <anup@brainfault.org> wrote:
> >>>
> >>> On Sun, Aug 16, 2020 at 12:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>>
> >>>> On Sun, Aug 16, 2020 at 3:49 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>>>>
> >>>>> On 15 Aug 2020, at 18:00, Anup Patel <anup.patel@wdc.com> wrote:
> >>>>>>
> >>>>>> We can have thundering hurd problem with coldboot_lock where the
> >>>>>> boot HART can potentially starve trying to acquire coldboot_lock
> >>>>>> because some of the non-boot HARTs are continuously acquiring and
> >>>>>> releasing coldboot_lock. This can happen if WFI is a NOP
> >>>>>
> >>>>> That is neither necessary nor sufficient, it's solely based on
> >>>>> whether the hart believes an M-mode software interrupt is pending?
> >>>>>
> >>>>>> OR if
> >>>>>> MIP.MSIP bit is already set for some of the non-boot HARTs.
> >>>>>>
> >>>>>> To avoid thundering hurd problem for coldboot_lock, we convert
> >>>>>> coldboot_done flag into atomic variable and using coldboot_lock
> >>>>>> only for coldboot_wait_hmask.
> >>>>>>
> >>>>>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >>>>>> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >>>>>> ---
> >>>>>> lib/sbi/sbi_init.c | 19 ++++++++++++-------
> >>>>>> 1 file changed, 12 insertions(+), 7 deletions(-)
> >>>>>>
> >>>>>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> >>>>>> index a7fb848..6b58983 100644
> >>>>>> --- a/lib/sbi/sbi_init.c
> >>>>>> +++ b/lib/sbi/sbi_init.c
> >>>>>> @@ -85,9 +85,10 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
> >>>>>> }
> >>>>>>
> >>>>>> static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER;
> >>>>>> -static unsigned long coldboot_done = 0;
> >>>>>> static struct sbi_hartmask coldboot_wait_hmask = { 0 };
> >>>>>>
> >>>>>> +static atomic_t coldboot_done = ATOMIC_INITIALIZER(0);
> >>>>>> +
> >>>>>> static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >>>>>> {
> >>>>>>     unsigned long saved_mie, cmip;
> >>>>>> @@ -105,16 +106,20 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >>>>>>     /* Mark current HART as waiting */
> >>>>>>     sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
> >>>>>>
> >>>>>> +     /* Release coldboot lock */
> >>>>>> +     spin_unlock(&coldboot_lock);
> >>>>>> +
> >>>>>>     /* Wait for coldboot to finish using WFI */
> >>>>>> -     while (!coldboot_done) {
> >>>>>> -             spin_unlock(&coldboot_lock);
> >>>>>> +     while (!atomic_read(&coldboot_done)) {
> >>>>>
> >>>>> Personally I'd make this a relaxed read and then explicitly fence
> >>>>> outside the loop, as otherwise if we end up with MSIP erroneously set
> >>>>> there may be a lot of cache coherency traffic due to repeated
> >>>>> unnecessary fences?
> >>>>>
> >>>>>>             do {
> >>>>>>                     wfi();
> >>>>>>                     cmip = csr_read(CSR_MIP);
> >>>>>>              } while (!(cmip & MIP_MSIP));
> >>>>>> -             spin_lock(&coldboot_lock);
> >>>>>>     };
> >>>>>>
> >>>>>> +     /* Acquire coldboot lock */
> >>>>>> +     spin_lock(&coldboot_lock);
> >>>>>> +
> >>>>>>     /* Unmark current HART as waiting */
> >>>>>>     sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
> >>>>>>
> >>>>>> @@ -132,12 +137,12 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
> >>>>>> {
> >>>>>>     const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> >>>>>>
> >>>>>> +     /* Mark coldboot done */
> >>>>>> +     atomic_write(&coldboot_done, 1);
> >>>>>
> >>>>> This only needs to be a store release.
> >>>>
> >>>> I believe relaxed read / write can work as well.
> >>>
> >>> Even if we use relaxed read / write, we will still need explicit Acquire
> >>> and Release barriers. Better to use __smp_store_release() and
> >>> __smp_load_acquire().
> >>
> >> Why not just use the C11 versions? Inline assembly is rarely needed
> >> these days for atomics. Especially helpful given the large hammer that
> >> is volatile inline assembly with a memory clobber causes highly
> >> pessimistic code generation from the compiler. In general it should
> >> only be necessary when needing to deal with I/O memory.
> >
> > We want to keep our barrier usage close to Linux RISC-V so that
> > people familiar with Linux can easily debug. Nothing against C11.
>
> Ok, but what about those who don't deal with Linux and have to go look
> up the semantics? C11/C++11 atomics are completely target-independent
> and a universal standard. There are far more developers out there who
> know C11/C++11 atomics and how to use them properly than those who know
> the Linux atomics. They are also, in my opinion, far easier to reason
> about, and the Linux ones are just poorly named (e.g. wmb() being
> `fence ow, ow` but smp_wmb() being `fence w, w` is, to my mind,
> confusing and not well-indicated by the names); I think it is far
> easier for a Linux developer to move to the C11/C++11 atomics world
> than the other way round. And, as I've said, using `__asm__
> __volatile__ ("fence ..." ::: "memory")` everywhere does seriously hurt
> the compiler's ability to optimise your code, whereas if you use
> C11/C++11 atomics then it knows exactly what you're doing.

Like I said, nothing against C11 atomics. Moving to C11 atomics in
OpenSBI is a separate topic so feel free to send PATCHs for it.

>
> Quite frankly, settling on Linux atomics in order to make it familiar
> to Linux developers is a bit hostile towards non-Linux developers.
> FreeBSD doesn't use Linux atomics (and in fact it uses its own set that
> are basically C11/C++11 atomics, just currently implemented in assembly
> because they date from before widespread C11 support in compilers, but
> they can all be replaced with their C11 equivalents, with the exception
> of things dealing with I/O), so you're effectively declaring that Linux
> matters more than any other operating system? Whether or not that's
> your intent I don't know, nor do I particularly care, but it's
> nonetheless how it comes across. Picking a universal standard ensures
> you don't express favouritism, whilst making it _more_ accessible
> overall.

Most of the OpenSBI contributors have a back-ground of Linux kernel
development hence OpenSBI sources have a lot of Linux influence. This
does not mean we are against non-Linux ways of doing things.

Your implication that "Linux matters more to OpenSBI" is unwarranted.

>
> Using __smp_load_acquire/__smp_store_release though does seem
> especially pointless; those are just obfuscated (to the compiler)
> versions of C11 atomics, so those at least should just be the C11
> versions, even if you do end up keeping the barriers.

Like I mentioned, moving to C11 atomics is a separate topic

Regards,
Anup

