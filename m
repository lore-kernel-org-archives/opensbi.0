From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Aug 2020 15:06:05 +0530
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
In-Reply-To: <DM6PR04MB62015DD8E93E18147244B0EA8D400@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
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
 <f492bbba-bec3-4615-0652-fed340e97654@gmail.com>
 <7e050b0e57e6fdfa9cfe7a0a17d2f2501a4a67f9.camel@wdc.com>
 <DM6PR04MB62013F6069B11A60140B86A08D400@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CY4PR04MB37513D1610F4F6381B8793B5E7400@CY4PR04MB3751.namprd04.prod.outlook.com>
 <DM6PR04MB6201D3F04981A0CC297E661C8D400@DM6PR04MB6201.namprd04.prod.outlook.com>
 <a0e63ffa-e1c8-fa22-b408-b505c62ee47b@gmx.de>
 <DM6PR04MB62015DD8E93E18147244B0EA8D400@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <CAAhSdy2xfKZvU2gFbeM8hXVHaZgTJGHVkJdg8vDroB5mCjy+qA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 14, 2020 at 2:50 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > Sent: 14 August 2020 14:46
> > To: Anup Patel <Anup.Patel@wdc.com>; Damien Le Moal
> > <Damien.LeMoal@wdc.com>; atishp at atishpatra.org; seanga2 at gmail.com
> > Cc: Atish Patra <Atish.Patra@wdc.com>; bmeng.cn at gmail.com;
> > jrtc27 at jrtc27.com; opensbi at lists.infradead.org; merle at hardenedlinux.org
> > Subject: Re: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
> >
> > On 14.08.20 09:03, Anup Patel wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Damien Le Moal <Damien.LeMoal@wdc.com>
> > >> Sent: 14 August 2020 11:49
> > >> To: Anup Patel <Anup.Patel@wdc.com>; atishp at atishpatra.org;
> > >> xypron.glpk at gmx.de; seanga2 at gmail.com
> > >> Cc: jrtc27 at jrtc27.com; Atish Patra <Atish.Patra@wdc.com>;
> > >> bmeng.cn at gmail.com; opensbi at lists.infradead.org;
> > >> merle at hardenedlinux.org
> > >> Subject: Re: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
> > >>
> > >> On 2020/08/14 15:08, Anup Patel wrote:
> > >>>> The following works for me. However, the sbi_ecall_console_puts()
> > >>>> call in
> > >>>> test_main() for the test FW_PAYLOAD does not work. Individual calls
> > >>>> to
> > >>>> sbi_ecall_console_putc() do work, but not the full string. It looks
> > >>>> like the string is broken, so the data section may be broken...
> > >>>> Digging into
> > >> that.
> > >>>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c index
> > >>>> a7fb848..9692cd9 100644
> > >>>> --- a/lib/sbi/sbi_init.c
> > >>>> +++ b/lib/sbi/sbi_init.c
> > >>>> @@ -84,69 +84,18 @@ static void sbi_boot_prints(struct sbi_scratch
> > >>>> *scratch, u32 hartid)
> > >>>>         sbi_hart_pmp_dump(scratch);  }
> > >>>>
> > >>>> -static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER; -static
> > >>>> unsigned long coldboot_done = 0; -static struct sbi_hartmask
> > >>>> coldboot_wait_hmask = {
> > >>>> 0 };
> > >>>> +static atomic_t coldboot_done = ATOMIC_INITIALIZER(0);
> > >>>>
> > >>>> -static void wait_for_coldboot(struct sbi_scratch *scratch, u32
> > >>>> hartid)
> > >>>> +static inline void wait_for_coldboot(struct sbi_scratch *scratch,
> > >>>> +u32
> > >>>> hartid)
> > >>>>  {
> > >>>> -       unsigned long saved_mie, cmip;
> > >>>> -       const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> > >>>> -
> > >>>> -       /* Save MIE CSR */
> > >>>> -       saved_mie = csr_read(CSR_MIE);
> > >>>> -
> > >>>> -       /* Set MSIE bit to receive IPI */
> > >>>> -       csr_set(CSR_MIE, MIP_MSIP);
> > >>>> -
> > >>>> -       /* Acquire coldboot lock */
> > >>>> -       spin_lock(&coldboot_lock);
> > >>>> -
> > >>>> -       /* Mark current HART as waiting */
> > >>>> -       sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
> > >>>> -
> > >>>> -       /* Wait for coldboot to finish using WFI */
> > >>>> -       while (!coldboot_done) {
> > >>>> -               spin_unlock(&coldboot_lock);
> > >>>> -               do {
> > >>>> -                       wfi();
> > >>>> -                       cmip = csr_read(CSR_MIP);
> > >>>> -                } while (!(cmip & MIP_MSIP));
> > >>>> -               spin_lock(&coldboot_lock);
> > >>>> -       };
> > >>>> -
> > >>>> -       /* Unmark current HART as waiting */
> > >>>> -       sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
> > >>>> -
> > >>>> -       /* Release coldboot lock */
> > >>>> -       spin_unlock(&coldboot_lock);
> > >>>> -
> > >>>> -       /* Restore MIE CSR */
> > >>>> -       csr_write(CSR_MIE, saved_mie);
> > >>>> -
> > >>>> -       /* Clear current HART IPI */
> > >>>> -       sbi_platform_ipi_clear(plat, hartid);
> > >>>> +       /* Wait for coldboot to finish */
> > >>>> +       while (!atomic_read(&coldboot_done)) {};
> >
> >
> > Atomicity of accesses to coldboot_done is not needed for the cold hart to
> > signal that it has proceeded far enough to let the warm harts continue.
> >
> > As Jessica pointed out in the inter-thread communication we have to make
> > sure that the compiler optimization does not re-sequence commands
> > incorrectly. A good description can be found in
> >
> >     https://www.kernel.org/doc/Documentation/memory-barriers.txt
> >
> > The Linux kernel defines
> >
> >     #deine barrier() __asm__ __volatile__("": : :"memory")
> >
> > as a compiler barrier.
> >
> > I think we can completely remove the 'coldboot_lock' spin-lock and use
> > barrier() instead.
>
> coldboot_lock protects the coldboot_wait_hmask. We should keep the
> Coldboot_lock for this bitmask and make coldboot_done atomic.
>
> The atomic_read() and atomic_write() are regular read/write with
> RISC-V barriers.
>

This is what I am suggesting ....

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a7fb848..6b58983 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -85,9 +85,10 @@ static void sbi_boot_prints(struct sbi_scratch
*scratch, u32 hartid)
 }

 static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER;
