From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Wed, 29 Sep 2021 12:14:11 +0300
Subject: [PATCH 1/1] lib: utils: identify supported GPIO reset methods
In-Reply-To: <CAAhSdy1oEFKw6iE0Dc=cmRjhQWV_i6JvaB6u4P3ayWzKKXiXNw@mail.gmail.com>
References: <20210928114246.46596-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy1oEFKw6iE0Dc=cmRjhQWV_i6JvaB6u4P3ayWzKKXiXNw@mail.gmail.com>
Message-ID: <20210929121411.4af6684d@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 29 Sep 2021 09:46:55 +0530
Anup Patel <anup@brainfault.org> wrote:

> +Nikita
> 
> On Tue, Sep 28, 2021 at 5:13 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> > The GPIO reset driver supports reset and poweroff. But not all
> > boards support both. gpio_system_reset_check() must detect this
> > situation.
> >
> > Signed-off-by: Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com>  
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> 
> I had mentioned on the PMIC reset series that we need to improve
> the sbi_system.h device registration such that reset drivers can
> register a reset device for a range of reset types. This will allow
> separate reset drivers (e.g. PMIC+GPIO) for SiFive Unmatched.
> Also, reset_check() callback will not be required anymore.
> 
> Regards,
> Anup

Looks good to me, however

> > +       /* hang !!! */
> > +       sbi_hart_hang();
> >  }

Heinrich do we really need to hang here ?

Despite the gpio_system_reset should never reach the end of function, 
i remember you talked something about returning from function back to
the sbi_system_reset.

Yours,
Nikita Shubin


