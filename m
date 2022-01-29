From: Xiang W <wxjstz@126.com>
Date: Sat, 29 Jan 2022 23:42:06 +0800
Subject: [PATCH] Makefile: fix build with binutils 2.38
In-Reply-To: <YfU7tygbgGqVk2/5@aurel32.net>
References: <20220128173346.1863727-1-aurelien@aurel32.net>
 <c6a8c3e5689d5fc54166a4aaf8d146e7d317b78f.camel@126.com>
 <YfU7tygbgGqVk2/5@aurel32.net>
Message-ID: <9c8f7eea0fac86dcd200e7ec94ca315df9f4d311.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-01-29???? 14:05 +0100?Aurelien Jarno???
> On 2022-01-29 20:52, Xiang W wrote:
> > ? 2022-01-28???? 18:33 +0100?Aurelien Jarno???
> > > From version 2.38, binutils default to ISA spec version 20191213.
> > > This
> > > means that the csr read/write (csrr*/csrw*) instructions and
> > > fence.i
> > > instruction has separated from the `I` extension, become two
> > > standalone
> > > extensions: Zicsr and Zifencei. As the kernel uses those
> > > instruction,
> > > this causes the following build failure:
> > The latest version of GNU binutils is 2.37. 2.38 should not be
> > released
> > yet, are there any new patch references for these changes?
> > 
> 
> Correct, however there is already a 2.38 branch and the release should
> happen in the next weeks.
> 
> The default ISA spec change is due to this commit:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
> 
thanks a lot.



