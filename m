From: Guo Ren <guoren@kernel.org>
Date: Thu, 25 May 2023 11:15:36 +0800
Subject: [RFC PATCH 2/2] lib: reset: thead: Correct the naming convention
 of dts
In-Reply-To: <20230524-climate-citrus-4959e052bf56@spud>
References: <20230523094649.4100554-1-guoren@kernel.org> <20230523094649.4100554-3-guoren@kernel.org>
 <20230523-manatee-providing-77413fac0c58@spud> <CAJF2gTSR1LzGyzxLWWst+4M_nKWXBA=v8=zY-42-ODGU_aO-Lg@mail.gmail.com>
 <20230524-vertebrae-slip-84584f5bb65b@wendy> <CAJF2gTQPyyi5twqdboo=4t0KgP0RqgOpqd0PX239PQZKC-Z8Uw@mail.gmail.com>
 <20230524-claw-obligate-e4815c3e232b@spud> <0115F3EA-6071-4876-A50B-CCCB6496FBB6@jrtc27.com>
 <20230524-climate-citrus-4959e052bf56@spud>
Message-ID: <CAJF2gTRgE2ceqZ7Ddi6NwT++qFGEzK-YZ4gg9mYPwTSUKiTwRw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 25, 2023 at 1:27?AM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, May 24, 2023 at 04:55:04PM +0100, Jessica Clarke wrote:
> > On 24 May 2023, at 15:46, Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Wed, May 24, 2023 at 06:39:47PM +0800, Guo Ren wrote:
> > >
> > >> We remove reset-ctrl-val, but still keep csr-copy. Because it contains
> > >> the index, not value. It didn't viloate anything. okay?
> > >
> > > If it is set per-soc, which apparently it is, then you don't need to
> > > fill the values into a property to communicate it to software because
> > > you already have a compatible that tells you exactly what implementation
> > > you have. Just like it is normal for a driver to use #defines etc for
> > > register access, since it knows those registers exist on a particular
> > > implementation. I don't know what OpenSBI calls this, but in Linux it
> > > is called match_data.
> > > Either way - we are just going around in circles here :)
>
> > The SoC-specific compatible does have value in case the specific IP
> > needs identifying to work around quirks, but IMO using that to derive
> > all the parameters rather than having them in the FDT makes drivers
> > worse.
>
> The other thing to consider is whether the csr copy property is actually
> SoC specific, or varies more/less frequently than that. For example, is
> it actually set by the cpu core, rather than the SoC, and a number of SoCs
> would use the same values? Or would it vary depending on use-case (AMP
> etc).
> I tried to do some reading up on the documentation, although I struggled
> to find detail in a language that I understand. The documentation that I
> did find though, looked like you might want to use the same ones for all
> c910s.
> I'm certainly not diametrically opposed to this property & adding to a
> fallback compatible (something like "thead,c910-cpu-reset"?).
Yes, but not only for c910, but also for c907/c908/c910/c920/r910 ...

So it could be "thead,cpu-reset", okay?

> If it actually is the case that the CSRs you want to copy is a property
> of the cpu core, you wouldn't even need match data & could copy the
> default set of CSRs always*.
Every SoC has different CSRs arrary setting.

> And when a real use case comes along that needs a property to set
> arbitrary values a specific property can always be added with a fallback
> to the base cpu values?
> It would desperately need an explanation that is better than "copy these
> csrs" though, explaining the which & why, and the binding should enforce
> that only valid CSRs for an SoC pass validation.
The driver just help copy CSRs from primary core to the secondary
cores, the driver don't care about which CSR and what value is. This
is the function provided by this thead,cpu-reset driver.

What you mentioned is not ralted to this driver, it's should be
defined in zsbl or earlier boot loader.

Actually, our core could let SoC vendors define their own custom
CSRs/custom reset values of CSRs, so we don't know what would be added
in the future. Put a array in dts instead of hard-code table is much
more flexiblity.

>


-- 
Best Regards
 Guo Ren

