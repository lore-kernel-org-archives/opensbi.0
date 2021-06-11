From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 11 Jun 2021 08:45:48 +0000
Subject: [v2,05/15] lib: sbi: Disable m/scounteren & enable mcountinhibit
In-Reply-To: <20210605161705.pdk4co4fruyvzhhc@toster>
References: <20210527003044.889681-6-atish.patra@wdc.com>
 <20210605161705.pdk4co4fruyvzhhc@toster>
Message-ID: <CO6PR04MB781245C21DACF828B45D44E48D349@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Stanislaw
> Kardach
> Sent: 05 June 2021 21:47
> To: Atish Patra <Atish.Patra@wdc.com>
> Cc: opensbi at lists.infradead.org
> Subject: [v2,05/15] lib: sbi: Disable m/scounteren & enable mcountinhibit
> 
> > What about a setting MINH bit in sscofpmf extension[1] implementation?
> 
> Sorry for getting late to the discussion. I think it needs to be re-iterated that
> CY and IR are not part of Sscofpmf extension. There are no corresponding
> mhpmevent registers for them. I asked Greg about this in a private thread and
> if I understood it correctly, the reason for not tackling CY and IR is that it
> would cause the extension to fall out of the fast-track process.
> 
> So all in all, Sscofpmf will not be enough to tackle the sampling of neither of
> those two. Unless there will be a copy of those counters in mhpmcounters.

Even if CY and IR are not part of Sscofpmf extension, we still have mechanism
to start/stop these counters via mcountinhibit so software (Kernel and
and Hypervisors) can use SBI PMU calls to start/stop these counters only
for Processes/Guest/VMs that have explicitly requested it.

To address this nature of CY and IR, the filter flags of SBI PMU config matching
call are defined as optional for the SBI implementation so these filter flags can
be ignored for CY and IR counters.

Regards,
Anup

> 
> --
> Best Regards,
> Stan Kardach
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

