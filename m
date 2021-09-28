From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue, 28 Sep 2021 13:56:24 +0300
Subject: [PATCH 4/4] lib: utils/reset: Add generic da9063 reset driver
In-Reply-To: <ff4dc88f-ff92-4300-29d5-d998c991731a@ghiti.fr>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <20210924113347.3576-5-nikita.shubin@maquefel.me>
 <ff4dc88f-ff92-4300-29d5-d998c991731a@ghiti.fr>
Message-ID: <20210928135624.157a4ced@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Alexander!

On Mon, 27 Sep 2021 17:42:24 +0200
Alexandre ghiti <alex@ghiti.fr> wrote:

> On 9/24/21 1:33 PM, Nikita Shubin wrote:
> > From: Nikita Shubin <n.shubin@yadro.com>
> >
> > da9063 PMIC can be used to reset/shutdown the
> > Sifive Unmatched board.
> >
> > shutdown is done simply by writing SHUDOWN bit to
> > DA9063_REG_CONTROL_F register.  
> 
> 
> s/SHUDOWN/SHUTDOWN
> 
> 
> >
> > reset via setting WAKEUP bit in DA9063_REG_CONTROL_F
> > register followed by masking POWER and POWER1 domains
> > and setting STANDBY bit in DA9063_REG_CONTROL_A,
> > originally discovered by Alexandre Ghiti on linux-riscv
> > maillists.  
> 
> 
> Someone from Dialog answered this patch and will get back to us after
> talking to the hardware team.

You mean Adam Thomson - right ? Looking forward to his answer. Anyway
it seems that reseting via watchdog is a more reliable way to him. May
this is really a better way.

Yours,
Nikita Shubin


