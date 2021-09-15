From: Xiang W <wxjstz@126.com>
Date: Wed, 15 Sep 2021 21:56:33 +0800
Subject: [PATCH V2 1/2] lib: sbi: add some macros to detect BUG at runtime
In-Reply-To: <1921219929.1011531.1631709579523.JavaMail.zimbra@sjtu.edu.cn>
References: <20210915090330.23354-1-wxjstz@126.com>
 <1921219929.1011531.1631709579523.JavaMail.zimbra@sjtu.edu.cn>
Message-ID: <7544ae324eca8c0b916911283c28dede8ca2cd87.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-09-15???? 20:39 +0800??????
> 
> 
> ----- Original Message -----
> > From: "Xiang W" <wxjstz@126.com>
> > To: "opensbi" <opensbi@lists.infradead.org>
> > Cc: "atish patra" <atish.patra@wdc.com>, "anup patel" <
> > anup.patel at wdc.com>, "Xiang W" <wxjstz@126.com>
> > Sent: Wednesday, September 15, 2021 5:03:29 PM
> > Subject: [PATCH V2 1/2] lib: sbi: add some macros to detect BUG at
> > runtime
> 
> > Two macros are mainly added. One is called BUG(), which is used to
> > put
> > in unreachable branches. One named BUG_ON, used for assertion.
> > 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> > include/sbi/sbi_console.h | 13 +++++++++++++
> > 1 file changed, 13 insertions(+)
> > 
> > diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> > index e24ba5f..e75a279 100644
> > --- a/include/sbi/sbi_console.h
> > +++ b/include/sbi/sbi_console.h
> > @@ -11,6 +11,7 @@
> > #define __SBI_CONSOLE_H__
> > 
> > #include <sbi/sbi_types.h>
> > +#include <sbi/riscv_asm.h>
> > 
> > struct sbi_console_device {
> > ????????/** Name of the console device */
> > @@ -51,4 +52,16 @@ struct sbi_scratch;
> > 
> > int sbi_console_init(struct sbi_scratch *scratch);
> > 
> > +#define BUG() do { \
> > +???????sbi_printf("BUG: failure at %s:%d/%s()!\n", __FILE__,
> > __LINE__, __func__); \
> > +???????while (1)???????\
> > +???????????????wfi();??\
> > +???????__builtin_unreachable(); \
> > +} while (0)
> > +
> > +#define BUG_ON(cond) do { \
> > +???????if (!(cond))????\
> > +???????????????BUG(); \
> > +} while (0)
> > +
> 
> If the BUG_ON has a similar semantics as BUG_ON in Linux, it should
> be:
> ? + if (cond)???\
> ? +?????????????BUG(); \
> 
I want to implement BUG_ON like assert. If the meaning of linux is like
this, I think it can be used as a reference

Regards?
Xiang W
> > #endif
> > --
> > 2.30.2
> > 
> > 
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> Regards,
> Dong
> 



