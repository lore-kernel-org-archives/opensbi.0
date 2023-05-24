From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 24 May 2023 16:55:04 +0100
Subject: [RFC PATCH 2/2] lib: reset: thead: Correct the naming convention
 of dts
In-Reply-To: <20230524-claw-obligate-e4815c3e232b@spud>
References: <20230523094649.4100554-1-guoren@kernel.org>
 <20230523094649.4100554-3-guoren@kernel.org>
 <20230523-manatee-providing-77413fac0c58@spud>
 <CAJF2gTSR1LzGyzxLWWst+4M_nKWXBA=v8=zY-42-ODGU_aO-Lg@mail.gmail.com>
 <20230524-vertebrae-slip-84584f5bb65b@wendy>
 <CAJF2gTQPyyi5twqdboo=4t0KgP0RqgOpqd0PX239PQZKC-Z8Uw@mail.gmail.com>
 <20230524-claw-obligate-e4815c3e232b@spud>
Message-ID: <0115F3EA-6071-4876-A50B-CCCB6496FBB6@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24 May 2023, at 15:46, Conor Dooley <conor@kernel.org> wrote:
> 
> On Wed, May 24, 2023 at 06:39:47PM +0800, Guo Ren wrote:
> 
>> We remove reset-ctrl-val, but still keep csr-copy. Because it contains
>> the index, not value. It didn't viloate anything. okay?
> 
> If it is set per-soc, which apparently it is, then you don't need to
> fill the values into a property to communicate it to software because
> you already have a compatible that tells you exactly what implementation
> you have. Just like it is normal for a driver to use #defines etc for
> register access, since it knows those registers exist on a particular
> implementation. I don't know what OpenSBI calls this, but in Linux it
> is called match_data.
> Either way - we are just going around in circles here :)

I don?t actually understand this opinion. As a driver author, I would
much prefer to be able to write a single parameterised driver where the
important parameters com from the FDT, rather than having to figure out
all the parameters myself and put them in a table that gets looked up.
Otherwise you could take this to the extreme and just have the
compatible, with everything else hard-coded in the driver, which gets
you much closer to ACPI?s model, which itself is borrowing from the FDT
model and now adding key-value pairs to _DSD. Take something like
gpio-restart, which has three configurable delays. Should those instead
be done based on a per-SoC compatible? Or take syscon-reboot, which has
configurable offset and mask. Should those be done based on a per-SoC
compatible? Having just the one compatible means the driver can be
written once and not need touching again as new SoCs appear, since the
parameters themselves are in the FDT, but if you instead have a
mycompany,mysoc-syscon-reboot for every SoC then each time a new SoC
appears you need to go add the offset+mask values to your big lookup
table in the driver and use a new kernel. This flexibility to put all
the parameters in the FDT was always something I saw as an advantage of
FDTs over ACPI.

The SoC-specific compatible does have value in case the specific IP
needs identifying to work around quirks, but IMO using that to derive
all the parameters rather than having them in the FDT makes drivers
worse.

Jess


