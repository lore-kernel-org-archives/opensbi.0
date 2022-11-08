From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 8 Nov 2022 17:35:19 +0530
Subject: [PATCH] lib: utils/serial: Fix semihosting compile error using LLVM
In-Reply-To: <mvmwn85ddki.fsf@suse.de>
References: <20221108032509.1382464-1-apatel@ventanamicro.com> <mvmwn85ddki.fsf@suse.de>
Message-ID: <CAK9=C2XN-pbY-McMSC-u3JrnhpBccGMSezhALbOL95B3w2D4Gw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 8, 2022 at 2:32 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Nov 08 2022, Anup Patel wrote:
>
> > diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> > index 5012fa1..72bbbb3 100644
> > --- a/lib/utils/serial/semihosting.c
> > +++ b/lib/utils/serial/semihosting.c
> > @@ -155,7 +155,7 @@ static int semihosting_getc(void)
> >
> >       if (semihosting_infd < 0)  {
> >               ch = semihosting_trap(SYSREADC, NULL);
>
> This is using the wrong variable to record the return value of
> semihosting_trap (which is of type long, not char).

I agree with you. We should use a different variable instead of ch.

>
> > -             ret = ch > -1 ? ch : -1;
> > +             ret = ((int)ch > -1) ? ch : -1;
>
> I think this line can be removed, and the return value of
> semihosting_trap can be returned directly.

This is a legacy call where we are supposed to return -1 for failure.
(Refer, https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#extension-console-getchar-eid-0x02)

Regards,
Anup

