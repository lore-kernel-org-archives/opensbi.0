From: Conor Dooley <conor@kernel.org>
Date: Sat, 12 Aug 2023 01:16:47 +0100
Subject: [PATCH] docs/platform: thead-c9xx: Improve the documentation
In-Reply-To: <CAJF2gTSYAz5ogsnB5SD_A3J1WEPzAHU1GDy_cPnuvXytqvMiBw@mail.gmail.com>
References: <20230808132958.1097873-1-guoren@kernel.org>
 <ZNURXBKkYdiWLanf@xhacker>
 <20230811-cardiac-platter-8b50b3b764d3@spud>
 <CAJF2gTSYAz5ogsnB5SD_A3J1WEPzAHU1GDy_cPnuvXytqvMiBw@mail.gmail.com>
Message-ID: <20230812-septum-gestate-4c62ef7c7213@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 12, 2023 at 08:07:50AM +0800, Guo Ren wrote:
> On Sat, Aug 12, 2023 at 1:57?AM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Fri, Aug 11, 2023 at 12:33:32AM +0800, Jisheng Zhang wrote:
> > > On Tue, Aug 08, 2023 at 09:29:58AM -0400, guoren at kernel.org wrote:
> > > > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > > > +T-HEAD Fdt Reset Driver Introduction
> > > > +------------------------------------
> > > > +
> > > > +Every T-HEAD CPU provides a reset control signal and reset address signals.
> > > > + - Reset address signal determines CPU where to start up.
> > > > + - Reset control signal releases CPU from reset state and begins to execute
> > > > +   at reset address.
> > > > +
> > > > +Many vendors would gather these signals into SoC control registers. These
> > > > +register designs are similar but with different base addresses and bits
> > > > +definitions. We only provide standard opensbi, Linux binaries, and jtag gdbinit
> > > > +script to simplify Linux booting at the FPGA stage. The fdt reset driver helps
> > > > +users bring up their SMP system quickly with the below settings:
> > >
> > > +DT maintainers and DT list.
> > >
> > > I can submit a dt-binding for this if DT maintainers agree with below
> > > properties. Could you please help review?
> >
> > I already reviewed this once & nothing has improved.
> > In fact, things have gotten worse IMO with this "using-csr-reset" that I
> > don't think existed in the original iteration that I saw.
> > I did see things getting better with the use of standard stuff like
> > "reg" in our earlier discussion which I don't see here.

> It's not a patch to improve the implementation and we don't make a
> deal in that discussion. This patch improves the document because the
> previous doc didn't describe the whole thing about the
> thead,reset-sample driver.

That's all well and good, but there's still no point in Rob, Krzysztof
or I reviewing it, which is what was being requested in the email I was
replying to.

> > What is the point in carrying out any further review if things will be
> > flat out ignored?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230812/f430cab7/attachment.sig>
