From: Xiang W <wxjstz@126.com>
Date: Thu, 08 Jul 2021 20:06:19 +0800
Subject: [PATCH 1/2] docs: Correct a typo in platform_guide.md
In-Reply-To: <20210708110729.7136-1-bmeng.cn@gmail.com>
References: <20210708110729.7136-1-bmeng.cn@gmail.com>
Message-ID: <785345cb43450baf94b66795557a0f3d3a67cb60.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-07-08???? 19:07 +0800?Bin Meng???
> It's riscv-pk, not riskv-pk.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> 
> ?docs/platform_guide.md | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/platform_guide.md b/docs/platform_guide.md
> index 7920fac..df90c6b 100644
> --- a/docs/platform_guide.md
> +++ b/docs/platform_guide.md
> @@ -17,7 +17,7 @@ the supported platforms. These firmwares are linked
> against *libplatsbi.a*.
> ?Firmware binaries are installed in
> ?*<install_directory>/platform/<platform_subdir>/bin*. These
> firmwares can be
> ?used as executable runtime firmwares on the supported platforms as a
> replacement
> -for the legacy *riskv-pk* boot loader (BBL).
> +for the legacy *riscv-pk* boot loader (BBL).
> ?
> ?A complete doxygen-style documentation of *struct sbi_platform* and
> related
> ?APIs is available in the file *include/sbi/sbi_platform.h*.
> -- 
> 2.25.1
> 
> 



