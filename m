From: Conor Dooley <conor@kernel.org>
Date: Fri, 11 Aug 2023 18:57:31 +0100
Subject: [PATCH] docs/platform: thead-c9xx: Improve the documentation
In-Reply-To: <ZNURXBKkYdiWLanf@xhacker>
References: <20230808132958.1097873-1-guoren@kernel.org>
 <ZNURXBKkYdiWLanf@xhacker>
Message-ID: <20230811-cardiac-platter-8b50b3b764d3@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 11, 2023 at 12:33:32AM +0800, Jisheng Zhang wrote:
> On Tue, Aug 08, 2023 at 09:29:58AM -0400, guoren at kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>

> > +T-HEAD Fdt Reset Driver Introduction
> > +------------------------------------
> > +
> > +Every T-HEAD CPU provides a reset control signal and reset address signals.
> > + - Reset address signal determines CPU where to start up.
> > + - Reset control signal releases CPU from reset state and begins to execute
> > +   at reset address.
> > +
> > +Many vendors would gather these signals into SoC control registers. These
> > +register designs are similar but with different base addresses and bits
> > +definitions. We only provide standard opensbi, Linux binaries, and jtag gdbinit
> > +script to simplify Linux booting at the FPGA stage. The fdt reset driver helps
> > +users bring up their SMP system quickly with the below settings:
> 
> +DT maintainers and DT list.
> 
> I can submit a dt-binding for this if DT maintainers agree with below
> properties. Could you please help review?

I already reviewed this once & nothing has improved.
In fact, things have gotten worse IMO with this "using-csr-reset" that I
don't think existed in the original iteration that I saw.
I did see things getting better with the use of standard stuff like
"reg" in our earlier discussion which I don't see here.
What is the point in carrying out any further review if things will be
flat out ignored?

Thanks,
Conor.

> > +
> > + - entry-reg:
> > +	The base address to store reset address value
> > +
> > + - entry-cnt:
> > +	The numbers of entry-reg, all of them set the same reset address
> > +
> > + - control-reg:
> > +	The base address to reset the controller
> > +
> > + - control-val:
> > +	Write which bits of control-reg for booting
> > +
> > + - csr-copy:
> > +	This array determines which csrs to copy from primary hart to the
> > +	secondary harts, which are set in sequence from left to right. The
> > +	secondary harts should keep the same setting as the primary hart.
> > +	These settings are also the first part of the bootup instructions
> > +	for secondary harts.
> > +
> > + - using-csr-reset:
> > +	A legacy reset controller for the SMP system, but abandoned in the
> > +	latest T-HEAD processors.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230811/cb64aab5/attachment.sig>
