From: Marouene Boubakri <marouene.boubakri@nxp.com>
Date: Fri, 12 Mar 2021 12:22:42 +0000
Subject: [PATCH] include: headers: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-ID: <AM8PR04MB77803F79BC8AD2231DA3C6CBFC6F9@AM8PR04MB7780.eurprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

GCC has already a predefined macro __ASSEMBLER__ therefore, it can be used without the need to define a new flag with -D__ASSEMBLY__.
This is useful when adding the library to projects having a build system such one can build without the need to make changes.
The build system does not use the Makefile in the sources tree.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-include-headers-Replace-__ASSEMBLY__-with-__ASSEMBLE.patch
Type: application/octet-stream
Size: 4565 bytes
Desc: 0001-include-headers-Replace-__ASSEMBLY__-with-__ASSEMBLE.patch
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20210312/d436f09c/attachment-0001.obj>
