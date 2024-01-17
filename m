From: Nam Cao <namcao@linutronix.de>
Date: Wed, 17 Jan 2024 13:03:25 +0100
Subject: [PATCH 1/2] platform: starfive: correct system clock device
 tree node
In-Reply-To: <CAEn-LTq9iXg--zvTdn=g1G=2EH9vPFHphXj0pRVon8XCdRsh-A@mail.gmail.com>
References: <088ccae83cf0165d1390627d7e2e782d74941e62.1705490088.git.namcao@linutronix.de>
	<a0d913ba9ad4283ef2873f08e7bb379c45642306.camel@126.com>
	<CAEn-LTq9iXg--zvTdn=g1G=2EH9vPFHphXj0pRVon8XCdRsh-A@mail.gmail.com>
Message-ID: <20240117130325.65e71fdd@namcao>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 17 Jan 2024 13:47:13 +0200 David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> On Wed, Jan 17, 2024 at 1:33?PM Xiang W <wxjstz@126.com> wrote:
> >
> > ? 2024-01-17???? 12:16 +0100?Nam Cao???  
> > > Starfive names the system clock device tree node "starfive,jh7110-clkgen"
> > > in all their git repositories. However, a different name is used in
> > > upstream U-Boot (and also Linux): "starfive,jh7110-syscrg". Since
> > > OpenSBI gets the device tree from U-Boot, this inconsistency leads the
> > > problem that OpenSBI doesn't know the system clock device exists.
> > >
> > > Correct this name to keep the consistency.  
> > This sounds like a problem of u-boot. Directly replacing compatible strings is
> > not a good way. It is best to try another compatible string after the search
> > fails.  
> 
> At a quick glance there are no approved bindings for
> starfive,jh7110-clkgen. There are bindings for starfive,jh7110-syscrg
> in the Linux tree. IIUC v1 patch to add bindings referenced
> starfive,jh7110-clkgen compatible, but that's no what landed. U-Boot
> is supposed to regularly sync their DTS from the kernel tree.
> 
> Most likely OpenSBI stuff was merged before bindings got officially
> approved in the Linux tree.

This is also what I think: this stuff is merged to OpenSBI too early.

However, this patch breaks OpenSBI's compatibility with Starfive's U-Boot.
So the question is whether we should keep the compatibility with both
upstream U-Boot and Starfive's U-Boot, or just the upstream one. I would
say being compatible with upstream U-Boot is sufficient.

That said, if anyone insists on keeping the compatibility with Starfive's
U-Boot too, I can send a v2.

Best regards,
Nam

