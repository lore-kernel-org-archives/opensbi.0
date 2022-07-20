From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Jul 2022 08:51:10 +0200
Subject: [PATCH v3 01/15] scripts: Add Kconfiglib v14.1.0 under scripts
 directory
In-Reply-To: <a6f86fe87536a22bd77d645fd29ddf32aa49cc98.camel@126.com>
References: <20220719131837.2389630-1-apatel@ventanamicro.com>
 <20220719131837.2389630-2-apatel@ventanamicro.com>
 <a6f86fe87536a22bd77d645fd29ddf32aa49cc98.camel@126.com>
Message-ID: <20220720065110.lh6rrc7t7xply7ha@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 20, 2022 at 01:28:55AM +0800, Xiang W wrote:
> ? 2022-07-19???? 18:48 +0530?Anup Patel???
> > We adopt Kconfiglib v14.1.0 sources under scripts directory so that
> > top-level OpenSBI makefile can directly use Kconfiglib scripts without
> > expecting users to install a particular version Kconfiglib on their
> > build system.
> > 
> The introduction of kconfiglib is best to use git submodule, which is
> convenient for later upgrade.
>

submodules are nifty, but add a burden on developers who frequently
checkout older versions of the superproject, such as when bisecting,
since manually running 'git submodule update' may be necessary after
the checkouts. That probably wouldn't be the case for kconfiglib,
since that project isn't getting updates (hasn't for 2.5 years) and
opensbi would likely rarely update the version it tracks anyway, but
that also means there's not much value in making it a submodule in
the first place.

That said, it might be nice to only commit something like QEMU's
minikconf.py to this repo, providing basic Kconfig/defconfig parsing,
but no user interfaces, and then provide an option to support
menuconfig, etc. by 'updating' a kconfiglib submodule to get the
scripts it provides.

Thanks,
drew

