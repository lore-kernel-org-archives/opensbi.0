From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Wed, 19 Aug 2020 09:41:43 +0200
Subject: K210 device tree
Message-ID: <88fefe7f-3899-ddf6-a581-7d134b12c64a@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Sean,

up to now separate device trees for the Kendryte K210 have been
developed for OpenSBI, U-Boot, Linux.

U-Boot can be booted with a device-tree provided by OpenSBI using
CONFIG_OF_PRIOR_STAGE=y in U-Boot.

Linux can also receive a device-tree from firmware.

So wouldn't it make sense to move all the K210 device-tree development
into OpenSBI?

Best regards

Heinrich

