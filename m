From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Dec 2023 09:52:46 +0530
Subject: [PATCH v2] lib: sbi: skip wait_for_coldboot when coolboot done
In-Reply-To: <CAAhSdy0TiX9hGWS7UFZcaJhY4Bi9ZkeGY+9jSrnvCo=c1cOxqw@mail.gmail.com>
References: <20231210152511.1146592-1-wxjstz@126.com> <CAAhSdy0TiX9hGWS7UFZcaJhY4Bi9ZkeGY+9jSrnvCo=c1cOxqw@mail.gmail.com>
Message-ID: <CAAhSdy0o4vgT3a=bYYwdBNnVsGucpsU4NJcjrSYSu_eJmvbDRQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 11, 2023 at 9:52?AM Anup Patel <anup@brainfault.org> wrote:
>
> On Sun, Dec 10, 2023 at 8:55?PM Xiang W <wxjstz@126.com> wrote:
> >
> > When warmboot via HSM, coolboot has been completed and
> > wait_for_coldboot can be skipped to speed up.
> >
> > Signed-off-by: Xiang W <wxjstz@126.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Also, applied it to the riscv/opensbi repo.

Regards,
Anup

>
> Thanks,
> Anup
>
> > ---
> > v2 changes: move coolboot_done check to wait_for_coldboot
> >
> >  lib/sbi/sbi_init.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> > index e723553..e88c3b1 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -195,6 +195,9 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >  {
> >         unsigned long saved_mie, cmip;
> >
> > +       if (__smp_load_acquire(&coldboot_done))
> > +               return;
> > +
> >         /* Save MIE CSR */
> >         saved_mie = csr_read(CSR_MIE);
> >
> > --
> > 2.42.0
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

