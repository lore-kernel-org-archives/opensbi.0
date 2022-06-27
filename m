From: Ved Shanbhogue <ved@rivosinc.com>
Date: Mon, 27 Jun 2022 08:52:42 -0500
Subject: [RISC-V] [tech-unixplatformspec] SBI Debug Console Extension
 Proposal (Draft v2)
In-Reply-To: <CAK9=C2WEYHEo-5i6dNkxT=8owD98UHx-wJtb_oFwu-95=Pee5Q@mail.gmail.com>
References: <CAK9=C2V2WNMcV9Yb7ZbtcWokzDj1uKh3gf7dNZA091QHb2fB6A@mail.gmail.com>
 <aadb863a-f578-7740-6fff-6c962ab38ae0@gmx.de>
 <CAK9=C2VBnFQUD9v1XmxX3Oz7QE7KXgCbg453gZ-BLYRodespHg@mail.gmail.com>
 <YrmmlAK4rQmEbkq/@ved-XPS-8940>
 <CAK9=C2WEYHEo-5i6dNkxT=8owD98UHx-wJtb_oFwu-95=Pee5Q@mail.gmail.com>
Message-ID: <Yrm2KomP8IdT5Co3@ved-XPS-8940>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 27, 2022 at 06:58:15PM +0530, Anup Patel wrote:
>
>The rationale is that for M-mode the memory type is always defined by
>PMA(s) so if supervisor-mode software overrides memory type using
>Svpbmt then M-mode firmware will not see same contents as the
>supervisor-mode software.

I get the intent now. But we may not want to prohibit that.

We may want to document that the SBI will access this memory using
the PMA attribute. 

If the supervisor has accessed this same location using different 
cachability attribute than the PMA then a loss of coherence or 
unexpected memory ordering may occur and the invoking software 
should follow the rules and sequences defined in the Svpbmt 
specification to prevent the loss of coherence and memory ordering.

This does not place a restriction but warns against the issue and
points to the right sequence if there is a legitimate reason to 
do it.

This should not be specific to this function but applicable to any
function that the SBI defines with a memory operand and so could be
stated more generally in the SBI specification.

regards
ved

