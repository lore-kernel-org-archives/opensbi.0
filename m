From: Xiang W <wxjstz@126.com>
Date: Fri, 16 Jun 2023 13:54:58 +0800
Subject: [PATCH] lib: sbi: Hang when next mode not support
In-Reply-To: <CAAhSdy1Ls1tyT3BEx+ZBYcu+7QWAxBAuUdcnjYqbhLFEr8Di=g@mail.gmail.com>
References: <20230616024054.739117-1-wxjstz@126.com>
	 <CAAhSdy1Ls1tyT3BEx+ZBYcu+7QWAxBAuUdcnjYqbhLFEr8Di=g@mail.gmail.com>
Message-ID: <0072164e5f7049673831e46ea8d6076e0005a9a3.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-06-16???? 08:34 +0530?Anup Patel???
> On Fri, Jun 16, 2023 at 8:11?AM Xiang W <wxjstz@126.com> wrote:
> > 
> > The original code may let the hart that does not support next mode
> > enter init_warmboot. Fix this.
> > 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> 
> For platforms (like SiFive Unleashed/Unmatched), we have E-core
> without S-mode. The current approach allows users to run some
> piece software on E-core using OpenSBI domains.
Yes, at sbi_domain_finalize can fix the domain via fdt and
let E-core run other stuff.

Thank,
Xiang
> 
> NACK to this patch because it breaks OpenSBI domains
> 
> Regards,
> Anup
> 
> > ---
> > ?lib/sbi/sbi_init.c | 8 ++++----
> > ?1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> > index 423e6d8..d148bd2 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -532,10 +532,11 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
> > ??????????????? if (misa_extension('U'))
> > ??????????????????????? next_mode_supported = true;
> > ??????????????? break;
> > -?????? default:
> > -?????????????? sbi_hart_hang();
> > ??????? }
> > 
> > +?????? if (next_mode_supported == false)
> > +?????????????? sbi_hart_hang();
> > +
> > ??????? /*
> > ???????? * Only the HART supporting privilege mode specified in the
> > ???????? * scratch->next_mode should be allowed to become the coldboot
> > @@ -547,8 +548,7 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
> > ???????? */
> > 
> > ??????? if (sbi_platform_cold_boot_allowed(plat, hartid)) {
> > -?????????????? if (next_mode_supported &&
> > -?????????????????? atomic_xchg(&coldboot_lottery, 1) == 0)
> > +?????????????? if (atomic_xchg(&coldboot_lottery, 1) == 0)
> > ??????????????????????? coldboot = true;
> > ??????? }
> > 
> > --
> > 2.39.2
> > 
> > 
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

