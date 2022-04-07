From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Thu, 7 Apr 2022 20:37:10 +0200
Subject: Handoff between secure firmware and non-secure Firmware via HOB lists
Message-ID: <26856cc0-367d-6c50-06fb-f3a397c04867@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently the SBI specification defines how to hand device-trees from 
the SEE to the S-mode firmware.

In the context of Trusted Firmware A a document has been developed 
describing what a more generic handover structure may look like that 
will also encompass ACPI tables and additional information like TPM 
measurements.

https://developer.arm.com/documentation/den0135/a

As probably EDK II and U-Boot will adopt parsing this structure it would 
make sense to discuss if the same can be used in the RISC-V world too.

Best regards

Heinrich

