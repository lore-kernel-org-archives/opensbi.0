From: Marouene Boubakri <marouene.boubakri@nxp.com>
Date: Fri, 12 Mar 2021 12:17:32 +0000
Subject: [PATCH] include: headers: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-ID: <AM8PR04MB7780BEF5B73339ECCED9DEAFFC6F9@AM8PR04MB7780.eurprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

GCC has already a predefined macro __ASSEMBLER__ therefore, it can be
used without the need to define a new flag with -D__ASSEMBLY__.
This is useful when adding the library to projects having a build
system such one can build without the need to make changes.
THe build system does not use the Makefile in the sources tree.

