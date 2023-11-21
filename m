From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Nov 2023 11:01:57 +0530
Subject: Question about potential missed IPI events
In-Reply-To: <9e7edfb2-626d-1232-1c6b-f02fb8fa5131@gmail.com>
References: <35016005-5bf6-d80b-2a5f-6803afea729e@gmail.com>
 <CAK9=C2W4kTpJUiV99XPMMCtT15E3CTsHwzt7DjMjvpBrKC+TeQ@mail.gmail.com> <9e7edfb2-626d-1232-1c6b-f02fb8fa5131@gmail.com>
Message-ID: <CAAhSdy3CdRxqwPMLzZN=Yj5GBHYVX8B=CSuSvn5-EJvKCuwLHw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 21, 2023 at 10:51?AM Bo Gan <ganboing@gmail.com> wrote:
>
> On 11/20/23 8:34 PM, Anup Patel wrote:
> >>
> >> I doubt it mainly due to 2 reasons:
> >>
> >> 1. ipi_dev->ipi_clear is a writel(msip), which has __io_bw (fence w,o) I don't
> >>      think it helps preventing the writel to happen before xchg. If that happens,
> >>      it's possible that A missed C's write to ipi_type.
> >>
> >> 2. Suppose the ipi_clear() happened before xchg, from A's standpoint, it's a
> >>      write, not a read. A wasn't reading from msip, but only writing to it. I'm
> >>      not sure if A's write to msip after C's write (observed by clint) implies
> >>      A's observing the same order. A is not reading from msip, so what helps to
> >>      establish this order? Will the RVWMO global memory order help? Can we think
> >>      of clint as another hart that follows RVWMO?
> >
> > The clint HW is supposed to handle writes coming from multiple
> > harts so we can safely assume that multiple writes reaching to
> > clint will be completed in the order in which clint observes them.
> >
> > Things can only break if hart A does xchg() out-of-order before
> > writel() issued by ipi_clear() completes.
> >
> > This can be understood by an example which is as follows:
> > 1) hart A orders xchg() before writel() issued by ipi_clear()
> > 2) hart B is about to do set_bit() for hart A ipi_type but
> >      hart A does xchg() before hart B does set_bit() so
> >      hart A will not observe anything in ipi_type
> > 3) hart B does set_bit() and ipi_send() before hart A does
> >      writel() from ipi_clear()
> >
> > The above result is hart A totally missing IPI from hart B but
> > this is only possible if hart A orders xchg() before writel() from
> > ipi_clear(). This is a very very rare scenario not observed on
> > any RISC-V implementations so far but to prevent this we
> > need a matching smp_wmb() between ipi_clear() and xchg()
> > in sbi_ipi_process().
> >
>
> Hi Anup,
>
> Thank you so much for the detailed explanation. I totally get your point.
> I just have one doubt about smp_wmb. In OpenSBI, smp_wmb is RISCV_FENCE(w,w).
> If I understand correctly, it won't enforce MMIO order. Given your analysis,
> I assume you meant wmb(), which is RISCV_FENCE(ow,ow). Am I right? Or do we
> want more precise fences, such as:
>
>   RISCV_FENCE(w,o) between set_bit(ipi_type) and ipi_dev->ipi_send in Hart B
>   RISCV_FENCE(o,w) between ipi_dev->ipi_clear and xchg(ipi_type) in Hart A
>
> Let me know your thoughts, and I can make a patch and send to mailing list.

The smp_wmb() is fine between set_bit(ipi_type) and ipi_dev->ipi_send
but we should use wmb() between ipi_clear() and xchg() in sbi_ipi_process().

>
> Bo
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

