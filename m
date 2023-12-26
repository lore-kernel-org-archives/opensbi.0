From: Gabriel L. Somlo <gsomlo@gmail.com>
Date: Tue, 26 Dec 2023 12:19:20 -0500
Subject: Help: commit 6112d58 breaks my kernel boot
In-Reply-To: <20231226-apache-lagging-514fe286ce52@spud>
References: <ZYsGfc/U10S0mKna@errol.ini.cmu.edu>
 <20231226-apache-lagging-514fe286ce52@spud>
Message-ID: <ZYsLGHnhWBPb4T4O@errol.ini.cmu.edu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 26, 2023 at 05:11:00PM +0000, Conor Dooley wrote:
> On Tue, Dec 26, 2023 at 11:59:41AM -0500, Gabriel L. Somlo wrote:
> > Hi,
> > 
> > I recently updated my opensbi sources, and noticed that commit
> > 6112d58 ("lib: utils/fdt: Allow to use reg-names when parsing ACLINT")
> > breaks booting the (latest upstream) kernel on my LiteX + 4-core Rocket
> > setup. Without that commit, the kernel boots fine. With the commit
> > applied, I get:
> 
> > 		L2: clint at 2000000 {
> > 			compatible = "riscv,clint0";
> > 			interrupts-extended = <&L4 3 &L4 7 &L14 3 &L14 7 &L24 3 &L24 7 &L34 3 &L34 7>;
> > 			reg = <0x2000000 0x10000>;
> 
> > 			reg-names = "control";
> 
> If you remove this does it boot?
> 

Yes, removing the `reg-names` line from the clint node allows the
kernel to boot without issues.

Thanks,
--Gabriel


