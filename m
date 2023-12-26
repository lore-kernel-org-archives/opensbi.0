From: Conor Dooley <conor@kernel.org>
Date: Tue, 26 Dec 2023 17:27:55 +0000
Subject: Help: commit 6112d58 breaks my kernel boot
In-Reply-To: <ZYsLGHnhWBPb4T4O@errol.ini.cmu.edu>
References: <ZYsGfc/U10S0mKna@errol.ini.cmu.edu>
 <20231226-apache-lagging-514fe286ce52@spud>
 <ZYsLGHnhWBPb4T4O@errol.ini.cmu.edu>
Message-ID: <20231226-chlorine-item-0c57aa524a23@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 26, 2023 at 12:19:20PM -0500, Gabriel L. Somlo wrote:
> On Tue, Dec 26, 2023 at 05:11:00PM +0000, Conor Dooley wrote:
> > On Tue, Dec 26, 2023 at 11:59:41AM -0500, Gabriel L. Somlo wrote:
> > > Hi,
> > > 
> > > I recently updated my opensbi sources, and noticed that commit
> > > 6112d58 ("lib: utils/fdt: Allow to use reg-names when parsing ACLINT")
> > > breaks booting the (latest upstream) kernel on my LiteX + 4-core Rocket
> > > setup. Without that commit, the kernel boots fine. With the commit
> > > applied, I get:
> > 
> > > 		L2: clint at 2000000 {
> > > 			compatible = "riscv,clint0";
> > > 			interrupts-extended = <&L4 3 &L4 7 &L14 3 &L14 7 &L24 3 &L24 7 &L34 3 &L34 7>;
> > > 			reg = <0x2000000 0x10000>;
> > 
> > > 			reg-names = "control";
> > 
> > If you remove this does it boot?
> > 
> 
> Yes, removing the `reg-names` line from the clint node allows the
> kernel to boot without issues.

Cool, sounds like a dts issue and not U-Boot's fault then. reg-names is
not a documented property for the regular clint, so it shouldn't be
here.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20231226/4c42f53d/attachment.sig>
