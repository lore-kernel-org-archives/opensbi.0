From: Marouene Boubakri <marouene.boubakri@nxp.com>
Date: Wed, 28 Dec 2022 22:22:48 +0000
Subject: Rethink PMPs assignment #283
Message-ID: <AS1PR04MB94555484A6BE32C8F3E5C4B2FCF29@AS1PR04MB9455.eurprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

My use case is simple, I'm configuring 2 domains, called trusted and untrusted. The trusted memory region starts at 0x82000000 while the untrusted region starts at 0x80200000. The regions does not overlap.
For this use case few PMP entries are needed (considering PMP to protect OpenSBI etc).

This should work fine in platform with 16 PMP entries, however this is not the case. I noticed that running the SW in trusted domain triggers an Illegal Instruction, by debugging it turned out that, OpenSBI writes to non-existing PMP register. Its address is 0x3c0. This is pmpaddr16. However my platform has only 16 PMP entries.

By looking at the code https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_hart.c#L315-L318 The PMP is selected by shifting the desired address.

I guess this should be re-considered. 

Link to the Issue on Github. https://github.com/riscv-software-src/opensbi/issues/283

Thanks
Maro


