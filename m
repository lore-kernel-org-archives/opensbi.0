From: Minda Chen <minda.chen@starfivetech.com>
Date: Thu, 1 Feb 2024 05:38:16 +0000
Subject: [PATCH 0/5] starfive reboot cleanup & fix
In-Reply-To: <CAK9=C2WDjtb_xtC5FtqYMhB5ZY6Bb4EgaDA+_KccCDAkz+xFOg@mail.gmail.com>
References: <cover.1706705649.git.namcao@linutronix.de>
 <CAK9=C2WDjtb_xtC5FtqYMhB5ZY6Bb4EgaDA+_KccCDAkz+xFOg@mail.gmail.com>
Message-ID: <SHXPR01MB0863DF11E5652E164AF74026E643A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Wed, Jan 31, 2024 at 6:39?PM Nam Cao <namcao@linutronix.de> wrote:
> >
> > This series:
> >   - add gracefully error handling when reboot devices are not present
> >   - correct a device tree compatibility string
> >   - some minor cleanup
> >
> > This series complements my other series:
> > http://lists.infradead.org/pipermail/opensbi/2024-January/006300.html
> >
> > Nam Cao (5):
> >   platform: starfive: remove redundant compatibility check in pmic_ops
> >   platform: starfive: rename "stf,axp15060-regulator" ->
> >     "x-powers,axp15060"
> >   platform: starfive: drop "compatible" from struct pmic
> >   platform: starfive: return error if needed devices are not present
> >   platform: starfive: call starfive_jh7110_inst_init() in
> >     pm_reset_init()
> 
> Can someone from StarFive review and test this series ?
> 
> Regards,
> Anup
> 
Let me review these. But I don't receive this series patch.

Minda
> >
> >  platform/generic/starfive/jh7110.c | 49 ++++++++++++++++--------------
> >  1 file changed, 27 insertions(+), 22 deletions(-)
> >
> > --
> > 2.39.2
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
