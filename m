From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue, 28 Sep 2021 13:51:45 +0300
Subject: [PATCH 1/4] lib: utils/i2c: Add generic I2C configuration library
In-Reply-To: <fabe3560-316c-2f62-6867-f4fc6768d15c@ghiti.fr>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <20210924113347.3576-2-nikita.shubin@maquefel.me>
 <fabe3560-316c-2f62-6867-f4fc6768d15c@ghiti.fr>
Message-ID: <20210928135145.5acef307@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Alexander,

Thank you for your attention.

On Mon, 27 Sep 2021 17:41:18 +0200
Alexandre ghiti <alex@ghiti.fr> wrote:

> And I don't think the configure callback is even needed: it should be
> done at the initialization of the adapter, in its own driver, I don't
> think the device should care about that.

As long as i2c frame is supposed to do something more complicated then
sending a few bytes at the very end and even, may be, at the start of
booting, it is definitely required to configure - setup clocks, enable
the device.

Yours,
Nikita Shubin

