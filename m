From: Xiang W <wxjstz@126.com>
Date: Thu, 08 Dec 2022 23:20:45 +0800
Subject: [PATCH] scripts: use env to invoke bash
In-Reply-To: <20221208133820.1082271-1-hchauhan@ventanamicro.com>
References: <20221208133820.1082271-1-hchauhan@ventanamicro.com>
Message-ID: <6860d8eee60b0a6a9ef4b9678517ed9e2d2f8515.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-12-08???? 19:08 +0530?Himanshu Chauhan???
> Not all systems have bash at a fixed location like /bin/bash.
> FreeBSD, for example, would typically have it at /usr/local/bin/bash.
> When building OpenSBI on freebsd system, the build breaks.
> 
> Its advisable to use: #!/usr/bin/env bash
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
scripts/d2c.sh and scripts/create-binary-archive.sh also need the
same modification.

Regards,
Xiang W
> ---
> ?scripts/carray.sh | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/carray.sh b/scripts/carray.sh
> index 0c52bd6..13f9d36 100755
> --- a/scripts/carray.sh
> +++ b/scripts/carray.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/usr/bin/env bash
> ?
> ?function usage()
> ?{
> -- 
> 2.38.1
> 
> 



