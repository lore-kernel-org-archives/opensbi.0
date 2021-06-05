From: Stanislaw Kardach <kda@semihalf.com>
Date: Sat, 5 Jun 2021 18:17:05 +0200
Subject: [v2,05/15] lib: sbi: Disable m/scounteren & enable mcountinhibit
In-Reply-To: <20210527003044.889681-6-atish.patra@wdc.com>
Message-ID: <20210605161705.pdk4co4fruyvzhhc@toster>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> What about a setting MINH bit in sscofpmf extension[1] implementation?

Sorry for getting late to the discussion. I think it needs to be
re-iterated that CY and IR are not part of Sscofpmf extension. There are
no corresponding mhpmevent registers for them. I asked Greg about this
in a private thread and if I understood it correctly, the reason for not
tackling CY and IR is that it would cause the extension to fall out of
the fast-track process.

So all in all, Sscofpmf will not be enough to tackle the sampling of
neither of those two. Unless there will be a copy of those counters in
mhpmcounters.

--
Best Regards,
Stan Kardach


