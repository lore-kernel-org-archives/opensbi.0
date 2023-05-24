From: Conor Dooley <conor@kernel.org>
Date: Wed, 24 May 2023 15:46:01 +0100
Subject: [RFC PATCH 2/2] lib: reset: thead: Correct the naming convention
 of dts
In-Reply-To: <CAJF2gTQPyyi5twqdboo=4t0KgP0RqgOpqd0PX239PQZKC-Z8Uw@mail.gmail.com>
References: <20230523094649.4100554-1-guoren@kernel.org>
 <20230523094649.4100554-3-guoren@kernel.org>
 <20230523-manatee-providing-77413fac0c58@spud>
 <CAJF2gTSR1LzGyzxLWWst+4M_nKWXBA=v8=zY-42-ODGU_aO-Lg@mail.gmail.com>
 <20230524-vertebrae-slip-84584f5bb65b@wendy>
 <CAJF2gTQPyyi5twqdboo=4t0KgP0RqgOpqd0PX239PQZKC-Z8Uw@mail.gmail.com>
Message-ID: <20230524-claw-obligate-e4815c3e232b@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 24, 2023 at 06:39:47PM +0800, Guo Ren wrote:

> We remove reset-ctrl-val, but still keep csr-copy. Because it contains
> the index, not value. It didn't viloate anything. okay?

If it is set per-soc, which apparently it is, then you don't need to
fill the values into a property to communicate it to software because
you already have a compatible that tells you exactly what implementation
you have. Just like it is normal for a driver to use #defines etc for
register access, since it knows those registers exist on a particular
implementation. I don't know what OpenSBI calls this, but in Linux it
is called match_data.
Either way - we are just going around in circles here :)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230524/e2741170/attachment.sig>
