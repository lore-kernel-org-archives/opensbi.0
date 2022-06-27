From: Ved Shanbhogue <ved@rivosinc.com>
Date: Mon, 27 Jun 2022 07:46:12 -0500
Subject: [RISC-V] [tech-unixplatformspec] SBI Debug Console Extension
 Proposal (Draft v2)
In-Reply-To: <CAK9=C2VBnFQUD9v1XmxX3Oz7QE7KXgCbg453gZ-BLYRodespHg@mail.gmail.com>
References: <CAK9=C2V2WNMcV9Yb7ZbtcWokzDj1uKh3gf7dNZA091QHb2fB6A@mail.gmail.com>
 <aadb863a-f578-7740-6fff-6c962ab38ae0@gmx.de>
 <CAK9=C2VBnFQUD9v1XmxX3Oz7QE7KXgCbg453gZ-BLYRodespHg@mail.gmail.com>
Message-ID: <YrmmlAK4rQmEbkq/@ved-XPS-8940>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 27, 2022 at 05:38:43PM +0530, Anup Patel wrote:
>Also, a system might be partitioned into domains so a supervisor software
>running in a particular domain can only pass addresses accessible in that
>domain.
>
So domain is a new term which is not presently defined in the privileged 
specification or in the SBI specification. 

I think I get what you may be stating here i.e., M-mode may configure/
reconfigure PMPs to restrict the physical addresses that are accessible to 
the supervisor-mode. Perhaps a future Smpu extension may add to this mix.

To avoid inventing a new term, we could reword #1 to state that the physical 
address must be accessible, as determined by the PMP and/or PMA rules, to the
supervisor mode software invoking this SBI function. 

To further restrict this perhaps say "accessible to read"? As we may not want 
execute-only to be allowed by this extension.

>
>For OpenSBI, we have domain regions so OpenSBI will check the address
>against regions of the domain assigned to calling HART.

Since "domain" is a concept that is not defined by either the privilege
specification or the SBI specification we may want to avoid using that
term (or add a definition).

>This is more a requirement on the supervisor-mode software because
>we might have a system with Svpbmt so on such system supervisor-mode
>should not pass an address which is mapped as non-cacheable in the
>page table.
>
This is confusing since the description states that the parameter is a
physical address but the later comment states its a virtual address
and the memory type override using page-based memory type provided by
the virtual memory system is allowed. Could we clarify if its a physical
address - in which case only the coherence and cachability PMA should 
provide the memory type - or a virtual address in which case page-based 
memory type override is possible.

Further, a brief explanation about why cachability matters for this 
extension would be useful. Is this trying to imply some kind of early
boot execution where caches may be placed in a special mode that allows
operation when main memory is not available.

regards
ved

