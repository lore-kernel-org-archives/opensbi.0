From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Fri, 23 Apr 2021 16:01:23 +0200
Subject: Firmware update specification
Message-ID: <9ba12988-2c53-b303-84ae-430c1aa37449@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ARM has suggested an API for A/B firmware updates on flash devices
managed by the secure world:

https://armkeil.blob.core.windows.net/developer/Files/pdf/FWU-PSA-A_DEN0118_1.0ALP3.pdf

The license allows implementation on non-ARM systems.

From the view of non-secure firmware like U-Boot, EDK II, LinuxBoot it
would make sense to use the same API for software updates on all platforms.

We could encapsulate the API as an SBI extension.

Are there already similar ideas for RISC-V?
Are we ready to follow ARM's proposal?

Best regards

Heinrich

