From: Leo Liang <ycliang@andestech.com>
Date: Tue, 19 Oct 2021 16:55:04 +0800
Subject: [OpenSBI] rfence related question
In-Reply-To: <CAOnJCUJrnMi8zS-+8aAOdGQEn0YRBaUBn3xXH1LPQK2n_56anQ@mail.gmail.com>
References: <YWf7GLATY/YQUeq0@ubuntu02>
 <CAOnJCUJrnMi8zS-+8aAOdGQEn0YRBaUBn3xXH1LPQK2n_56anQ@mail.gmail.com>
Message-ID: <YW6H6BqLTV1UyYto@ubuntu02>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 15, 2021 at 12:45:19PM -0700, Atish Patra wrote:
> On Thu, Oct 14, 2021 at 2:41 AM Leo Liang <ycliang@andestech.com> wrote:
> >
> > Hi,
> >
> > I am studying the rfence part of OpenSBI recently.
> >
> > From what I understand the mechanism of the IPI framework is
> > to do "update" to update the IPI information for remote harts,
> > and then send IPI through "ipi_dev" device to remote harts sequentially.
> >
> > After the first IPI is sent (let's say from hart 0 to hart 1),
> > hart 0 waits in the "sync" for the remote hart(hart 1) to do "process".
> > Hart 0 waits until the per hart tlb_sync flag is set from the remote hart(hart1) after "process" is done,
> > and then keep on sending the next IPI to hart 2, and then hart 3 ... etc.
> >
> > If I understand it correctly, then would the following scenario have the possibility to occur?
> >
> > In Linux, Hart 0 executes remote I cache flush instruction and sends IPI to hart 1;
> > At the meantime, hart 2 executes the same instruction and tries to send IPI to hart 0.
> >
> > Both hart 0 and hart 2 step into m-mode, their mstatus.mie are disabled,
> > so, when hart 0 tries to send IPI to hart 2 and wait for the sync, deadlock happens.
> > Hart 0 is waiting for hart 2 and hart 2 is also waiting for hart 0 indefinitely because the interrupts being disabled.
> >
> > Is this case likely to happen?
> >
> 
> Nope because each hart uses a busy loop and consume the pending IPIs
> 
> https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_tlb.c#L268
>
Hi Atish,

Got it! Thanks for the pointer!

Best regards,
Leo
> > Best regards,
> > Leo
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 
> 
> -- 
> Regards,
> Atish

