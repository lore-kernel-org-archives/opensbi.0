From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Sep 2021 21:39:09 +0530
Subject: [PATCH 0/4] reboot SiFive Unmatched via PMIC
In-Reply-To: <20210924190641.0da298f4@redslave.neermore.group>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <BCDA27E8-DCA4-4621-8E7C-D0DD8632C710@jrtc27.com>
 <AE4ED4C2-7921-4CF2-A813-FDF25778F855@wdc.com>
 <20210924190641.0da298f4@redslave.neermore.group>
Message-ID: <CAAhSdy3DLHwm=sdTB=M5wVpDxMYQrLbBVE0dU6fkVCnmjEGpWA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 24, 2021 at 9:36 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> On Fri, 24 Sep 2021 16:02:07 +0000
> Anup Patel <Anup.Patel@wdc.com> wrote:
>
> > We need to improve sbi_system.h APIs so that platform/drivers can
> > register callback for particular reset types. This will help reset
> > types provided different reset drivers and we can use GPIO (for
> > poweroff)
> > + DA9063 (for reset) on SiFive Unmatched.
>
> It's hard to disagree with this. With no one objecting - i am eager to
> look into this.

Sure, go ahead and include this as separate patches in your next
revision. You will have to update existing reset drivers as well.

>
> Moreover i noticed that with no reset available at all the boot fails
> with no visible objections.

Can you elaborate further ?

>
> Yours,
> Nikita Shubin
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

