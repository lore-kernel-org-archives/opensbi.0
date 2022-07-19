From: Xiang W <wxjstz@126.com>
Date: Wed, 20 Jul 2022 01:28:55 +0800
Subject: [PATCH v3 01/15] scripts: Add Kconfiglib v14.1.0 under scripts
 directory
In-Reply-To: <20220719131837.2389630-2-apatel@ventanamicro.com>
References: <20220719131837.2389630-1-apatel@ventanamicro.com>
	 <20220719131837.2389630-2-apatel@ventanamicro.com>
Message-ID: <a6f86fe87536a22bd77d645fd29ddf32aa49cc98.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-07-19???? 18:48 +0530?Anup Patel???
> We adopt Kconfiglib v14.1.0 sources under scripts directory so that
> top-level OpenSBI makefile can directly use Kconfiglib scripts without
> expecting users to install a particular version Kconfiglib on their
> build system.
> 
The introduction of kconfiglib is best to use git submodule, which is
convenient for later upgrade.

Regards,
Xiang W




