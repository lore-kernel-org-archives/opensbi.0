From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue, 26 Oct 2021 17:17:58 +0300
Subject: [PATCH v2 5/5] lib: utils/reset: Add generic da9063 reset driver
In-Reply-To: <9953e984-dffa-400a-259f-b82a19d06a6f@canonical.com>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <20211015131925.22585-6-nikita.shubin@maquefel.me>
 <24ca9d4a-02c0-0d03-58da-3510162df2be@canonical.com>
 <9953e984-dffa-400a-259f-b82a19d06a6f@canonical.com>
Message-ID: <20211026171758.18e54e37@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Heinrich.

On Tue, 26 Oct 2021 11:40:13 +0200
Heinrich Schuchardt <heinrich.schuchardt@canonical.com> wrote:

> On 10/26/21 10:04, Heinrich Schuchardt wrote:
> > On 10/15/21 15:19, Nikita Shubin wrote:  
> >> From: Nikita Shubin <n.shubin@yadro.com>
> >>
> >> da9063 PMIC can be used to reset/shutdown the
> >> Sifive Unmatched board.
> >>
> >> shutdown is done simply by writing SHUTDOWN bit to
> >> DA9063_REG_CONTROL_F register.
> >>
> >> reset via setting WAKEUP bit in DA9063_REG_CONTROL_F
> >> register followed by masking POWER and POWER1 domains
> >> and setting STANDBY bit in DA9063_REG_CONTROL_A,
> >> originally discovered by Alexandre Ghiti on linux-riscv
> >> maillists.
> >>
> >> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>  
> 
> Alexandre and I had the same finding for the driver:
> 
> Reset works fine after a hard reset (via the reset button) when
> coming from Linux.
> 
> After a poweroff reset in U-Boot does not work.

Thank you for testing!

> 
> Our expectation is that OpenSBI ensures that the SBI system reset 
> extension works upon entry into the next firmware stage without 
> requiring any further initialization by that software.
> 
> When a reset is requested you should make not presumption about the 
> state of the system. Simply fully initialize the da9063 state to 
> guarantee a successful reset.

I think you are right and we shouldn't rely on someone already
initialized it for us. 

Indeed i should investigate and expiriment some more.

