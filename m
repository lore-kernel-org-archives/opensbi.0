From: Gianluca Guida <gianluca@rivosinc.com>
Date: Thu, 29 Jun 2023 15:18:45 +0100
Subject: [PATCH] lib: sbi: check A2 register in ecall_dbcn_handler.
In-Reply-To: <20230624-7cb81b92e2a280b55e61b675@orel>
References: <20230622173857.387914-1-gianluca@rivosinc.com> <20230624-7cb81b92e2a280b55e61b675@orel>
Message-ID: <CAOOZEBQvm56i2qzxvmVR0JPgPtOghwrjN0JV=z-cY5oa2QMr8g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 24, 2023 at 12:08?PM Andrew Jones <ajones@ventanamicro.com> wrote:
[...]
> >  lib/sbi/sbi_ecall_dbcn.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
> > index e0b892c..ecec027 100644
> > --- a/lib/sbi/sbi_ecall_dbcn.c
> > +++ b/lib/sbi/sbi_ecall_dbcn.c
> > @@ -34,11 +34,14 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
> >                * Based on above, we simply fail if the upper 32bits of
> >                * the physical address (i.e. a2 register) is non-zero on
> >                * RV32.
> > +                 *
> > +                 * Analogously, we fail if the upper 64bit of the
> > +                 * physical address (i.e. a2 register) is non-zero on
> > +                 * RV64.
>
> I see I'm too late, since Anup already applied, but the above lines have
> leading spaces instead of tabs.
>

I'll send a follow-up patch.

Thank you,
G.

