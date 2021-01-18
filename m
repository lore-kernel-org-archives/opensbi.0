From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 18 Jan 2021 09:50:08 +0000
Subject: [PATCH] platform: template: Fix compile error
In-Reply-To: <CAOnJCUK9Tr4HinhxST7+Qrm+qo9+iYtmB8yXWc4ftD+gWWvJVw@mail.gmail.com>
References: <20210118040425.170292-1-anup.patel@wdc.com>
 <CAOnJCUK9Tr4HinhxST7+Qrm+qo9+iYtmB8yXWc4ftD+gWWvJVw@mail.gmail.com>
Message-ID: <DM6PR04MB620160D6D9845378F9B705168DA40@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 18 January 2021 11:49
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH] platform: template: Fix compile error
> 
> On Sun, Jan 17, 2021 at 8:05 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > This clint driver init functions were incorrectly used in template
> > platform which resulted in compile error. This patch fixes clint
> > driver function usage in template platform.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  platform/template/platform.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/platform/template/platform.c
> > b/platform/template/platform.c index 758e95f..5bdb186 100644
> > --- a/platform/template/platform.c
> > +++ b/platform/template/platform.c
> > @@ -107,7 +107,7 @@ static int platform_ipi_init(bool cold_boot)
> >
> >         /* Example if the generic CLINT driver is used */
> >         if (cold_boot) {
> > -               ret = clint_cold_ipi_init(&clint, NULL);
> > +               ret = clint_cold_ipi_init(&clint);
> >                 if (ret)
> >                         return ret;
> >         }
> > @@ -142,7 +142,7 @@ static int platform_timer_init(bool cold_boot)
> >
> >         /* Example if the generic CLINT driver is used */
> >         if (cold_boot) {
> > -               ret = clint_cold_timer_init(&clint);
> > +               ret = clint_cold_timer_init(&clint, NULL);
> >                 if (ret)
> >                         return ret;
> >         }
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applying this patch sooner to riscv/opensbi repo so that
we can proceed with OpenSBI v0.9 release preparations.

Regards,
Anup
