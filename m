From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 3 Mar 2021 09:06:58 +0000
Subject: OpenSBI system reset device tree binding
In-Reply-To: <a2837398-bee2-e2a0-3c06-3f134a26b243@gmx.de>
References: <a2837398-bee2-e2a0-3c06-3f134a26b243@gmx.de>
Message-ID: <DM6PR04MB6201D48C853708356C2ACC488D989@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Heinrich,

> -----Original Message-----
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: 03 March 2021 12:45
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: OpenSBI <opensbi@lists.infradead.org>
> Subject: OpenSBI system reset device tree binding
> 
> Hello Anup,
> 
> now that we have the system reset extension in OpenSBI the next logical
> step for me would be to implement a U-Boot driver using it to provide the
> UEFI ResetSystem() runtime service.

Yes, that's the right way.

> 
> Similarly a reset driver could be built into Linux.

I have already send-out couple of revision of Linux patches.

May be you can review that and take it as reference for U-Boot driver ??

> 
> First thing that is needed is a device tree binding describing that we have an
> OpenSBI system reset available for the board. A comparable binding exists in
> the ARM world for PSCI. Cf.
> Documentation/devicetree/bindings/arm/psci.yaml in the Linux code.

The ARM world is bit different. The PSCI came late in ARM world so they
Have ARM 32bit systems which run without PSCI. Probably, that?s why PSCI
is detected/probed via DT node.

> 
> Has such a binding been defined for OpenSBI yet?

In RISC-V S-mode world, the SBI is assumed to be always there so we
don't need a DT node to detect SBI presence. Instead, we have SBI calls
to get SBI spec version and detect available SBI extensions. This also
simplify Guest/VM DT generation for hypervisors.

Regards,
Anup