-static unsigned long coldboot_done = 0;
 static struct sbi_hartmask coldboot_wait_hmask = { 0 };

+static atomic_t coldboot_done = ATOMIC_INITIALIZER(0);
+
 static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 {
        unsigned long saved_mie, cmip;
@@ -105,16 +106,20 @@ static void wait_for_coldboot(struct sbi_scratch
*scratch, u32 hartid)
        /* Mark current HART as waiting */
        sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);

+       /* Release coldboot lock */
+       spin_unlock(&coldboot_lock);
+
        /* Wait for coldboot to finish using WFI */
-       while (!coldboot_done) {
-               spin_unlock(&coldboot_lock);
+       while (!atomic_read(&coldboot_done)) {
                do {
                        wfi();
                        cmip = csr_read(CSR_MIP);
                 } while (!(cmip & MIP_MSIP));
-               spin_lock(&coldboot_lock);
        };

+       /* Acquire coldboot lock */
+       spin_lock(&coldboot_lock);
+
        /* Unmark current HART as waiting */
        sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);

@@ -132,12 +137,12 @@ static void wake_coldboot_harts(struct
sbi_scratch *scratch, u32 hartid)
 {
        const struct sbi_platform *plat = sbi_platform_ptr(scratch);

+       /* Mark coldboot done */
+       atomic_write(&coldboot_done, 1);
+
        /* Acquire coldboot lock */
        spin_lock(&coldboot_lock);

-       /* Mark coldboot done */
-       coldboot_done = 1;
-
        /* Send an IPI to all HARTs waiting for coldboot */
        for (int i = 0; i <= sbi_scratch_last_hartid(); i++) {
                if ((i != hartid) &&


Regards,
Anup

