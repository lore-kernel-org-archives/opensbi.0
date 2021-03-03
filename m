From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Wed, 3 Mar 2021 08:15:17 +0100
Subject: OpenSBI system reset device tree binding
Message-ID: <a2837398-bee2-e2a0-3c06-3f134a26b243@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Anup,

now that we have the system reset extension in OpenSBI the next logical
step for me would be to implement a U-Boot driver using it to provide
the UEFI ResetSystem() runtime service.

Similarly a reset driver could be built into Linux.

First thing that is needed is a device tree binding describing that we
have an OpenSBI system reset available for the board. A comparable
binding exists in the ARM world for PSCI. Cf.
Documentation/devicetree/bindings/arm/psci.yaml in the Linux code.

Has such a binding been defined for OpenSBI yet?

Best regards

Heinrich

