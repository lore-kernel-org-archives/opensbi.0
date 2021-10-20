From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Wed, 20 Oct 2021 09:51:00 +0300
Subject: [PATCH v2 4/5] lib: utils/i2c: Add minimal SiFive I2C driver
In-Reply-To: <CA+zEjCuy4vCv4UJeacXgXx1r23oDRj5E8rXK+c=LxVW+j-sSeg@mail.gmail.com>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <20211015131925.22585-5-nikita.shubin@maquefel.me>
 <CA+zEjCuy4vCv4UJeacXgXx1r23oDRj5E8rXK+c=LxVW+j-sSeg@mail.gmail.com>
Message-ID: <20211020095100.6796dfff@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Alexandre!

On Tue, 19 Oct 2021 14:34:30 +0200
Alexandre Ghiti <alexandre.ghiti@canonical.com> wrote:

> > +static inline void sifive_i2c_setreg(struct sifive_i2c_adapter
> > *adap,
> > +                                    int reg, u8 value)
> > +{
> > +       writel(value, (volatile void *)adap->addr + reg);
> > +}
> > +
> > +static inline u8 sifive_i2c_getreg(struct sifive_i2c_adapter
> > *adap, int reg) +{
> > +       return readl((volatile void *)adap->addr + reg);
> > +}
> > +  
> 
> reg is defined as a uint8_t in calling functions and here as an int.

Agreed.

