From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Wed, 21 Oct 2020 00:53:32 +0000
Subject: [PATCH] Makefile: Don't specify mabi or march
In-Reply-To: <87h7qpuzg9.fsf@igel.home>
References: <20201019224108.99481-1-alistair.francis@wdc.com>
 <87h7qpuzg9.fsf@igel.home>
Message-ID: <9d47332bf53f7f35034423ed798b214a669ca0a6.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-20 at 09:30 +0200, Andreas Schwab wrote:
> On Okt 19 2020, Alistair Francis wrote:
> 
> > To avoid
> >     can't link double-float modules with soft-float modules
> > errors when building 32-bit openSBI don't specify mabi or march.
> 
> What version of binutils are you using?

I'm using 2.35.

Alistair

> 
> Andreas.
> 
