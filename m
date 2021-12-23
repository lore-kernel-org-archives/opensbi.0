From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Dec 2021 10:56:02 +0530
Subject: [PATCH] firmware: Move memcpy/memset mapping to fw_base.S
In-Reply-To: <5B686325-FB9E-4784-A25D-E57A74E3E9BF@jrtc27.com>
References: <20211222124444.995355-1-anup.patel@wdc.com>
 <5B686325-FB9E-4784-A25D-E57A74E3E9BF@jrtc27.com>
Message-ID: <CAAhSdy24bh4iYosozcJDVeC=TeiMNzXk2+H7qQdCB2whbZzRTw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 22, 2021 at 6:25 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 22 Dec 2021, at 12:44, Anup Patel <anup.patel@wdc.com> wrote:
> >
> > Some of the external firmwares using OpenSBI as library are facing
> > issues with the weak memcpy() and memset() aliases in libsbi.a so
> > we move these to fw_base.S. This way mapping of implicit memcpy()
> > or memset() calls to sbi_memcpy() or sbi_memset() will only be done
> > for OpenSBI firmwares.
> > (Refer, https://github.com/riscv-software-src/opensbi/issues/234)
>
> Consumers that want to override the definitions in libsbi should just
> make sure -lsbi/libsbi.a appears after the object or library containing
> the strong definition.

I agree with you. This is definitely a link-time ordering issue for external
firmwares. Ideally, external firmware projects should fix this at their end.

>
> If you really want to support people that can?t get their link order
> right (which then hurts people who *do* and want to just use libsbi?s
> memcpy/memset) then these should be strong aliases and/or defined in C;
> there?s zero reason for it to be in assembly and, as a downstream that
> would need to modify this code if written in assembly, hurts
> portability. And if for some reason you still insist on assembly then
> you should be using tail here, not j, as j is only supported for jumps
> within a file, not across files.

I am certainly not happy in moving this to fw_base.S but currently
OpenSBI firmwares will only use memcpy/memset symbols implicitly
when "-Os" compile option is used so by default this change does
not impact users of OpenSBI firmwares.

At this point, the number of OpenSBI firmware users is much more
than the number of libsbi.a users so eventually we have to be more
strict with external firmwares otherwise such things will continue to
add restrictions on things we can do in libsbi.a.

I want to release OpenSBI v1.0 this week so for the time being I will
will replace the use of "j" with "tail" and post a v2. Post OpenSBI v1.0,
release, I will try to find a better solution (may be add C sources for
firmware and move it there).

Regards,
Anup

>
> Jess
>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> > firmware/fw_base.S   | 14 ++++++++++++++
> > lib/sbi/sbi_string.c |  6 ------
> > 2 files changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> > index 1569e60..6197a7f 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -561,6 +561,20 @@ fw_platform_init:
> >       add     a0, a1, zero
> >       ret
> >
> > +     /* Map implicit memcpy() added by compiler to sbi_memcpy() */
> > +     .section .text
> > +     .align 3
> > +     .globl memcpy
> > +memcpy:
> > +     j       sbi_memcpy
> > +
> > +     /* Map implicit memset() added by compiler to sbi_memset() */
> > +     .section .text
> > +     .align 3
> > +     .globl memset
> > +memset:
> > +     j       sbi_memset
> > +
> > .macro        TRAP_SAVE_AND_SETUP_SP_T0
> >       /* Swap TP and MSCRATCH */
> >       csrrw   tp, CSR_MSCRATCH, tp
> > diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
> > index c67c02e..c87bce9 100644
> > --- a/lib/sbi/sbi_string.c
> > +++ b/lib/sbi/sbi_string.c
> > @@ -122,9 +122,6 @@ void *sbi_memset(void *s, int c, size_t count)
> >       return s;
> > }
> >
> > -void *memset(void *s, int c, size_t count) \
> > -__attribute__((weak, alias("sbi_memset")));
> > -
> > void *sbi_memcpy(void *dest, const void *src, size_t count)
> > {
> >       char *temp1       = dest;
> > @@ -138,9 +135,6 @@ void *sbi_memcpy(void *dest, const void *src, size_t count)
> >       return dest;
> > }
> >
> > -void *memcpy(void *dest, const void *src, size_t count) \
> > -__attribute__((weak, alias("sbi_memcpy")));
> > -
> > void *sbi_memmove(void *dest, const void *src, size_t count)
> > {
> >       char *temp1       = (char *)dest;
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>

