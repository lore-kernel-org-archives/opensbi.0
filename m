From: Heiko Stübner <heiko@sntech.de>
Date: Wed, 01 Jun 2022 16:30:35 +0200
Subject: console putchar/getchar ecalls and sbi v02
Message-ID: <2594568.q0ZmV6gNhb@diego>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I just stumbled across the issue that the console_putchar and _getchar
ecalls are only part of the v0.1 specification and the spec states that
they "are expected to be deprecated; they have no replacement."

As I was using that for their earlycon functionality for a bit and haven't
found the reasoning behind the deprecation so far, I guess I'm curious
why it is going away :-) .

The commit adding the spec-note [0] also gives no explanation for it
and Google also wasn't helpful.

Any hints?


Thanks
Heiko



[0] https://github.com/riscv-non-isa/riscv-sbi-doc/commit/705e9556d25dc070926b99f8ccbcdc5073407447



