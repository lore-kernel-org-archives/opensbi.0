From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 28 Sep 2021 13:43:38 +0200
Subject: [PATCH 1/4] lib: utils/i2c: Add generic I2C configuration library
In-Reply-To: <20210928135145.5acef307@redslave.neermore.group>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <20210924113347.3576-2-nikita.shubin@maquefel.me>
 <fabe3560-316c-2f62-6867-f4fc6768d15c@ghiti.fr>
 <20210928135145.5acef307@redslave.neermore.group>
Message-ID: <CA+zEjCtG9EF2OA_qto6VAyeW4h2nmEatWX=LDTMVb_0wMEHxzA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 28, 2021 at 12:52 PM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:
>
> Hi Alexander,
>
> Thank you for your attention.
>
> On Mon, 27 Sep 2021 17:41:18 +0200
> Alexandre ghiti <alex@ghiti.fr> wrote:
>
> > And I don't think the configure callback is even needed: it should be
> > done at the initialization of the adapter, in its own driver, I don't
> > think the device should care about that.
>
> As long as i2c frame is supposed to do something more complicated then
> sending a few bytes at the very end and even, may be, at the start of
> booting, it is definitely required to configure - setup clocks, enable
> the device.

I agree that some configurations need to be done but the i2c device
should not care about that, it should only ask to send/recv, the
adapter should do the necessary configuration behind the scenes.

>
> Yours,
> Nikita Shubin
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

