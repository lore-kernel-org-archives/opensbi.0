From: Xiang W <wxjstz@126.com>
Date: Wed, 15 Sep 2021 18:07:29 +0800
Subject: [PATCH V2 1/2] lib: sbi: add some macros to detect BUG at runtime
In-Reply-To: <87wnni42a6.fsf@igel.home>
References: <20210915090330.23354-1-wxjstz@126.com> <87wnni42a6.fsf@igel.home>
Message-ID: <a499e6776416b55875fb8c62734a9fcad3fe539f.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-09-15???? 11:27 +0200?Andreas Schwab???
> On Sep 15 2021, Xiang W wrote:
> 
> > +#define BUG_ON(cond) do { \
> > +???????if (!(cond))????\
> > +???????????????BUG(); \
> 
> Isn't that backwards?
I can't understand what you mean.

Regards,
Xiang W
> 
> Andreas.
> 



