From: Axel Heider <axelheider@gmx.de>
Date: Tue, 8 Jun 2021 03:43:46 +0200
Subject: OpenSBI HSM extension: change MMU state (enable, disable)
Message-ID: <4ac424c6-1a8c-4627-8eee-656cd59746e0@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I would like to discuss adding a new function to the
HSM extension that allows changing the MMU state of a
hart. The proposed interface is:

 ID: SBI_EXT_HSM_HART_CHANGE_MMU

 parameter 0: new satp value to set
 parameter 1: PC to use when returning from SBI call
 parameter 1: SP to use when returning form SBI call
 parameter 1: a generic context value put in a0
               when returning from SBI call. So PC can
               point to a function and a0 is its
               parameter

Obviously, the call is only allowed when coming from
S-Mode. It is intended to be used by the OS or boot loader
during core/hart setup.

The rational for this call is that it provides a convenient
way for a bootloader or early OS init code to enable the
MMU without having to ensure a 1:1 mapping is in place.
Instead, one would just set up the MMU tables and then call
this SBI to atomically enable the MMU and continue
execution at a specific virtual address. Since the new SP
can be set also, enabling the MMU can be done in pure C
code, there is no need for any asm stubs. Passing an
argument in a0 provides a way to pass on a context - which
may not have an immediate use case, but in general it's
not bad to have this mechanism.
As a side effect, the MMU can be disabled also with this
call, but I have rarely seen a need for this.

For ages (on ARM) I've been wondering why there is no
such mechanism implemented in the core. Enabling the MMU
always seems to be a painful thing as there it no atomic
"enable and continue at x". There are some tricks to
achieve this, but usually they smell like exploring the
edge of the specs. My assumption so far was, that silicon
space is just too specious to implement this, because it's
just used at boot and it's just for the benefit of a few
boot loader developers. With multi-core system where cores
are powered up and down, there a few more use cases for
this convenience function showed up, but still - the core
did not provide anything.
But now with M-Mode and SBI, there is a way to nicely
implement this in software now. It does not cost much and
in the long run makes writing boot loaders on RISC-V a
bit easier.
Another advantage of this SBI call is, that it can take
care of highly core specific maintained activities like
cleaning of TLBs, caches, branch predictors, pipeline
states ... all that stuff which potentially differs from
core to core and even from revision to revision. And that
a boot loader would have to take care of. Now this can
be hidden nicely in the SBI and turning on the MMU gets as
easy as powering core up and down. Of course, this assumes
that the core vendor provides the proper SBI implementation
(or documentation). But once this is in the specs, that
should happens naturally over time.

So, I'd be interested in your thoughts about my proposal.

Axel


