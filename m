From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 8 Nov 2022 17:36:29 +0530
Subject: [PATCH] lib: utils/serial: Fix semihosting compile error using LLVM
In-Reply-To: <19880fa58963e209de13ed962fc02e595ad294d3.camel@126.com>
References: <20221108032509.1382464-1-apatel@ventanamicro.com>
 <mvmwn85ddki.fsf@suse.de> <19880fa58963e209de13ed962fc02e595ad294d3.camel@126.com>
Message-ID: <CAK9=C2Warq49PWJkhNA=nSJ5qvQHuM=yyi2Yvn6zNZAJY4-6Pg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 8, 2022 at 3:19 PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2022-11-08???? 10:02 +0100?Andreas Schwab???
> > On Nov 08 2022, Anup Patel wrote:
> >
> > > diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> > > index 5012fa1..72bbbb3 100644
> > > --- a/lib/utils/serial/semihosting.c
> > > +++ b/lib/utils/serial/semihosting.c
> > > @@ -155,7 +155,7 @@ static int semihosting_getc(void)
> > >
> > >         if (semihosting_infd < 0)  {
> > >                 ch = semihosting_trap(SYSREADC, NULL);
> >
> > This is using the wrong variable to record the return value of
> > semihosting_trap (which is of type long, not char).
> >
> > > -               ret = ch > -1 ? ch : -1;
> > > +               ret = ((int)ch > -1) ? ch : -1;
> >
> > I think this line can be removed, and the return value of
> > semihosting_trap can be returned directly.
>
> This line is used to handle error codes, semihosting_trap may
> have multiple return values less than 0, but console_getc can
> only return -1.
>
> Suggest:
>                 ret = semihosting_trap(SYSREADC, NULL);
>                 ret = ret < 0 ? -1 : ret;

Andreas suggested a similar thing as well so I will send v2 patch.

Regards,
Anup

>
> Regards,
> Xiang W
> >
> > --
> > Andreas Schwab, SUSE Labs, schwab at suse.de
> > GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> > "And now for something completely different."
> >
>
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

