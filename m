From: Xiang W <wxjstz@126.com>
Date: Sun, 11 Jul 2021 03:11:31 +0800
Subject: [PATCH] firmware: Detect whether the toolchain supports pie and
 automatically disable the FW_PIC option
In-Reply-To: <B7B8F84A-F69C-43B4-95B1-347D0841680D@jrtc27.com>
References: <20210710182146.148767-1-wxjstz@126.com>
 <B7B8F84A-F69C-43B4-95B1-347D0841680D@jrtc27.com>
Message-ID: <a9f78f257459a7a37b14d480095a194f459bffb7.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-07-10???? 19:24 +0100?Jessica Clarke???
> On 10 Jul 2021, at 19:21, Xiang W <wxjstz@126.com> wrote:
> > 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> > firmware/objects.mk | 4 ++++
> > 1 file changed, 4 insertions(+)
> > 
> > diff --git a/firmware/objects.mk b/firmware/objects.mk
> > index ce91c2f..96a8d7d 100644
> > --- a/firmware/objects.mk
> > +++ b/firmware/objects.mk
> > @@ -17,6 +17,10 @@ ifndef FW_PIC
> > FW_PIC := y
> > endif
> > 
> > +ifeq ($(FW_PIC),y)
> > +FW_PIC := $(shell $(CC) -nostdlib -fPIE -Wl,-pie /dev/null? -o
> > /dev/null 2>/dev/null && echo y || echo n)
> > +endif
> 
> /dev/null is not a valid object. This always gives n.

Yes, you are right. We still need a simple test file. This can run just
by luck. The command I actually ran did have an error output, but the
return value was exactly 0.

/usr/lib/gcc-cross/riscv64-linux-gnu/10/../../../../riscv64-linux-
gnu/bin/ld: warning: cannot find entry symbol _start; not setting start
address
> 
> Jess



