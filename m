From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Nov 2021 18:36:39 +0530
Subject: [PATCH v2 5/5] lib: utils/reset: Add generic da9063 reset driver
In-Reply-To: <20211103151335.303fea96@redslave.neermore.group>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <20211015131925.22585-6-nikita.shubin@maquefel.me>
 <24ca9d4a-02c0-0d03-58da-3510162df2be@canonical.com>
 <9953e984-dffa-400a-259f-b82a19d06a6f@canonical.com>
 <20211103105940.4c20e7bc@redslave.neermore.group>
 <1faef420-1516-fee0-058a-210176ab4703@canonical.com>
 <20211103151335.303fea96@redslave.neermore.group>
Message-ID: <CAAhSdy0FfXYyf4iu8NLiDkZ4hyPW57kePiicJ7ALCFxVxZJJVw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 3, 2021 at 5:43 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> On Wed, 3 Nov 2021 13:07:29 +0100
> Heinrich Schuchardt <heinrich.schuchardt@canonical.com> wrote:
>
> > > After rebooting with Linux reboot:
> > > => reset
> > > resetting ...
> > >
> > > All okay and that's means that it's not a full reset, I2C was
> > > initialised by linux, and not resetted.
> >
> > Doesn't this imply that the I2C initialization code should be added
> > to OpenSBI?
> >
>
> Without any doubt.

I am okay having a simple I2C initialization.

This series will be the last thing for OpenSBI v1.0 release
so please update this series soon.

Regards,
Anup

>
> > Best regards
> >
> > Heinrich
> >
> > >
> > > However if we arm the clock and go shutdown:
> > >
> > > sh -c "echo `date '+%s' -d '+ 1 minutes'` >
> > > /sys/class/rtc/rtc0/wakealarm" shutdown
> > > shutdown
> > >
> > > We get:
> > > => reset
> > > resetting ...
> > > da9063_system_reset: chip is not da9063 PMIC
> > >
> > > So "reset" with RTC is indeed a full reset...
> > >
> > > All above also means that "sacrificing" RTC means sacrificing user
> > > setted wakeup ALARM's.
> > >
> > > May be it's worth splitting reset into WARM_REBOOT, COLD_REBOOT with
> > > WARM reboot is going through method proposed by Alexandre and COLD
> > > reboot via RTC, and explicitly specify that COLD reboot WILL
> > > overwrite ALARM setting ?
> > >
> > > What do you think about this ?
> > >
> > >>
> > >> Best regards
> > >>
> > >> Heinrich
> > >
> >
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

