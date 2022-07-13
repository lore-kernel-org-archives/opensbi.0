From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Tue, 12 Jul 2022 19:28:03 -0700 (PDT)
Subject: Is anyone seeing OpenSBI v1.0 flakiness?
Message-ID: <mhng-3a4b2b8b-da0b-4e32-875c-5f52dcc53f20@palmer-mbp2014>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I recently bumped QEMU to v7.0.0 in my main test repos, which is causing 
some flakiness: around 1% of kernels are failing to boot, it seems to 
not really depend on the Kconfig or QEMU config (though I'm always 
running virt tests).  It's just an early boot hang, I haven't poked 
around much deeper as I've just been trying to bisect the problem.  I 
think I've tracked this down to the OpenSBI update (from 0.9 to 1.0), 
but it seems like the boot failures come and go so I'm not 100% sure on 
that -- at least the commit before the OpenSBI update seems safe, I ran 
about ten thousand boots without any issues.  That's about as far as 
I've getten bisecting, the low failure rate is causing headaches.

I'm back on v6.1.0 so I can try and get some Linux code merged this 
week, I'm way behind so I probably won't be able to look all that much.  
I'm going to try and get OpenSBI master into my testing flow more 
cleanly, but I figured I'd start a thread in case anyone else is seeing 
issues.

