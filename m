From: Conor Dooley <conor@kernel.org>
Date: Tue, 26 Dec 2023 17:11:00 +0000
Subject: Help: commit 6112d58 breaks my kernel boot
In-Reply-To: <ZYsGfc/U10S0mKna@errol.ini.cmu.edu>
References: <ZYsGfc/U10S0mKna@errol.ini.cmu.edu>
Message-ID: <20231226-apache-lagging-514fe286ce52@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 26, 2023 at 11:59:41AM -0500, Gabriel L. Somlo wrote:
> Hi,
> 
> I recently updated my opensbi sources, and noticed that commit
> 6112d58 ("lib: utils/fdt: Allow to use reg-names when parsing ACLINT")
> breaks booting the (latest upstream) kernel on my LiteX + 4-core Rocket
> setup. Without that commit, the kernel boots fine. With the commit
> applied, I get:

> 		L2: clint at 2000000 {
> 			compatible = "riscv,clint0";
> 			interrupts-extended = <&L4 3 &L4 7 &L14 3 &L14 7 &L24 3 &L24 7 &L34 3 &L34 7>;
> 			reg = <0x2000000 0x10000>;

> 			reg-names = "control";

If you remove this does it boot?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20231226/e20b3ed6/attachment.sig>
