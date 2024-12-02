From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Mon,  2 Dec 2024 11:03:31 +0000
Subject: updated change to build
Message-ID: <20241202110336.332490-1-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Post feedback, this is now a larger series which includes some
fixes for the Makefile to do things like remove any carray files
which didn't create properly and send errors to stderr so they
don't end up in the build output...

Also added an Ubuntu build 'container'.

If the container is useful, I can add documentation on how to
use it.



