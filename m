From: Jan Remeš <jan.remes@codasip.com>
Date: Wed, 1 Jun 2022 17:45:45 +0200
Subject: console putchar/getchar ecalls and sbi v02
In-Reply-To: <CAK9=C2XaYvXqkSeD8ieWYswTdgygVgXZF6PgdiUEqvG2eLAi_Q@mail.gmail.com>
References: <2594568.q0ZmV6gNhb@diego> <CAK9=C2XRBgtb--K8o7geFxWjvza6ztNX-oMObwVnsUYz28+0+Q@mail.gmail.com>
 <1848033.eGJsNajkDb@diego> <CAK9=C2XaYvXqkSeD8ieWYswTdgygVgXZF6PgdiUEqvG2eLAi_Q@mail.gmail.com>
Message-ID: <CALXH3=+c4hprea3M8mQGV_TzZ+yqeEbVa32DDSR58tnB-dgyCw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 1, 2022 at 5:22 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Wed, Jun 1, 2022 at 8:25 PM Heiko St?bner <heiko@sntech.de> wrote:
> >
> > Hi Anup,
> >
> > Am Mittwoch, 1. Juni 2022, 16:46:17 CEST schrieb Anup Patel:
> > > Hi Heiko,
> > >
> > > On Wed, Jun 1, 2022 at 8:00 PM Heiko St?bner <heiko@sntech.de> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I just stumbled across the issue that the console_putchar and _getchar
> > > > ecalls are only part of the v0.1 specification and the spec states that
> > > > they "are expected to be deprecated; they have no replacement."
> > > >
> > > > As I was using that for their earlycon functionality for a bit and haven't
> > > > found the reasoning behind the deprecation so far, I guess I'm curious
> > > > why it is going away :-) .
> > > >
> > > > The commit adding the spec-note [0] also gives no explanation for it
> > > > and Google also wasn't helpful.
> > > >
> > > > Any hints?
> > >
> > > Almost all SBI v0.1 calls have been replaced by SBI v0.2 extensions,
> > > except console_putchar() and _getchar() calls.
> > >
> > > The console_putchar() was certainly quite useful for early prints but
> > > since it is going to be deprecated, we need something equivalent or
> > > better in the SBI spec.
> > >
> > > I do have a draft "SBI debug console" proposal which is based on
> > > shared memory and replaces the SBI v0.1 console_putchar(). I will
> > > send-out this proposal soon.
> >
> > Hmm, that sounds great for the earlycon-portion, but could you maybe
> > also think about a really simple putchar option like the current one?
> >
> > Background is that the current putchar works in all conditions, so even
> > in the earliest kernel startup code I could manually put in a
> > sbi_console_putchar() call to track down where a hang was.
> >
> > That even worked in the early startup assembly when doing the ecall
> > manually.
> >
> > This is extremely helpful when you are on "consumer-grade"
> > hardware were other debug options are somewhat limited.
>
> Setting up shared memory is really simple. In fact, it is just one
> additional call for assembly level debugging.
>
> Once the shared memory is set up, users can print any number
> of characters in one SBI call from assembly sources.
>
> Regards,
> Anup
>
There is value in putchar() that Just Works. But I guess it could be
implemented as a convenience macro/function on top of the
shared-memory ecall implementation?

Something like:

void *SBI_DEBUG_CONSOLE_MEM; /* Assumed pointer used for setting up
the shared memory */

void sbi_utils_putchar(char c)
{
    char buffer[2];
    void *oldbuf;

    oldbuf = SBI_DEBUG_CONSOLE_MEM;
    SBI_DEBUG_CONSOLE_MEM = buffer;
    buffer[0] = c;
    buffer[1] = '\0';
    <call new ecall>

    SBI_DEBUG_CONSOLE_MEM = oldbuf;
}

Regards,
  Jan

> >
> >
> > Thanks
> > Heiko
> >
> >
> >
> > > >
> > > >
> > > > Thanks
> > > > Heiko
> > > >
> > > >
> > > >
> > > > [0] https://github.com/riscv-non-isa/riscv-sbi-doc/commit/705e9556d25dc070926b99f8ccbcdc5073407447
> > > >
> > > >
> > >
> >
> >
> >
> >
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

