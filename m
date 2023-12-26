From: Gabriel Somlo <gsomlo@gmail.com>
Date: Tue, 26 Dec 2023 17:35:54 -0500
Subject: Help: commit 6112d58 breaks my kernel boot
In-Reply-To: <20231226-container-sandbox-d2a9f34b7d76@spud>
References: <ZYsGfc/U10S0mKna@errol.ini.cmu.edu>
 <20231226-apache-lagging-514fe286ce52@spud>
 <ZYsLGHnhWBPb4T4O@errol.ini.cmu.edu>
 <ZYsNVHDBaCbQbAEG@errol.ini.cmu.edu>
 <20231226-container-sandbox-d2a9f34b7d76@spud>
Message-ID: <ZYtVSrIvNKt2Cjak@Entropy.lan>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 26, 2023 at 09:56:56PM +0000, Conor Dooley wrote:
> On Tue, Dec 26, 2023 at 12:28:52PM -0500, Gabriel L. Somlo wrote:
> > On Tue, Dec 26, 2023 at 12:19:22PM -0500, Gabriel L. Somlo wrote:
> > > On Tue, Dec 26, 2023 at 05:11:00PM +0000, Conor Dooley wrote:
> > > > On Tue, Dec 26, 2023 at 11:59:41AM -0500, Gabriel L. Somlo wrote:
> > > > > Hi,
> > > > > 
> > > > > I recently updated my opensbi sources, and noticed that commit
> > > > > 6112d58 ("lib: utils/fdt: Allow to use reg-names when parsing ACLINT")
> > > > > breaks booting the (latest upstream) kernel on my LiteX + 4-core Rocket
> > > > > setup. Without that commit, the kernel boots fine. With the commit
> > > > > applied, I get:
> > > > 
> > > > > 		L2: clint at 2000000 {
> > > > > 			compatible = "riscv,clint0";
> > > > > 			interrupts-extended = <&L4 3 &L4 7 &L14 3 &L14 7 &L24 3 &L24 7 &L34 3 &L34 7>;
> > > > > 			reg = <0x2000000 0x10000>;
> > > > 
> > > > > 			reg-names = "control";
> > > > 
> > > > If you remove this does it boot?
> > > > 
> > > 
> > > Yes, removing the `reg-names` line from the clint node allows the
> > > kernel to boot without issues.
> > 
> > I have to wonder, though, is that the "proper" fix, or just a
> > temporary workaround? Is the `reg-names` entry actively "wrong"
> > in the context of the rest of my clint node, or is parsing in opensbi
> > actually buggy at the moment?
> 
> The parsing in OpenSBI is binding compliant (as far as I can see from a
> brief look at the commit you identified) but I suppose it could be
> limited to avoid checking reg-names for things matching the regular clint,
> if there are a lot of incorrect devicetrees out there likely to be
> affected.

As luck would have it, mine is a soft-core fpga-based cpu setup, and
the Rocket-provided dts is a sample that can be (and is) edited before
deployment -- so I can easily comment out or remove the `reg-names`
line in addition to all the other "massaging" I do to the sample they
provide. In some plausible future I might even figure out how they
generate the dts and submit a patch to stop them from adding the offending
line in the first place.

It would be a problem for any actual hardware that ships with a "bad"
DTS in ROM -- but that's for someone else to complain about... ;)

Thanks again,
--Gabriel


