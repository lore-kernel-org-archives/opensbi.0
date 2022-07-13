From: dramforever <dramforever@live.com>
Date: Wed, 13 Jul 2022 15:51:53 +0800
Subject: Is anyone seeing OpenSBI v1.0 flakiness?
In-Reply-To: <mhng-3a4b2b8b-da0b-4e32-875c-5f52dcc53f20@palmer-mbp2014>
References: <mhng-3a4b2b8b-da0b-4e32-875c-5f52dcc53f20@palmer-mbp2014>
Message-ID: <TYYP286MB1439E4718D5B2F685BFE2022C6899@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/13/22 10:28, Palmer Dabbelt wrote:
> I recently bumped QEMU to v7.0.0 in my main test repos, which is
> causing some flakiness: around 1% of kernels are failing to boot, it
> seems to not really depend on the Kconfig or QEMU config (though I'm
> always running virt tests).? It's just an early boot hang, I haven't
> poked around much deeper as I've just been trying to bisect the
> problem.? I think I've tracked this down to the OpenSBI update (from
> 0.9 to 1.0), but it seems like the boot failures come and go so I'm
> not 100% sure on that -- at least the commit before the OpenSBI update
> seems safe, I ran about ten thousand boots without any issues.? That's
> about as far as I've getten bisecting, the low failure rate is causing
> headaches.
>
> I'm back on v6.1.0 so I can try and get some Linux code merged this
> week, I'm way behind so I probably won't be able to look all that
> much.? I'm going to try and get OpenSBI master into my testing flow
> more cleanly, but I figured I'd start a thread in case anyone else is
> seeing issues.
>
This is just a guess, but QEMU 7.0.0 has a bug in setting mtval/stval
for illegal instruction handling [1]. The behavior is dependent on the
history of illegal instructions executed, and OpenSBI does install an
illegal instruction handler, so there might be some interaction with
whatever Linux is doing, like emulating the wrong instruction.

I have a workaround patch in my own thing [2] but since it basically
negates the benefit of mtvec/stvec on illegal instruction it's not
upstreamed.

Regards,
dram

[1]: https://gitlab.com/qemu-project/qemu/-/issues/1060
[2]: https://github.com/dramforever/opensbi-h/commit/e580cb14139b4cf5792e3d9adf2d9356670a3039


