From: Heiko Stübner <heiko@sntech.de>
Date: Wed, 01 Jun 2022 16:55:33 +0200
Subject: console putchar/getchar ecalls and sbi v02
In-Reply-To: <CAK9=C2XRBgtb--K8o7geFxWjvza6ztNX-oMObwVnsUYz28+0+Q@mail.gmail.com>
References: <2594568.q0ZmV6gNhb@diego> <CAK9=C2XRBgtb--K8o7geFxWjvza6ztNX-oMObwVnsUYz28+0+Q@mail.gmail.com>
Message-ID: <1848033.eGJsNajkDb@diego>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

Am Mittwoch, 1. Juni 2022, 16:46:17 CEST schrieb Anup Patel:
> Hi Heiko,
> 
> On Wed, Jun 1, 2022 at 8:00 PM Heiko St?bner <heiko@sntech.de> wrote:
> >
> > Hi,
> >
> > I just stumbled across the issue that the console_putchar and _getchar
> > ecalls are only part of the v0.1 specification and the spec states that
> > they "are expected to be deprecated; they have no replacement."
> >
> > As I was using that for their earlycon functionality for a bit and haven't
> > found the reasoning behind the deprecation so far, I guess I'm curious
> > why it is going away :-) .
> >
> > The commit adding the spec-note [0] also gives no explanation for it
> > and Google also wasn't helpful.
> >
> > Any hints?
> 
> Almost all SBI v0.1 calls have been replaced by SBI v0.2 extensions,
> except console_putchar() and _getchar() calls.
> 
> The console_putchar() was certainly quite useful for early prints but
> since it is going to be deprecated, we need something equivalent or
> better in the SBI spec.
> 
> I do have a draft "SBI debug console" proposal which is based on
> shared memory and replaces the SBI v0.1 console_putchar(). I will
> send-out this proposal soon.

Hmm, that sounds great for the earlycon-portion, but could you maybe
also think about a really simple putchar option like the current one?

Background is that the current putchar works in all conditions, so even
in the earliest kernel startup code I could manually put in a
sbi_console_putchar() call to track down where a hang was.

That even worked in the early startup assembly when doing the ecall
manually. 

This is extremely helpful when you are on "consumer-grade"
hardware were other debug options are somewhat limited.


Thanks
Heiko



> >
> >
> > Thanks
> > Heiko
> >
> >
> >
> > [0] https://github.com/riscv-non-isa/riscv-sbi-doc/commit/705e9556d25dc070926b99f8ccbcdc5073407447
> >
> >
> 





