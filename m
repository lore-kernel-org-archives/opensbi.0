From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Fri, 1 Oct 2021 11:27:12 +0300
Subject: [RFC PATCH 2/2] lib: sbi: add priority for reset handler
In-Reply-To: <a6330fd269b91f433da2fc56557e6ef4ae70d331.camel@126.com>
References: <20210929094151.26639-1-nikita.shubin@maquefel.me>
 <20210929094151.26639-3-nikita.shubin@maquefel.me>
 <a6330fd269b91f433da2fc56557e6ef4ae70d331.camel@126.com>
Message-ID: <20211001112712.6dea703b@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 30 Sep 2021 10:26:11 +0800
Xiang W <wxjstz@126.com> wrote:

> ? 2021-09-29???? 12:41 +0300?Nikita Shubin???
> > From: Nikita Shubin <n.shubin@yadro.com>
> > 
> > Let's make system_reset_check returning priority instead of only
> > true/false. In that case 0 - means not supported, and anything above
> > means priority that makes existing reset handlers being used in
> > first place, unless it is decided to lower their priority.
> > 
> > The handler with the least priority wins.
> > 
> > Signed-off-by: Nikita Shubin <n.shubin@yadro.com>  
> Isn't this priority used to control the shutdown sequence of different
> areas? What is this usage scenario?

Exactly! 

The current situation if following on Sifive Unmatched reset only works
via i2c PMIC, shutdown also works via i2c, but shutdown via gpio is
preferable, so we end up with 2 reset devices.

To prefer shutdown via gpio priority is desirable.


Yours,
Nikita Shubin


