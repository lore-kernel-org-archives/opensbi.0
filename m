From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Oct 2022 11:15:27 +0530
Subject: [PATCH 3/3] lib: sbi_ecall: Add Kconfig option for each extension
In-Reply-To: <20221013142559.nzpxafcsp3yaffdp@kamzik>
References: <TYYP286MB1439D0F7EA824413E8EF63FCC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB14396945149DFFB36ADA5D8FC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20221013142559.nzpxafcsp3yaffdp@kamzik>
Message-ID: <CAAhSdy3yBO=LN6B6=dbW=WXraLtCsSgE2zpW5aJfNtEbrTAC3A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 13, 2022 at 7:56 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Oct 11, 2022 at 12:34:45AM +0800, Vivian Wang wrote:
> > For each SBI extension, we:
> >
> > - Add a Kconfig option for it
> > - Add the extension to sbi_ecall_exts only if the extension is enabled
> > - Add the corresponding sbi_ecall_* object file only if the extension is
> >   enabled
> >
> > Special cases are as follows:
> >
> > - The legacy extensions are lumped together as one 'big' extension, as
> >   has always been the case in OpenSBI code.
> > - The platform-defined vendor extensions are regarded as one extension.
> > - The Base extension cannot be disabled.
> > - sbi_ecall_replace implements multiple extensions, so it's not easy to
> >   avoid linking it in. Enable it always, and use #ifdef to
> >   disable/enable individual extensions.
>
> It's tempting to use this as an opportunity to break sbi_ecall_replace up
> into different files, but I'm not sure it's worth it.

I agree with you.

@Vivan/Drew, can one of you break-up sbi_ecall_replace.c so that
we can avoid the #ifdef in sources ?

Regards,
Anup

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

