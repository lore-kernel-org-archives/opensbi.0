From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 09:57:29 +0530
Subject: [PATCH v2] lib: sbi_domain: Avoid overwriting coldboot hart's scratch->arg1
In-Reply-To: <CAEUhbmU4Wf=7WtKhQe5Y5PWC3T3p8coL6NnUOmFP94EzcyVGYQ@mail.gmail.com>
References: <20230223095348.1723380-1-bmeng@tinylab.org> <CAAhSdy3JXUPXUO4dcwstXWSpXS3YLKe=6FjvRA6J3wCPj4BW1w@mail.gmail.com>
 <CAEUhbmU4Wf=7WtKhQe5Y5PWC3T3p8coL6NnUOmFP94EzcyVGYQ@mail.gmail.com>
Message-ID: <CAAhSdy3=UcSAXgyp-7SpDTkHoyhOJBL6JZ0WzSWaPARQS3ePFg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 27, 2023 at 7:39 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Anup,
>
> On Fri, Feb 24, 2023 at 12:50?PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Thu, Feb 23, 2023 at 3:24 PM Bin Meng <bmeng@tinylab.org> wrote:
> > >
> > > In sbi_domain_finalize(), when locating the coldboot hart's domain,
> > > the coldboot hart's scratch->arg1 will be overwritten by the domain
> > > configuration. scratch->arg1 holds the FDT address of the coldboot
> > > hart, and in later boot process OpenSBI codes still read the FDT
> > > here and there, which leads to a crash.
> > >
> > > To fix this, we change fdt_get_address() to return root domain's
> > > next_arg1 as the FDT pointer.
> > >
> > > Resolves: https://github.com/riscv-software-src/opensbi/issues/281
> > > Fixes: b1678af210dc ("lib: sbi: Add initial domain support")
> > > Reported-by: Marouene Boubakri <marouene.boubakri@nxp.com>
> > > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> >
> > Looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Thanks for the review!
>
> This v2 was superseded by v3 @
> https://patchwork.ozlabs.org/project/opensbi/list/?series=343310

Ahh okay, thanks for pointing.

Regards,
Anup

