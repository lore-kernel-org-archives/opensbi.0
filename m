From: Xiang W <wxjstz@126.com>
Date: Mon, 19 Feb 2024 18:01:28 +0800
Subject: [PATCH 1/1] lib: sbi_hsm: Restor hart state to stop when fails
 to start
In-Reply-To: <SH0PR01MB0841D6EDDEA711F2D14C309EF951A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20240219071406.41703-1-joshua.yeong@starfivetech.com>
	 <fd9ed70b05fa883b9497b592c0ddd906dd70fdc1.camel@126.com>
	 <SH0PR01MB0841D6EDDEA711F2D14C309EF951A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
Message-ID: <2cd3f4bb21bd2ae6e564d7edebb55bd6baa52194.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-02-19???? 09:44 +0000?Joshua Yeong???
> On Mon, Feb 19, 2024 at 05:39:26PM +0800, Joshua Yeong <joshua.yeong@starfivetech.com> wrote:
> > ? 2024-02-19???? 15:14 +0800?Joshua Yeong???
> > > Hart state should change back to hart stop when
> > > hsm_device_hart_start() or sbi_ipi_raw_send() fails to perform hart start.
> > > 
> > > Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> > > ---
> > > ?lib/sbi/sbi_hsm.c | 4 ++++
> > > ?1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c index
> > > 3d60ceb..be48d64 100644
> > > --- a/lib/sbi/sbi_hsm.c
> > > +++ b/lib/sbi/sbi_hsm.c
> > > @@ -360,6 +360,10 @@ int sbi_hsm_hart_start(struct sbi_scratch
> > > *scratch,
> > > 
> > > ?	if (!rc)
> > > ?		return 0;
> > > +
> > > +	/* If it fails to start, change hart state back to stop */
> > > +	__sbi_hsm_hart_change_state(hdata,
> > SBI_HSM_STATE_START_PENDING,
> > > +				??? SBI_HSM_STATE_STOPPED);
> > 
> > This is not needed. Because if hdata->state is not equal to
> > SBI_HSM_STATE_STOPPED, SBI_HSM_STATE_START_PENDING will not be
> > written.
> > 
> > Regards,
> > Xiang W
> 
> The scenario is that the Hart is in SBI_HSM_STATE_STOPPED and then it switches to SBI_HSM_STATE_START_PENDING,
> but it got stuck in SBI_HSM_STATE_START_PENDING if it fails to start. The hart's state has impact on
> other process where hart's state is taken into consideration, for example system suspend.

Sorry. I mistakenly thought that these codes were added after the err tag.

Signed-off-by: Xiang W <wxjstz@126.com>
> 
> Regards,
> Joshua 
> 
> > 
> > > ?err:
> > > ?	hsm_start_ticket_release(hdata);
> > > ?	return rc;
> > > --
> > > 2.25.1
> > > 
> > > 
> 


