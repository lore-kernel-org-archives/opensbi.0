From: Fu Wei <tekkamanninja@gmail.com>
Date: Thu, 30 Sep 2021 12:21:26 +0800
Subject: [PATCH V3] Makefile: Add build time and compiler info string.
In-Reply-To: <CAEUhbmU58kxBUMtTCByQC_5L4WQHj6bMU0jtFd5W_CDXEohzKw@mail.gmail.com>
References: <20210929180533.275413-1-tekkamanninja@gmail.com>
 <CAEUhbmU58kxBUMtTCByQC_5L4WQHj6bMU0jtFd5W_CDXEohzKw@mail.gmail.com>
Message-ID: <CA+HMz3j7hwUBQHuxGCkmK_pce_e28HSe+LHsoW0PdoGwcgpKrg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Bin,

Bin Meng <bmeng.cn@gmail.com> ?2021?9?30??? ??9:09???
>
> On Thu, Sep 30, 2021 at 2:06 AM <tekkamanninja@gmail.com> wrote:
> >
> > From: Wei Fu <wefu@redhat.com>
> >
> > When we are doing opensbi development, we want to know the build time
> > and compiler info for debug purpose.
> > To enable this message, please add "BUILD_INFO=y" , like:
> >
> > ```
> > make BUILD_INFO=y
> > ```
> >
> > NOTE: `BUILD_INFO=y` will violate "reproducible builds".
> > So it's ONLY for development and debug purpose, and should NOT be used
> > in a product which follows "reproducible builds".
> >
> > Signed-off-by: Wei Fu <wefu@redhat.com>
> > ---
> >  Makefile           | 22 ++++++++++++++++++++++
> >  README.md          | 23 +++++++++++++++++++++++
> >  lib/sbi/sbi_init.c |  8 ++++++++
> >  3 files changed, 53 insertions(+)
> >
>
> It looks my comments to v1 still remains unchanged

Thanks for reminding me, will fix it :-)

>
> Regards,
> Bin

