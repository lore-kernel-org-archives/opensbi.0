From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 Nov 2024 21:11:57 +0530
Subject: [PATCH 0/2] lib: sbi: fixes a few SSE errors
In-Reply-To: <8c9e00c7-c358-4a6e-b69f-ac21f64575d8@rivosinc.com>
References: <20241125105303.1113607-1-cleger@rivosinc.com> <CAAhSdy2RVh63sp=Yh7=hOuoOFnMmTsyA6D_3D6e_9qx38YT9cg@mail.gmail.com>
 <8c9e00c7-c358-4a6e-b69f-ac21f64575d8@rivosinc.com>
Message-ID: <CAAhSdy2f+x1e-aDEsA9cKyzQmmTDNQCHn0sRzoRmEiJQH285Yg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 29, 2024 at 8:11?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
>
>
> On 29/11/2024 04:14, Anup Patel wrote:
> > On Mon, Nov 25, 2024 at 4:24?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
> >>
> >> While reviewing kvm-unit-tests, Andrew Jones found a few implementation
> >> errors. This small series fixes them.
> >>
> >> Cl?ment L?ger (2):
> >>   lib: sbi: fix GLOBAL_PLAT_DEFINE
> >>   lib: sbi: sse: Fix a6 and a7 register content upon injection
> >
> > Do you have corresponding changes in Linux SSE implementation ?
>
> Yes, see my branch on github, I just rebased it on master this week:
>
> https://github.com/rivosinc/linux/tree/dev/cleger/sse

Thanks, I will cherry pick from your branch.

>
>
> >
> > Recently, we had found few more issues and fixed the Linux SSE
> > implementation which is available in dev-upstream branch at:
> > https://github.com/ventanamicro/linux.git
> >
> > Particularly, the Linux SSE entry/exit was not saving and restoring
> > sscratch CSR in all paths which caused the kernel to crash in certain
> > cases. The above mentioned branch already has the fix for it.
>
> Yeah, I already fixed that in june and it was pushed on my branch
> dev/cleger/sse on github at that time. I also have a KVM SSE
> implementation on another branch.
>
> I'll submit Linux SSE for review next week and I'have backported the PM
> notifier/ mask/unmask stuff from your branch. Whom did that work so I
> can credit him with a Co-Developed-by tag ?

It was Himanshu (CC'ed).

>
> I did not saw any other modifications though. For GHES, this seems to be
> a separate commit so I'll let that to Himanchu of course.

There was not much change in GHES related code.

Once you post an RFC for Linux SSE, Himanshu can post another RFC
for GHES based on your RFC.

Regards,
Anup

>
> Thanks,
>
> Cl?ment
>
> >
> > Regards,
> > Anup
>

