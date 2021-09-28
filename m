From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue, 28 Sep 2021 14:07:54 +0300
Subject: [PATCH 1/4] lib: utils/i2c: Add generic I2C configuration library
In-Reply-To: <bd47f16d6e6a80b26a57d10a18ff2372b8620987.camel@126.com>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <20210924113347.3576-2-nikita.shubin@maquefel.me>
 <bd47f16d6e6a80b26a57d10a18ff2372b8620987.camel@126.com>
Message-ID: <20210928140754.5b4a5f23@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Xiang!

On Sat, 25 Sep 2021 12:19:43 +0800
Xiang W <wxjstz@126.com> wrote:

> > +
> > +#include <sbi/sbi_error.h>
> > +#include <sbi_utils/i2c/i2c.h>
> > +
> > +#define I2C_ADAPTER_MAX????????????????16  
> If it is implemented through a linked list, there will be no limit on
> the number

You are proposing double linked lists like in Linux/BSD? That makes
sense.


Yours,
Nikita Shubin

