From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 27 Oct 2020 17:25:33 +0800
Subject: [PATCH] lib: sbi: Fix PMP entry detetcion mechanism
In-Reply-To: <DM6PR04MB6201491124FD2FF8D2DE70DB8D160@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <1603785263-11304-1-git-send-email-vincent.chen@sifive.com>
 <DM6PR04MB6201491124FD2FF8D2DE70DB8D160@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <CABvJ_xhhj7HXYJqGpCeNsW8St62XDUy50uJ8HFXeO9tiT=Mf9Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 27, 2020 at 4:03 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Vincent
> > Chen
> > Sent: 27 October 2020 13:24
> > To: opensbi at lists.infradead.org
> > Cc: vincent.chen at sifive.com
> > Subject: [PATCH] lib: sbi: Fix PMP entry detetcion mechanism
> >
> > The granularity of PMP access control settings is platform-specific. If the
> > granularity is greater than 4 bytes, the current mechanism will not work
> > because the return value will be forced to be granularity alignment so that
> > the returned value is not equal to the written value. This patch writes
> > PMP_ADDR_MASK to each PMP addr registers and checks the return value
> > that is unequaled to zero to identify whether this PMP entry is support or
> > not.
>
> This was initially fixed by Pragnesh for SiFive Unleashed platform and finally
> it has been fixed correctly by Atish.
>
> Can you try latest OpenSBI repo ?
>
> Regards,
> Anup
>

Sure, Thanks.
Regards,
Vincent

