From: Vagrant Cascadian <vagrant@reproducible-builds.org>
Date: Thu, 18 Nov 2021 17:05:59 -0800
Subject: [PATCH] reproducible builds: strip embedded file paths
Message-ID: <874k89kl8o.fsf@ponder>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A recent commit 12753d22563f7d2d01f2c6644c7b66b06eb5c90f introduced a
use of __FILE__ to display the file in some debugging output.

Unfortunately, the use of __FILE__ can embed the absolute build path in
the resulting binary, resulting in different binaries depending on which
path the build was performed in.

All previous versions tested in Debian built reproducibly:

  https://tests.reproducible-builds.org/debian/history/amd64/opensbi.html

The attached patch passes -ffile-prefix-map to CFLAGS in the top-level
Makefile, which should strip the top-level build path from the resulting
build. This should be supported in both gcc 8 and clang 10.

This patch was also submitted as a pull request:

  https://github.com/riscv-software-src/opensbi/pull/229


Please CC me with any concerns or questions.


Thanks!


live well,
  vagrant
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Pass-ffile-prefix-map-to-ensure-reproducible-builds-.patch
Type: text/x-diff
Size: 948 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20211118/b4f783cc/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 227 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20211118/b4f783cc/attachment.sig>
